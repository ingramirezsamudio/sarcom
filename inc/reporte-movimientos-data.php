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
				$desde = $_REQUEST['desde'].' 00:00:00';
				$hasta = $_REQUEST['hasta'].' 23:59:59';
				$mostrar = "AND a.fecha  BETWEEN '$desde' AND '$hasta'";




				$limit = $_REQUEST['limit'];
				$offset	= $_REQUEST['offset'];
				$order = $_REQUEST['order'];
				$sort = $_REQUEST['sort'];
				if (!isset($sort)) $sort = 2;

				if (isset($_REQUEST['search']) && !empty($_REQUEST['search'])){
						$search = $_REQUEST['search'];
						$where = " AND CONCAT_WS(' ') LIKE '%$search%'";
				}


					$db->setQuery("SELECT a.id_auditoria, DATE_FORMAT(a.fecha, '%d-%m-%Y %H:%m:%s') as fecha, a.query, a.usuario, u.usuario, u.nombre_apellido
												from auditoria a
												left join usuarios u on u.id_usuario=a.usuario

														where 1=1
														$mostrar
														$where
														order by a.id_auditoria desc

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
