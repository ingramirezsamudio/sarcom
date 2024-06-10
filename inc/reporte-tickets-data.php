<?php
header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Headers: Origin, X-Requested-With, cache-control, Content-Type, Accept");
header('Access-Control-Allow-Methods: GET, POST');
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
					$where_estado='';// code...
				}else {
					$where_estado="and cu.estado='$estado'";
				}
				if ($estado_ticket=='TODO') {
					$where_estado_ticket='';
				}else {
					$where_estado_ticket="and t.estado='$estado_ticket'";
				}
				$where = "";
				$mostrar = "AND t.fecha_de_creacion  BETWEEN '$desde' AND '$hasta'";

				if ($id_cliente != 'null') {
						$mostrar .= " AND cl.id_cliente = '$id_cliente'";
				}

				if ($id_proveedor != 'null') {
						$mostrar .= " AND p.id_proveedor = '$id_proveedor'";
				}

				$limit = $_REQUEST['limit'];
				$offset	= $_REQUEST['offset'];
				$order = $_REQUEST['order'];
				$sort = $_REQUEST['sort'];
				if (!isset($sort)) $sort = 2;

				if (isset($_REQUEST['search']) && !empty($_REQUEST['search'])){
						$search = $_REQUEST['search'];
						$where = " AND CONCAT_WS(' ') LIKE '%$search%'";
				}


					$db->setQuery("SELECT SQL_CALC_FOUND_ROWS 	t.id_ticket, t.id_cupos_proveedor, t.id_chofer, t.chapa,
								DATE_FORMAT(t.fecha_de_creacion, '%d-%m-%Y') as fecha_de_creacion, t.estado AS estado_ticket, cu.estado as estado_cupo,
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
														$mostrar
														$where
														$where_estado $where_estado_ticket
					-- ORDER BY $sort $order
					-- LIMIT $offset, $limit
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
  }
  ?>
