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
			$where = "";
			//Parametros de ordenamiento, busqueda y paginacion
			$limit = $_REQUEST['limit'];
			$offset	= $_REQUEST['offset'];
			$order = $_REQUEST['order'];
			$sort = $_REQUEST['sort'];
			if (!isset($sort)) $sort = 2;


			if (isset($_REQUEST['search']) && !empty($_REQUEST['search'])){
				$search = $_REQUEST['search'];
				$where = "AND ubicacion LIKE '%$search%'";
			}

			$db->setQuery("SELECT SQL_CALC_FOUND_ROWS *, case estado when '1' then 'Activo' when '0' then 'Inactivo' end as nombre_estado FROM ubicaciones WHERE 1=1 $where ORDER BY $sort $order LIMIT $offset, $limit");
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


		case 'cargar':
			$db = DataBase::conectar();
			$ubicacion = $db->clearText($_POST['ubicacion']);
			$estado = $db->clearText($_POST['estado']);

			if (empty($ubicacion)){
				echo "Error. Favor ingrese una unidad de medida";
				exit;
			}

			$db->setQuery("INSERT INTO ubicaciones (ubicacion, estado) VALUES ('$ubicacion','$estado')");

			if(!$db->alter()){
				echo "Error. ".$db->getError();
			}else{
				echo "Deposito registrado correctamente";
			}

		break;

		case 'editar':

			$db = DataBase::conectar();
			$id_ubicacion = $_POST['hidden_id'];
			$ubicacion = $db->clearText($_POST['ubicacion']);
			$estado = $db->clearText($_POST['estado']);

			$db->setQuery("UPDATE ubicaciones SET ubicacion='$ubicacion', estado='$estado' WHERE id_ubicacion = '$id_ubicacion'");

			if(!$db->alter()){
				echo "Error. ". $db->getError();
			}else{
				echo "El ubicacion '$ubicacion' modificada correctamente";
			}

		break;

		case 'eliminar':
			$success = false;
			$id = $_POST['id'];
			$nombre = $_POST['nombre'];

			$db = DataBase::conectar();
			$db->setQuery("DELETE FROM ubicaciones WHERE id_ubicacion = $id");

			if($db->alter()){
				echo "Deposito '$nombre' eliminado correctamente";
			}else{
				echo "Error al eliminar '$nombre'. ". $db->getError();
			}

		break;

	}


?>
