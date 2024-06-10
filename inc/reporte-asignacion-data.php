<?php
	include ("funciones.php");
	$q = $_REQUEST['q'];
	$usuario = $auth->getUsername();
	$id_sucursal = datosUsuario($usuario)->id_sucursal;
	switch ($q){
		case 'ver':

				$db = DataBase::conectar();
				$desde = $_REQUEST['desde'];
				$hasta = $_REQUEST['hasta'];
				$id_cliente = $_REQUEST['id_cliente'];
				$id_clientex = $_REQUEST['id_clientex'];
				$id_proveedor = $_REQUEST['id_proveedor'];
				$estado = $_REQUEST['estado'];
				$estado_ticket = $_REQUEST['estado_ticket'];
				if ($estado=='TODO') {
					$where_estado='';
				}else {
					$where_estado="and c.estado='$estado'";
				}
				if ($estado_ticket=='TODO') {
					$where_estado_ticket='';// code...
				}else {
					//$where_estado_ticket="and t.estado='$estado_ticket'";// code...
				}
				$where = "";
				$mostrar = "AND c.fecha_fin  BETWEEN '$desde' AND '$hasta'";

				if ($id_cliente != 'null') {
						$mostrar .= " AND cl.id_cliente = '$id_cliente'";
				}

				// if ($id_proveedor != 'null') {
				// 		$mostrar .= " AND p.id_proveedor = '$id_proveedor'";
				// }

				$limit = $_REQUEST['limit'];
				$offset	= $_REQUEST['offset'];
				$order = $_REQUEST['order'];
				$sort = $_REQUEST['sort'];
				if (!isset($sort)) $sort = 2;

				if (isset($_REQUEST['search']) && !empty($_REQUEST['search'])){
						$search = $_REQUEST['search'];
						$where = " AND CONCAT_WS(' ') LIKE '%$search%'";
				}


					$db->setQuery("SELECT SQL_CALC_FOUND_ROWS  c.id_cupo, c.id_cliente, c.id_puerto, DATE_FORMAT(c.fecha, '%d-%m-%Y') as fecha_inicio, DATE_FORMAT(c.fecha_fin, '%d-%m-%Y') as fecha_fin, c.cantidad, c.estado as estado_cupo,
												cl.ruc as ruc_cliente, cl.razon_social as cliente,
												p.puerto
												from cupos c
												left join clientes cl on cl.id_cliente=c.id_cliente
												left join puertos p on p.id_puerto=c.id_puerto
												-- left join cupos_proveedor cp on cp.id_cupo=c.id_cupo
												-- left join proveedores pr on pr.id_proveedor=cp.id_proveedor
												where 1=1
												$mostrar
												$where
												$where_estado
												-- $where_estado_ticket
												group by c.id_cupo

												ORDER BY $sort $order
												LIMIT $offset, $limit
					");

				$rows = $db->loadObjectList();

				$db->setQuery("SELECT FOUND_ROWS() as total");
				$total_row = $db->loadObject();
				$total = $total_row->total;

				if ($rows){
						$salida = array('total' => $total, 'rows' => $rows);
				}else{
						$salida = array('total' => 0, 'rows' => array());
				}

				echo json_encode($salida);

		break;



		case 'ver_cupos_proveedor':

				$db = DataBase::conectar();
				$id_cupo = $_REQUEST['id_cupo'];


				$db->setQuery("SELECT SQL_CALC_FOUND_ROWS  cp.id_cupos_proveedor, cp.id_cupo, cp.id_proveedor, cp.cantidad as cantidad_disponible, cp.cantidad_asignada as cantidad_asignada , cp.estado as estado_cupo_proveedor,
											DATE_FORMAT(c.fecha, '%d-%m-%Y') as fecha_inicio, DATE_FORMAT(c.fecha_fin, '%d-%m-%Y') as fecha_fin,
											p.ruc as ruc_proveedor, p.nombre as proveedor
											from cupos_proveedor cp
											left join cupos c on c.id_cupo=cp.id_cupo
											left join proveedores p on p.id_proveedor=cp.id_proveedor
											where cp.id_cupo='$id_cupo'
											");

				$rows = $db->loadObjectList();
				$db->setQuery("SELECT FOUND_ROWS() as total");
				$total_row = $db->loadObject();
				$total = $total_row->total;
				if ($rows){
						$salida = array('total' => $total, 'rows' => $rows);
				}else{
						$salida = array('total' => 0, 'rows' => array());
				}
				echo json_encode($salida);
		break;

		case 'ver_tickets':

				$db = DataBase::conectar();
				$id_cupos_proveedor = $_REQUEST['id_cupos_proveedor'];

				$db->setQuery("SELECT SQL_CALC_FOUND_ROWS  t.id_ticket, t.id_cupos_proveedor, t.id_chofer, t.chapa, DATE_FORMAT(t.fecha_de_creacion, '%d-%m-%Y') as fecha_de_creacion, t.estado as estado_ticket,
												ch.id_proveedor, pr.nombre as proveedor,ch.ci, ch.nombre as chofer, ch.telefono,
												cp.id_cupo as cupo_nro
												from tickets t
												left join choferes ch on ch.id_chofer=t.id_chofer
												left join cupos_proveedor cp on cp.id_cupos_proveedor=t.id_cupos_proveedor
												left join proveedores pr on pr.id_proveedor=cp.id_proveedor

											where cp.id_cupos_proveedor='$id_cupos_proveedor'
											");

				$rows = $db->loadObjectList();
				$db->setQuery("SELECT FOUND_ROWS() as total");
				$total_row = $db->loadObject();
				$total = $total_row->total;
				if ($rows){
						$salida = array('total' => $total, 'rows' => $rows);
				}else{
						$salida = array('total' => 0, 'rows' => array());
				}
				echo json_encode($salida);
		break;







		case 'descargar_reporte_excel':
			$db = DataBase::conectar();
			$desde = $_REQUEST['desde']." 00:00:00";
			$hasta = $_REQUEST['hasta']." 23:59:59";
			$id_cliente = $_REQUEST['id_cliente'];
			$estado = $_REQUEST['estado'];


			$mostrar = "AND c.fecha  BETWEEN '$desde' AND '$hasta'";
			if ($id_cliente=='null') {
				//
			}else {
				$mostrar .= " AND cl.id_cliente = '$id_cliente'";
			}
			if ($estado=='TODO') {
				$where_estado='';
			}else {
				$where_estado="and c.estado='$estado'";
			}



			$nombre="reporte_asignacion_".fechaLatina($desde)."_al_".fechaLatina($hasta);
			header('Content-type: application/vnd.ms-excel');
			header("Content-Disposition: attachment; filename=$nombre.xls");
			header("Pragma: no-cache");
			header("Expires: 0");

			$db->setQuery("SELECT SQL_CALC_FOUND_ROWS  c.id_cupo, c.id_cliente, c.id_puerto, DATE_FORMAT(c.fecha , '%d-%m-%Y') as fecha_inicio, DATE_FORMAT(c.fecha_fin , '%d-%m-%Y') as fecha_fin, c.cantidad, c.estado as estado_cupo,
										cl.ruc as ruc_cliente, cl.razon_social as cliente,
										p.puerto, count(t.id_cupos_proveedor) as cantidad_asignada
										from cupos c
										left join clientes cl on cl.id_cliente=c.id_cliente
										left join puertos p on p.id_puerto=c.id_puerto
										left join cupos_proveedor cp on cp.id_cupo=c.id_cupo
										left join tickets t on t.id_cupos_proveedor=cp.id_cupos_proveedor
										where 1=1
										$mostrar
										$where_estado
										group by c.id_cupo
			");
			$rows = $db->loadObjectList();

			echo "<meta charset='utf-8'>
					<table border=1>
						<tr>
						<th>Puerto</th>
						<th>Cliente</th>
						<th>RUC del Cliente</th>
							<th>Fecha de Inicio</th>
							<th>Fecha Fin</th>
							<th>Cantidad Disponible</th>
							<th>Estado del Cupo</th>
							<th>Cantidad ya Asignada</th>
						</tr>";

			foreach ($rows as $r){
				$id_cupo = $r->id_cupo;
				$id_cliente = $r->id_cliente;
				$id_puerto = $r->id_puerto;
				$fecha_inicio = $r->fecha_inicio;
				$fecha_fin = $r->fecha_fin;
				$cantidad = $r->cantidad;
				$estado_cupo = $r->estado_cupo;
				$ruc_cliente = $r->ruc_cliente;
				$cliente = $r->cliente;
				$puerto = $r->puerto;
				$cantidad_asignada = $r->cantidad_asignada;


				echo "<tr>
				<td>$puerto</td>
				<td>$cliente</td>
				<td>$ruc_cliente</td>
					<td>$fecha_inicio</td>
					<td>$fecha_fin</td>
					<td>$cantidad</td>
					<td>$estado_cupo</td>
					<td>$cantidad_asignada</td>
				</tr>";

			}

			echo "</table>";
		break;











		case 'descargar_reporte_tickets_excel':
			$db = DataBase::conectar();
			$desde = $_REQUEST['desde']." 00:00:00";
			$hasta = $_REQUEST['hasta']." 23:59:59";
			$id_cupo_proveedor = $_REQUEST['id_cupo_proveedor'];


			$mostrar = "AND c.fecha  BETWEEN '$desde' AND '$hasta'";


			$nombre="reporte_asignacion_tickets".fechaLatina($desde)."_al_".fechaLatina($hasta);
			header('Content-type: application/vnd.ms-excel');
			header("Content-Disposition: attachment; filename=$nombre.xls");
			header("Pragma: no-cache");
			header("Expires: 0");

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
											AND t.id_cupos_proveedor=$id_cupo_proveedor
			");
			$rows = $db->loadObjectList();

			echo "<meta charset='utf-8'>
					<table border=1>
						<tr>
						<th>Puerto</th>
						<th>Cliente</th>
						<th>Proveedor</th>
						<th>Fecha de Creación</th>
						<th>Chofer</th>
						<th>Chapa</th>
						<th>Fecha Final</th>
						<th>Estado del Ticket</th>
						</tr>";

			foreach ($rows as $r){
				$chapa = $r->chapa;
				$fecha_de_creacion = $r->fecha_de_creacion;
				$estado_ticket = $r->estado_ticket;
				$chofer = $r->chofer;
				$proveedor = $r->proveedor;
				$fecha_inicio = $r->fecha_inicio;
				$fecha_fin = $r->fecha_fin;
				$puerto = $r->puerto;
				$cliente = $r->cliente;



				echo "<tr>
				<td>$puerto</td>
				<td>$cliente</td>
				<td>$proveedor</td>
					<td>$fecha_de_creacion</td>
					<td>$chofer</td>
					<td>$chapa</td>
					<td>$fecha_fin</td>
					<td>$estado_ticket</td>
				</tr>";

			}

			echo "</table>";
		break;








		case 'descargar_reporte_cupos_excel':
			$db = DataBase::conectar();
			$desde = $_REQUEST['desde']." 00:00:00";
			$hasta = $_REQUEST['hasta']." 23:59:59";
			$id_cupo = $_REQUEST['id_cupo'];


			$mostrar = "AND c.fecha  BETWEEN '$desde' AND '$hasta'";


			$nombre="reporte_asignacion_cupos".fechaLatina($desde)."_al_".fechaLatina($hasta);
			header('Content-type: application/vnd.ms-excel');
			header("Content-Disposition: attachment; filename=$nombre.xls");
			header("Pragma: no-cache");
			header("Expires: 0");

			$db->setQuery("SELECT SQL_CALC_FOUND_ROWS 	c.id_cupo, c.id_cliente, c.id_puerto, DATE_FORMAT(c.fecha, '%d-%m-%Y') as fecha_inicio, DATE_FORMAT(c.fecha_fin, '%d-%m-%Y') as fecha_fin, c.id_proveedor, c.cantidad,
												cp.id_cupos_proveedor, cp.cantidad as cantidad_asignada, c.estado,
												cl.ruc as ruc_cliente, cl.razon_social as cliente, cl.direccion as direccion_cliente, cl.telefono as telefono_cliente, cl.correo as correo_cliente, cl.encargado as encargado_cliente,
												p.ruc as ruc_proveedor, p.nombre as proveedor, p.direccion as direccion_proveedor, p.telefono as telefono_proveedor, p.correo as correo_proveedor, p.encargado as encargado_proveedor,
												pu.puerto
											from cupos c
											left join cupos_proveedor cp on cp.id_cupo=c.id_cupo
											left join clientes cl on cl.id_cliente=c.id_cliente
											left join proveedores p on p.id_proveedor=cp.id_proveedor
											left join puertos pu on pu.id_puerto=c.id_puerto
											where 1=1
											AND c.id_cupo=$id_cupo
			");
			$rows = $db->loadObjectList();

			echo "<meta charset='utf-8'>
					<table border=1>
						<tr>
						<th>Puerto</th>
						<th>Cliente</th>
						<th>RUC del Cliente</th>
							<th>Fecha de Inicio</th>
							<th>Fecha Fin</th>
							<th>Cupos Disponibles</th>
							<th>Estado del Cupo</th>
							<th>Proveedor</th>
							<th>Cantidad ya Asignada</th>
						</tr>";

			foreach ($rows as $r){
				$id_cupo = $r->id_cupo;
				$id_cliente = $r->id_cliente;
				$id_puerto = $r->id_puerto;
				$fecha_inicio = $r->fecha_inicio;
				$fecha_fin = $r->fecha_fin;
				$cantidad = $r->cantidad;
				$estado_cupo = $r->estado_cupo;
				$ruc_cliente = $r->ruc_cliente;
				$cliente = $r->cliente;
				$puerto = $r->puerto;
				$proveedor = $r->proveedor;
				$cantidad_asignada = $r->cantidad_asignada;


				echo "<tr>
				<td>$puerto</td>
				<td>$cliente</td>
				<td>$ruc_cliente</td>
					<td>$fecha_inicio</td>
					<td>$fecha_fin</td>
					<td>$cantidad</td>
					<td>$estado_cupo</td>
					<td>$proveedor</td>
					<td>$cantidad_asignada</td>
				</tr>";

			}

			echo "</table>";
		break;

  }
  ?>
