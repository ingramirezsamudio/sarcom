<?php
	include ("inc/funciones.php");

	$desde = $_REQUEST['desde'];
	$hasta = $_REQUEST['hasta'];
	
	$id_cliente = $_REQUEST['id_cliente'];
	$id_repartidor = $_REQUEST['id_repartidor'];
	$ruc_usuario = $_REQUEST['ruc_usuario'];
	
	$db = DataBase::conectar();

	$mostrar = "AND lp.fecha_tope  BETWEEN '$desde' AND '$hasta'";

	// if (!empty($id_cliente)) { 
	// 	$mostrar .= " AND l.id_entidad = '$id_cliente'"; 
	// }

	// if (!empty($id_repartidor)) { 
	// 	$mostrar .= " AND l.id_repartidor = '$id_repartidor'"; 
	// }

	// if (!empty($ruc_usuario)) { 
	// 	$mostrar .= " AND lp.ruc = '$ruc_usuario'"; 
	// }
	
	// if (!empty($_REQUEST['id_cliente'])) { $where = "AND lp.fecha_entrega  BETWEEN '$desde' AND '$hasta' AND l.id_entidad = '$id_cliente'"; }
	// if (!empty($_REQUEST['id_repartidor'])) { $where = "AND lp.fecha_entrega  BETWEEN '$desde' AND '$hasta' AND l.id_repartidor = '$id_repartidor'"; }
	// if (!empty($_REQUEST['ruc_usuario'])) { $where = "AND lp.fecha_entrega  BETWEEN '$desde' AND '$hasta' AND lp.ruc = '$ruc_usuario'"; }

	// if (!empty($_REQUEST['id_cliente']) && !empty($_REQUEST['id_repartidor'])) { $where = "AND lp.fecha_entrega  BETWEEN '$desde' AND '$hasta' AND l.id_entidad = '$id_cliente' AND l.id_repartidor = '$id_repartidor'"; }
	// if (!empty($_REQUEST['id_repartidor']) && !empty($_REQUEST['ruc_usuario'])) { $where = "AND lp.fecha_entrega  BETWEEN '$desde' AND '$hasta' AND l.id_repartidor = '$id_repartidor' AND lp.ruc = '$ruc_usuario'"; }
	// if (!empty($_REQUEST['id_cliente']) && !empty($_REQUEST['ruc_usuario'])) { $where = "AND lp.fecha_entrega  BETWEEN '$desde' AND '$hasta' AND l.id_entidad = '$id_cliente' AND lp.ruc = '$ruc_usuario'"; }
	
	// if (!empty($_REQUEST['id_cliente']) && !empty($_REQUEST['id_repartidor']) && !empty($_REQUEST['ruc_usuario'])) { $where = "AND lp.fecha_entrega  BETWEEN '$desde' AND '$hasta' AND l.id_entidad = '$id_cliente' AND l.id_repartidor = '$id_repartidor' AND lp.ruc = '$ruc_usuario'"; }



	$db->setQuery("SELECT SQL_CALC_FOUND_ROWS lp.id_lote AS nro_lote, l.cantidad_actual, COUNT( lp.id_lote ) AS cantidad_entregado,
        ROUND((COUNT( lp.id_lote ) * 100) / l.cantidad_actual, 0) AS porcentaje, l.encargado, r.nombre AS proveedor,
        DATE_FORMAT(lp.fecha_tope, '%Y/%m/%d') AS fecha_tope, c.razon_social AS entidad
        FROM lista_pedidos lp
        LEFT JOIN lotes l ON l.id_lote=lp.id_lote 
        LEFT JOIN repartidores r ON l.id_repartidor=r.id_repartidor
        LEFT JOIN clientes c ON l.id_entidad=c.id_cliente
        WHERE 1=1 AND lp.estado='ENTREGADO'
        $mostrar 
        GROUP BY lp.id_lote
        ORDER BY lp.fecha_tope DESC
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

		$nro_lote = $c->nro_lote;
		$encargado = $c->encargado;
		$proveedor = $c->proveedor;	 
		$porcentaje = $c->porcentaje;
		$entidad = $c->entidad;
		$fecha_tope = $c->fecha_tope;
		$conceptos .= '<tr>
						<td class="tg-0pky">'.$nro_lote.'</td>
						<td class="tg-0pky">'.$encargado.'</td>
						<td class="tg-0pky">'.$proveedor.'</td>
						<td class="tg-0pky">'.$porcentaje.'</td>
						<td class="tg-0pky">'.$fecha_tope.'</td>
						<td class="tg-0pky">'.$entidad.'</td>
					   </tr>';
	}
  
	
	
	//http://2b.namandu.com/presupuestos
	
	require_once 'incmpdf/vendor/autoload.php';
	$mpdf = new \Mpdf\Mpdf();
	$mpdf->watermarkImgBehind = true;
	
	$mpdf->SetHTMLHeader("
	");


	$html = "<head>
	<head>
	<style type='text/css'>
	table {border: none;}

	.tg  {border-collapse:collapse;border-spacing:0;}
		.tg td{border-color:black;border-style:solid;border-width:0px;font-family:Chicago, Geneva, sans-serif;font-size:14px;
		  overflow:hidden;padding:10px 5px;word-break:normal;}
		.tg th{border-color:black;border-style:solid;border-width:1px;font-family:Chicago, Geneva, sans-serif;font-size:14px;
		  font-weight:normal;overflow:hidden;padding:10px 5px;word-break:normal;}
		.tg .tg-0pky{border-color:inherit;text-align:left;vertical-align:top}
		.tg .tg-x1x1{background-color:#efefef;border-color:inherit;font-weight:bold;text-align:left;text-decoration:underline;
		  vertical-align:top}


	.imagen { text-align: center;} 
	.logo { height: 50px; width: auto;}
	body{
		 background:url(/dist/images/hoja_membretada.jpg) no-repeat;
		 background-image-resolution:300dpi;
		 background-image-resize:6;
		 }

	


	</style>
	</head>
	<body>
		<div style='margin-top: 100px;' id='content'>
		<h1>Informes de lotes</h1>
		<hr>
		<br><br>
			<table style='width: 100%;' class='tg'>
				<thead>
				  <tr>
				  	<td>Nro. Lote</td>
				  	<td>Encargado</td>
				  	<td>Repartidor</td>
				  	<td>Porcentaje</td>
				  	<td>Fecha Tope</td>
				  	<td>Entidad</td>
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
	$mpdf->watermark_font = 'Arial';
	$mpdf->SetJS('this.print();');
	$mpdf->WriteHTML($html);
	$mpdf->Output();

?>


	  
