<?php
	include ("inc/funciones.php");

	$desde = $_REQUEST['desde'];
	$hasta = $_REQUEST['hasta'];
	$id_cupo = $_REQUEST['id_cupo'];
	$id_cliente = $_REQUEST['id_cliente'];
	$estado = $_REQUEST['estado'];


	$db = DataBase::conectar();

	$mostrar = "AND c.fecha  BETWEEN '$desde' AND '$hasta'";


	if (!empty($id_cliente)) {
		$mostrar .= " AND cl.id_cliente = '$id_cliente'";
	}
	if ($estado=='TODO') {
		$where_estado='';
	}else {
		$where_estado="and c.estado='$estado'";
	}




	$db->setQuery("SELECT SQL_CALC_FOUND_ROWS  c.id_cupo, c.id_cliente, c.id_puerto, DATE_FORMAT(c.fecha , '%d-%m-%Y') as fecha_inicio, DATE_FORMAT(c.fecha_fin , '%d-%m-%Y') as fecha_fin, c.cantidad, c.estado as estado_cupo,
								cl.ruc as ruc_cliente, cl.razon_social as cliente,
								p.puerto, count(t.id_cupos_proveedor) as cantidad_asignada
								from cupos c
								left join clientes cl on cl.id_cliente=c.id_cliente
								left join puertos p on p.id_puerto=c.id_puerto
								left join cupos_proveedor cp on cp.id_cupo=c.id_cupo
								left join tickets t on t.id_cupos_proveedor=cp.id_cupos_proveedor
								-- left join cupos_proveedor cp on cp.id_cupo=c.id_cupo
								-- left join proveedores pr on pr.id_proveedor=cp.id_proveedor
								where 1=1
								$mostrar
								$where
								$where_estado
								-- $where_estado_ticket
								group by c.id_cupo
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
		$fecha = $c->fecha_inicio;
		$fecha_fin = $c->fecha_fin;
		$cantidad = $c->cantidad;
		$estado = $c->estado_cupo;
		$proveedor = $c->proveedor;
		$cantidad_asignada = $c->cantidad_asignada;
		$conceptos .= '<tr>
						<td class="tg-0pky">'.$puerto.'</td>
						<td class="tg-0pky">'.$cliente.'</td>
						<td class="tg-0pky">'.$ruc_cliente.'</td>
						<td class="tg-0pky">'.$fecha.'</td>
						<td class="tg-0pky">'.$fecha_fin.'</td>
						<td class="tg-0pky">'.$cantidad.'</td>
						<td class="tg-0pky">'.$estado.'</td>
						<td class="tg-0pky">'.$cantidad_asignada.'</td>
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

		<h2 style='text-align: center;'>Reporte de Asignación</h2>
		<hr>
		<br><br>
			<table style='width: 100%; text-align:center; ' class='tg'>
				<thead>
				  <tr>
				  	<td><b>Puerto</b></td>
				  	<td><b>Cliente</b></td>
				  	<td><b>RUC</b></td>
				  	<td><b>Fecha Inicial</b></td>
				  	<td><b>Fecha Final</b></td>
				  	<td><b>Cupos Disp.</b></td>
				  	<td><b>Estado</b></td>
				  	<td><b>Cupos ya Asignados</b></td>
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
