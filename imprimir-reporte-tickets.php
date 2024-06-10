<?php
	include ("inc/funciones.php");

	$desde = $_REQUEST['desde'];
	$hasta = $_REQUEST['hasta'];

	$id_cliente = $_REQUEST['id_cliente'];
	$id_proveedor = $_REQUEST['id_proveedor'];
	$estado = $_REQUEST['estado'];

	$db = DataBase::conectar();

	$mostrar = "AND c.fecha  BETWEEN '$desde' AND '$hasta'";

	if (!empty($id_cliente)) {
		$mostrar .= " AND cl.id_cliente = '$id_cliente'";
	}

	if (!empty($id_proveedor)) {
		$mostrar .= " AND p.id_proveedor = '$id_proveedor'";
	}

	if ($estado=='TODO') {
		$where_estado='';
	}else {
		$where_estado="AND cU.estado='$estado'";
	}


	$db->setQuery("SELECT SQL_CALC_FOUND_ROWS 	t.id_ticket, t.id_cupos_proveedor, t.id_chofer, t.chapa,
									DATE_FORMAT(t.fecha_de_creacion, '%d-%m-%Y') as fecha_de_creacion, t.estado AS estado_ticket, cU.estado as estado_cupo,
									c.ci as ci_chofer, c.nombre as chofer, c.telefono as telefono_chofer,
									cp.id_cupo, cp.id_proveedor,
									p.ruc as ruc_proveedor, p.nombre as proveedor, p.telefono as telefono_proveedor, p.correo as correo_proveedor,
									p.encargado as encargado_proveedor,
									cu.id_cliente, cu.id_puerto, DATE_FORMAT(cu.fecha, '%d-%m-%Y') as fecha_inicio, DATE_FORMAT(cu.fecha_fin, '%d-%m-%Y') as fecha_fin,
									cl.ruc as ruc_cliente, cl.razon_social as cliente, cl.telefono as telefono_cliente, cl.correo as correo_cliente,
									cl.encargado as encargado_cliente,
									pu.puerto
									from tickets t
									left join choferes c on c.id_chofer=t.id_chofer
									left join cupos_proveedor cp on cp.id_cupos_proveedor=t.id_cupos_proveedor
									left join proveedores p on p.id_proveedor=cp.id_proveedor
									left join cupos cu on cu.id_cupo=cp.id_cupo
									left join clientes cl on cl.id_cliente=cu.id_cliente
									left join puertos pu on pu.id_puerto=cu.id_puerto
									where 1=1
									-- $where_estado
									-- $mostrar
									-- ORDER BY c.id_cupo DESC
	");


	//Conceptos
	$conceptos = '';

	$ft = $db->loadObjectList();
	if (empty($ft)){
		$conceptos .= '<tr>
							<td style="text-align: center;" class="tg-0pky" colspan="8">No se encontro registro</td>
					   </tr>';
	}


	foreach($ft as $c){



		$puerto = $c->puerto;
		$cliente = $c->cliente;
		$ruc_cliente = $c->ruc_cliente;
		$fecha_inicio = $c->fecha_inicio;
		$fecha_fin = $c->fecha_fin;
		$cantidad = $c->cantidad;
		$estado = $c->estado_ticket;
		$proveedor = $c->proveedor;
		$cantidad_asignada = $c->cantidad_asignada;
		$chapa = $c->chapa;
		$fecha_de_creacion = $c->fecha_de_creacion;
		$estado_ticket = $c->estado_ticket;
		$chofer = $c->chofer;

		$conceptos .= '<tr>
						<td class="tg-0pky">'.$puerto.'</td>
						<td class="tg-0pky">'.$cliente.'</td>
						<td class="tg-0pky">'.$proveedor.'</td>
						<td class="tg-0pky">'.$fecha_de_creacion.'</td>
						<td class="tg-0pky">'.$chofer.'</td>
						<td class="tg-0pky">'.$chapa.'</td>
						<td class="tg-0pky">'.$fecha_fin.'</td>
						<td class="tg-0pky">'.$estado_ticket.'</td>

					   </tr>';
	}

	require_once 'inc/mpdf/vendor/autoload.php';
	$mpdf = new \Mpdf\Mpdf();
	$mpdf->watermarkImgBehind = true;
	$mpdf->SetHTMLHeader("
	");

	$html = "<head>
	<head>
	<style type='text/css'>
	table {border: none;}

	.tg  {border-collapse:collapse;border-spacing:0;}
	.tg td{border-color:black;border-style:solid;border-width:0px;font-family:Chicago, Geneva, sans-serif;font-size:11px;text-align:center;
	overflow:hidden;padding:10px 5px;word-break:normal;}
	.tg th{border-color:black;border-style:solid;border-width:1px;font-family:Chicago, Geneva, sans-serif;font-size:12px;
	font-weight:normal;overflow:hidden;padding:10px 5px;word-break:normal;}
	.tg .tg-0pky{border-color:inherit;text-align:center;vertical-align:top}
	.tg .tg-x1x1{background-color:#efefef;border-color:inherit;font-weight:bold;text-align:left;text-decoration:underline;
	vertical-align:top}


	.imagen { text-align: center;}
	.logo { height: 50px; width: auto;}
	body{
		 
		 background-image-resolution:300dpi;
		 background-image-resize:6;
		 }
	</style>
	</head>
	<body>
		<div style='margin-top: 100px;' id='content'>
		<img src='dist/images/hoja_membretada.jpg' alt=''>

		<h2 style='text-align: center;'>Reporte de Tickets</h2>
		<hr>
		<br><br>
			<table style='width: 100%; text-align:center; ' class='tg'>
				<thead>
				  <tr>
				  	<td><b>Puerto</b></td>
				  	<td><b>Cliente</b></td>
				  	<td><b>Proveedor</b></td>
				  	<td><b>Fecha de Ingreso</b></td>
				  	<td><b>Chofer</b></td>
				  	<td><b>Chapa</b></td>
				  	<td><b>Fecha Final</b></td>
				  	<td><b>Estado</b></td>
				  </tr>
				</thead>
				<tbody>
					". $conceptos ."
				</tbody>
			</table>
		</div>
	</body>";

	$mpdf->SetWatermarkText("");
	$mpdf->showWatermarkText = true;
	$mpdf->watermarkTextAlpha = 0.2;
	$mpdf->watermark_font = 'Chicago';
	$mpdf->SetJS('this.print();');
	$mpdf->WriteHTML($html);
	$mpdf->Output();

?>
