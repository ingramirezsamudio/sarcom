<?php
header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Headers: Origin, X-Requested-With, cache-control, Content-Type, Accept");
header('Access-Control-Allow-Methods: GET, POST');
	include ("funciones.php");
	$q = $_REQUEST['q'];
	$usuario = $auth->getUsername();
	$id_sucursal = datosUsuario($usuario)->id_sucursal;
	switch ($q){
    case 'ver_datos':
      $db = DataBase::conectar();
			$id_ticket = $db->clearText($_REQUEST['id_ticket']);
			$portero_puerto = $db->clearText($_REQUEST['portero_puerto']);

			$db->setQuery(" SELECT *
											FROM tickets t
											left join cupos_proveedor cp on cp.id_cupos_proveedor=t.id_cupos_proveedor
											left join cupos cu on cu.id_cupo=cp.id_cupo
											where t.id_ticket=$id_ticket
							");
			$row = $db->loadObject();
			$ticket_puerto=$row->id_puerto;

			if ($ticket_puerto==$portero_puerto) {
				// SI EL TICKET CORRESPONDE AL PUERTO...
				$db->setQuery("  SELECT SQL_CALC_FOUND_ROWS 	t.id_ticket, t.id_cupos_proveedor, t.id_chofer, t.chapa, t.fecha_de_creacion, t.estado,
								c.ci as ci_chofer, c.nombre as chofer, c.telefono as telefono_chofer,
															cp.id_cupo, cp.id_proveedor,
															p.ruc as ruc_proveedor, p.nombre as proveedor, p.telefono as telefono_proveedor, p.correo as correo_proveedor, p.encargado as encargado_proveedor,
															cu.id_cliente, cu.id_puerto, DATE_FORMAT(cu.fecha, '%d-%m-%Y') as fecha_inicio, DATE_FORMAT(cu.fecha_fin, '%d-%m-%Y') as fecha_fin,
															cl.ruc as ruc_cliente, cl.razon_social as cliente, cl.telefono as telefono_cliente, cl.correo as correo_cliente, cl.encargado as encargado_cliente,
															pu.puerto
													from tickets t
													left join choferes c on c.id_chofer=t.id_chofer
													left join cupos_proveedor cp on cp.id_cupos_proveedor=t.id_cupos_proveedor
													left join proveedores p on p.id_proveedor=cp.id_proveedor
													left join cupos cu on cu.id_cupo=cp.id_cupo
													left join clientes cl on cl.id_cliente=cu.id_cliente
													left join puertos pu on pu.id_puerto=cu.id_puerto
													where t.id_ticket=$id_ticket
								");
				$rows = $db->loadObjectList();
				echo json_encode($rows);
			}else {
				// SI EL TICKET NO CORRESPONDE AL PUERTO...
				$salida = array('mensaje' => 'NO CORRESPONDE AL PUERTO', 'state' => 'error');
				// echo "NO CORRESPONDE AL PUERTO";
				echo json_encode($salida);

			}
    break;

    case 'registrar_ingreso':
      $db = DataBase::conectar();
      $id_ticket = $db->clearText($_REQUEST['id_ticket']);


      $db->setQuery("UPDATE tickets SET estado='UTILIZADO', fecha_de_ingreso=NOW()
                      WHERE id_ticket = '$id_ticket'");

      if(!$db->alter()){
        echo "Error. ". $db->getError();
      }else{
        echo "EL CUPO HA SIDO MARCADO COMO UTILIZADO";
      }
    break;

		case 'reportar':
      $db = DataBase::conectar();
			$id_ticket = $db->clearText($_REQUEST['id_ticket']);
			$puerto_portero = $db->clearText($_REQUEST['puerto']);

			$db->setQuery("  SELECT SQL_CALC_FOUND_ROWS 	t.id_ticket, t.id_cupos_proveedor, t.id_chofer, t.chapa, t.fecha_de_creacion, t.estado,
							c.ci as ci_chofer, c.nombre as chofer, c.telefono as telefono_chofer,
														cp.id_cupo, cp.id_proveedor,
														p.ruc as ruc_proveedor, p.nombre as proveedor, p.telefono as telefono_proveedor, p.correo as correo_proveedor, p.encargado as encargado_proveedor,
														cu.id_cliente, cu.id_puerto,  DATE_FORMAT(cu.fecha, '%d-%m-%Y') as fecha_inicio, DATE_FORMAT(cu.fecha_fin, '%d-%m-%Y') as fecha_fin,
														cl.ruc as ruc_cliente, cl.razon_social as cliente, cl.telefono as telefono_cliente, cl.correo as correo_cliente, cl.encargado as encargado_cliente,
														pu.puerto
												from tickets t
												left join choferes c on c.id_chofer=t.id_chofer
												left join cupos_proveedor cp on cp.id_cupos_proveedor=t.id_cupos_proveedor
												left join proveedores p on p.id_proveedor=cp.id_proveedor
												left join cupos cu on cu.id_cupo=cp.id_cupo
												left join clientes cl on cl.id_cliente=cu.id_cliente
												left join puertos pu on pu.id_puerto=cu.id_puerto
												where t.id_ticket='$id_ticket'
							");
			$row = $db->loadObject();
			$estado=$row->estado;
			$puerto=$row->puerto;
			$fecha_inicio=$row->fecha_inicio;
			$fecha_fin=$row->fecha_fin;
			$chofer=$row->chofer;
			$ci_chofer=$row->ci_chofer;
			$chapa=$row->chapa;
			$telefono_chofer=$row->telefono_chofer;
			$proveedor=$row->proveedor;
			$ruc_proveedor=$row->ruc_proveedor;
			$telefono_proveedor=$row->telefono_proveedor;
			$correo_proveedor=$row->correo_proveedor;
			$encargado_proveedor=$row->encargado_proveedor;


			if (enviar_reporte($id_ticket,$puerto_portero,$estado,$puerto,$fecha_inicio,$fecha_fin,$chofer,$ci_chofer,$chapa,$telefono_chofer,$proveedor,$ruc_proveedor,$telefono_proveedor,$correo_proveedor,$encargado_proveedor)) {
				echo "Reporte enviado<br>";
				echo "$puerto_portero";
			}else {
				echo "Error en el envio del Reporte";
			}

    break;


  }




	function enviar_reporte($id_ticket,$puerto_portero,$estado,$puerto,$fecha_inicio,$fecha_fin,$chofer,$ci_chofer,$chapa,$telefono_chofer,$proveedor,$ruc_proveedor,$telefono_proveedor,$correo_proveedor,$encargado_proveedor) {
		$to = 'mauramirez93@gmail.com';
		$subject = "SARCOM - Reporte de Ticket";

		$txt = '
			<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//ES" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
			<html>
			<head>
				<meta charset="UTF-8">
				<meta content="width=device-width, initial-scale=1" name="viewport">
				<meta name="x-apple-disable-message-reformatting">
				<meta http-equiv="X-UA-Compatible" content="IE=edge">
				<meta content="telephone=no" name="format-detection">
				<title></title>
				</style>
			</head>
			<body style="color: #ffffff; background-color: #f8f9fa; margin: 0; padding: 0; font-size: 16px; font-family: Helvetica, sans-serif;">
				<div style="min-width: 300px; max-width: 400px; width: 50%; padding: 0; margin:auto; background-color:#542693;">
					<div style="height: 100px; background-color: #ffffff; display: flex;">
						<img style="margin: auto; height: 66px;" src="http://sarcom.namandu.com/dist/images/logo-icon.png">
					</div>
					<div style="height: auto; margin: 0; padding: 0;">
						<div style="display: flex; margin: 0; padding: 0;">
							<h1 style="text-align: center; margin: 20px auto;">Reporte del ticket Nro:</h1>
						</div>
						<div style="display: flex;  margin: 0; padding: 0;">
							<h3 style="text-align:center; padding: 10px 100px; border-radius: 5px; margin: 20px auto; background-color: #ffffff; color: #111111;">'
								.$id_ticket.'</h3>
							<hr>
							<h4>Puerto: '.$puerto_portero.'</h4>
							<h4>Fecha de Inicio: '.$fecha_inicio.'</h4>
							<h4>Fecha de Fin:'.$fecha_fin.'</h4>
							<h4>Estado:'.$estado.'</h4>
							<hr>
							<h4>Chofer:'.$chofer.'</h4>
							<h4>C.I. Chofer:'.$ci_chofer.'</h4>
							<h4>Telefono del Chofer:'.$telefono_chofer.'</h4>
							<h4>Chapa:'.$chapa.'</h4>
							<hr>
							<h4>Proveedor:'.$proveedor.'</h4>
							<h4>RUC del Proveedor:'.$ruc_proveedor.'</h4>
							<h4>Telefono del Proveedor:'.$telefono_proveedor.'</h4>
							<h4>Correo del Proveedor:'.$correo_proveedor.'</h4>
							<h4>Encargado del Proveedor :'.$encargado_proveedor.'</h4>
						</div>
						<div style="margin: 30px; padding: 0;">
							<p>
							</p>
						</div>
					</div>
				</div>
			</body>
			</html>
		';

		$headers =  "From: sarcomapp@namandu.com" . "\r\n" .
					"Content-type: text/html" . "\r\n" .
					"CC: somebodyelse@example.com";

		// retorna true o false
		return mail($to,$subject,$txt,$headers);
	}
  ?>
