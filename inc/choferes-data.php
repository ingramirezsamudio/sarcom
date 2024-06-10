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
			$ci = $db->clearText($_POST['ci']);
			$nombre = $db->clearText($_POST['nombre']);
      $direccion = $db->clearText($_POST['direccion']);
      $telefono = $db->clearText($_POST['telefono']);
			$correo = $db->clearText($_POST['correo']);
			$entidad = $db->clearText($_POST['entidad']);

			if (empty($nombre) || empty($entidad) || empty($ci)) {
				echo "Error. Favor complete todos los campos";
				exit;
			}

			$db->setQuery("INSERT INTO choferes (id_proveedor, ci, nombre, telefono, correo, direccion)
										VALUES('$entidad','$ci','$nombre', '$telefono','$correo', '$direccion')");

			if(!$db->alter()){
				echo "Error. ".$db->getError();
			}else{
				echo "Chofer registrado correctamente";
			}
		break;


		case 'cargar_entidad':
			$db = DataBase::conectar();
			$entidad_ruc = $db->clearText($_POST['entidad_ruc']);
			$entidad_nombre = $db->clearText($_POST['entidad_nombre']);
			$entidad_direccion = $db->clearText($_POST['entidad_direccion']);
			$entidad_telefono = $db->clearText($_POST['entidad_telefono']);
			$entidad_correo = $db->clearText($_POST['entidad_correo']);
			$entidad_encargado = $db->clearText($_POST['entidad_encargado']);

			$db->setQuery("INSERT INTO entidades(ruc, nombre, direccion, telefono, correo, encargado)
									VALUES('$entidad_ruc','$entidad_nombre', '$entidad_direccion','$entidad_telefono','$entidad_correo','$entidad_encargado')");

			if(!$db->alter()){
				echo "Error. ".$db->getError();
			}else{
				echo "Entidad registrada correctamente";
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
				$where = "AND CONCAT_WS(' ', c.nombre,e.nombre, c.ci, c.direccion,) LIKE '%$search%'";
			}

			$db->setQuery("SELECT SQL_CALC_FOUND_ROWS c.id_chofer, c.id_proveedor, c.ci, c.nombre, c.telefono, c.correo, c.direccion, e.nombre as entidad
			FROM choferes c
			LEFT JOIN proveedores e ON e.id_proveedor=c.id_proveedor
			WHERE 1=1 $where
			ORDER BY $sort $order
			LIMIT $offset, $limit");

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

						$id_chofer = $_POST['hidden_id_chofer'];
						$ci = $_POST['ci'];
						$nombre = $_POST['nombre'];
						$direccion = $_POST['direccion'];
						$telefono = $_POST['telefono'];
						$correo = $_POST['correo'];
						$entidad = $_POST['entidad'];

			if (empty($ci) || empty($nombre) || empty($direccion) || empty($telefono) || empty($entidad)){
				echo "Error. Favor complete todos los campos";
				exit;
			}

			$db->setQuery("UPDATE choferes SET id_proveedor='$entidad', ci='$ci', nombre='$nombre', telefono='$telefono', correo='$correo', direccion='$direccion'
			WHERE id_chofer = '$id_chofer'");

			if(!$db->alter()){
				echo "Error. ". $db->getError();
			}else{
				echo "Chofer modificado correctamente";
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
			$db->setQuery("DELETE FROM choferes WHERE id_chofer = $id");

			if($db->alter()){
				echo "Chofer eliminado correctamente";
			}else{
				echo "Error al eliminar Chofer". $db->getError();
			}

		break;

		case 'buscar_entidades':
			$db = DataBase::conectar();
			$page = $db->clearText($_GET['page']);
			$term = $db->clearText($_GET['term']);
			$resultCount = 5;
			$end = ($page - 1) * $resultCount;
			$db->setQuery("SELECT SQL_CALC_FOUND_ROWS * FROM proveedores WHERE nombre LIKE '%$term%' ORDER BY nombre LIMIT $end, $resultCount");
			$rows = $db->loadObjectList();

			$db->setQuery("SELECT FOUND_ROWS() as total");
			$total_row = $db->loadObject();
			$count = $total_row->total;

			if ($rows){
				foreach ($rows as $r){
					$salida[] = ['id_entidad' => $r->id_proveedor, 'entidad' => $r->nombre, 'total_count'=>$count];
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
