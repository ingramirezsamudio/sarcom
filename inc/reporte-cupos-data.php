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
				if ($estado=='TODO') {
					$where_estado='';// code...
				}else {
					$where_estado="AND c.estado='$estado'";// code...
				}
				$where = "";
				$mostrar = "AND c.fecha  BETWEEN '$desde' AND '$hasta'";

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
						$where = " AND CONCAT_WS(' ', cl.razon_social, p.nombre, c.estado, pu.puerto) LIKE '%$search%'";
				}


					$db->setQuery("SELECT SQL_CALC_FOUND_ROWS 	c.id_cupo, c.id_cliente, c.id_puerto, DATE_FORMAT(c.fecha, '%d-%m-%Y') as fecha, DATE_FORMAT(c.fecha_fin, '%d-%m-%Y') as fecha_fin,
														c.id_proveedor, c.cantidad, cp.id_cupos_proveedor, SUM(cp.cantidad) as cantidad_asignada, c.estado,
                            cl.ruc as ruc_cliente, cl.razon_social as cliente, cl.direccion as direccion_cliente, cl.telefono as telefono_cliente, cl.correo as correo_cliente,
														cl.encargado as encargado_cliente, p.ruc as ruc_proveedor, GROUP_CONCAT(p.nombre) as proveedor, p.direccion as direccion_proveedor, p.telefono as telefono_proveedor,
														p.correo as correo_proveedor, p.encargado as encargado_proveedor,
                            pu.puerto
													from cupos c
													left join cupos_proveedor cp on cp.id_cupo=c.id_cupo
													left join clientes cl on cl.id_cliente=c.id_cliente
													left join proveedores p on p.id_proveedor=cp.id_proveedor
													left join puertos pu on pu.id_puerto=c.id_puerto
													where 1=1
													$mostrar
													$where
													$where_estado
					group BY c.id_cupo
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
  }
  ?>
