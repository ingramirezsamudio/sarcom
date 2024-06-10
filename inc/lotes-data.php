<?php
	header('Access-Control-Allow-Origin: *');
	header("Access-Control-Allow-Headers: Origin, X-Requested-With, cache-control, Content-Type, Accept");
	header('Access-Control-Allow-Methods: GET, POST');
	include ("funciones.php");
	$q = $_REQUEST['q'];
	$usuario = $auth->getUsername();
	$id_sucursal = datosUsuario($usuario)->id_sucursal;
	switch ($q){

		case 'cargar':
			$db = DataBase::conectar();
			$id_repartidor = $db->clearText($_POST['id_repartidor']);
			$id_entidad = $db->clearText($_POST['entidad']);
            $encargado = $db->clearText($_POST['encargado']);
            $cantidad = $db->clearText($_POST['cantidad']);
			$fecha_tope = $db->clearText($_POST['fecha_tope']);
			$id_zona = $db->clearText($_POST['zona']);

			if (empty($id_entidad) || empty($encargado) || empty($cantidad) || empty($fecha_tope)){
				echo "Error. Favor complete todos los campos";
				exit;
			}

			$db->setQuery("INSERT INTO lotes(id_repartidor, id_entidad, encargado, cantidad, fecha_tope, fecha_registro, estado, id_zona)
			VALUES('$id_repartidor','$id_entidad', '$encargado','$cantidad', '$fecha_tope', NOW(), 'PENDIENTE', '$id_zona')");

			if(!$db->alter()){
				echo "Error. ".$db->getError();
			}else{
				echo "Lote registrado correctamente";
			}
		break;

		case 'ver':

            $db = DataBase::conectar();
			$where = "";
			//Parametros de ordenamiento, busqueda y paginacion
			$limit = $_REQUEST['limit'];
			$offset	= $_REQUEST['offset'];
			$order = $_REQUEST['order'];
			$sort = $_REQUEST['sort'];
			if (!isset($sort)) $sort = 2;


			if (isset($_REQUEST['search']) && !empty($_REQUEST['search'])){
				$search = $_REQUEST['search'];
				$where = "AND CONCAT_WS(' ', r.nombre, l.encargado, c.razon_social, l.cantidad, l.fecha_tope, l.fecha_registro, l.estado) LIKE '%$search%'";
			}

			$db->setQuery("SELECT SQL_CALC_FOUND_ROWS l.id_lote, r.nombre AS proveedor, c.id_cliente AS id_entidad, c.razon_social AS entidad, l.encargado, l.cantidad, l.fecha_tope, l.fecha_registro, l.estado, l.id_zona ,z.zona
			FROM lotes l
			LEFT JOIN clientes c ON l.id_entidad=c.id_cliente
			LEFT JOIN repartidores r ON l.id_repartidor=r.id_repartidor
			LEFT JOIN zonas z ON l.id_zona=z.id_zona
			WHERE 1=1 $where ORDER BY $sort $order LIMIT $offset, $limit");
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

		case 'ver_detalle':

			$db = DataBase::conectar();

			//Parametros de ordenamiento, busqueda y paginacion
			$id_lote = $_REQUEST['id_lote'];
			$limit = $_REQUEST['limit'];
			$offset	= $_REQUEST['offset'];
			$order = $_REQUEST['order'];
			$sort = $_REQUEST['sort'];


			$db->setQuery("SELECT l.id as id_pedido, l.razon_social, l.ruc, l.nro_casa, l.zona, l.fecha_tope, l.id_lote, l.estado, l.correo,
				l.observaciones, l.cantidad_reprogramaciones, c.razon_social as entidad, concat(d.direccion,' ',d.observacion) as direccion,
				z.zona, l.consideraciones,l.ubicacion,l.firma,l.hora_confirmacion as entregado
											FROM lista_pedidos l
											left join direcciones d on d.id_direccion=l.direccion
											left join zonas z on z.id_zona=l.zona
											left join lotes lo on lo.id_lote=l.id_lote
											left join clientes c on c.id_cliente=lo.id_entidad
											WHERE l.id_lote='$id_lote'
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

			echo json_encode($rows);

		break;

		case 'editar':

            $db = DataBase::conectar();
            $id = $_POST['hidden_id_lote'];
			$id_entidad = $db->clearText($_POST['entidad']);
            $encargado = $db->clearText($_POST['encargado']);
            $cantidad = $db->clearText($_POST['cantidad']);
			$fecha_tope = $db->clearText($_POST['fecha_tope']);
			$id_zona = $db->clearText($_POST['zona']);

			if (empty($id_entidad) || empty($encargado) || empty($cantidad) || empty($fecha_tope)){
				echo "Error. Favor complete todos los campos";
				exit;
			}

			$db->setQuery("UPDATE lotes SET id_entidad='$id_entidad', encargado='$encargado', cantidad='$cantidad', fecha_tope='$fecha_tope', id_zona='$id_zona'
			WHERE id_lote = '$id'");

			if(!$db->alter()){
				echo "Error. ". $db->getError();
			}else{
				echo "Lote modificado correctamente";
			}

		break;

		case 'iniciar':

						$db = DataBase::conectar();
						$id_lote = $_POST['id_lote'];

			if (empty($id_lote)){
				echo "Error. no se encuentra el numero de lote";
				exit;
			}
			$db->setQuery("UPDATE lista_pedidos SET estado='EN TRÁNSITO' WHERE id_lote = '$id_lote'");
			if(!$db->alter()){
				echo "Error. ". $db->getError();
			}else{
				//echo "La entrega y el seguimiento GPS han sido iniciados";
			}

			$db->setQuery("UPDATE lotes SET estado='EN TRÁNSITO' WHERE id_lote = '$id_lote'");
			if(!$db->alter()){
				echo "Error. ". $db->getError();
			}else{
				echo "La entrega y el seguimiento GPS han sido iniciados";
			}



		break;

        case 'eliminar':

			$success = false;
			$id = $_POST['id'];

			$db = DataBase::conectar();
			$db->setQuery("DELETE FROM lotes WHERE id_lote = $id");

			if($db->alter()){
				echo "Lote eliminado correctamente";
			}else{
				echo "Error al eliminar lote". $db->getError();
			}

		break;

		case 'buscar_entidades':
			$db = DataBase::conectar();
			$page = $db->clearText($_GET['page']);
			$term = $db->clearText($_GET['term']);
			$resultCount = 5;
			$end = ($page - 1) * $resultCount;
			$db->setQuery("SELECT SQL_CALC_FOUND_ROWS * FROM clientes WHERE razon_social LIKE '%$term%' ORDER BY razon_social LIMIT $end, $resultCount");
			$rows = $db->loadObjectList();

			$db->setQuery("SELECT FOUND_ROWS() as total");
			$total_row = $db->loadObject();
			$count = $total_row->total;

			if ($rows){
				foreach ($rows as $r){
					$salida[] = ['id_entidad' => $r->id_cliente, 'entidad' => $r->razon_social, 'total_count'=>$count];
				}
			}else{
				$salida[] = ['id_entidad' => '', 'entidad' => '', 'total_count'=>''];
			}

			echo json_encode($salida);
		break;

		case 'buscar_encargado':
			$db = DataBase::conectar();
			$id_cliente = $db->clearText($_GET['id_entidad']);

			$db->setQuery("SELECT SQL_CALC_FOUND_ROWS encargado FROM clientes WHERE id_cliente='$id_cliente'");
			$rows = $db->loadObject();

			if ($rows){
				foreach ($rows as $r){
					$encargado = $r->encargado;
				}
			}else{
				$encargado = "";
			}

			$salida = ['encargado' => $encargado];

			echo json_encode($rows);
		break;

		case 'buscar_zonas':
			$db = DataBase::conectar();
			$page = $db->clearText($_GET['page']);
			$term = $db->clearText($_GET['term']);
			$resultCount = 5;
			$end = ($page - 1) * $resultCount;
			$db->setQuery("SELECT SQL_CALC_FOUND_ROWS * FROM zonas WHERE zona LIKE '%$term%' ORDER BY zona LIMIT $end, $resultCount");
			$rows = $db->loadObjectList();

			$db->setQuery("SELECT FOUND_ROWS() as total");
			$total_row = $db->loadObject();
			$count = $total_row->total;

			if ($rows){
				foreach ($rows as $r){
					$salida[] = ['id_zona' => $r->id_zona, 'zona' => $r->zona, 'total_count'=>$count];
				}
			}else{
				$salida[] = ['id_zona' => '', 'zona' => '', 'total_count'=>''];
			}

			echo json_encode($salida);
		break;

	}


?>
