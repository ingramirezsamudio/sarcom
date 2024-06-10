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
				// $where = "AND CONCAT_WS(' ', sucursal, ruc, cod_establecimiento, punto_de_expedicion, obs) LIKE '%$search%'";
			}

			$db->setQuery("SELECT SQL_CALC_FOUND_ROWS *
				FROM sucursales
				-- WHERE 1=1 $where
				-- DATE_FORMAT(fecha,'%d/%m/%Y %H:%i:%s')
				ORDER BY $sort $order LIMIT $offset, $limit
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


		case 'cargar':

			$db = DataBase::conectar();

			$nombre_empresa = $db->clearText($_POST['nombre_empresa']);
			$ruc = $db->clearText($_POST['ruc']);
			$razon_social = $db->clearText($_POST['razon_social']);
			$sucursal = $db->clearText($_POST['sucursal']);
			$logo = $db->clearText($_POST['logo']);
			$logo_horizontal = $db->clearText($_POST['logo_horizontal']);
			$colores1 = $db->clearText($_POST['colores1']);
			$colores2 = $db->clearText($_POST['colores2']);
			$nombre_sistema = $db->clearText($_POST['nombre_sistema']);
			$subtitulo_sistema = $db->clearText($_POST['subtitulo_sistema']);
			$direccion = $db->clearText($_POST['direccion']);
			$ciudad = $db->clearText($_POST['ciudad']);
			$departamento = $db->clearText($_POST['departamento']);
			$pais = $db->clearText($_POST['pais']);
			$telefono = $db->clearText($_POST['telefono']);
			$email = $db->clearText($_POST['email']);
			$moneda = $db->clearText($_POST['moneda']);
			$estado = $db->clearText($_POST['estado']);



			if (! empty($_FILES))  {
				//$imagePath = isset($_FILES["foto"]["name"]) ? $_FILES["foto"]["name"] : "Undefined";

				$targetPath = "../archivos/sucursales/";

				if (!is_dir($targetPath)) {
					mkdir($targetPath, 0777, true);
				}
				//$imagePath = $targetPath . $imagePath;
				$tempFile = $_FILES['logo']['tmp_name'];
				$tempFile2 = $_FILES['logo_horizontal']['tmp_name'];

				$ext_tmp = explode(".",$_FILES['logo']['name']);
				$ext = end($ext_tmp);

				$ext_tmp2 = explode(".",$_FILES['logo_horizontal']['name']);
				$ext2 = end($ext_tmp2);

				$targetFile = $targetPath . limpia_archivo($nombre_empresa) . "_" ."logo.".$ext;
				$targetFile2 = $targetPath . limpia_archivo($nombre_empresa) . "_" ."logo_horizontal.".$ext2;

				$ext == "png" ? $quality=2 : $quality=85;
				$ext2 == "png" ? $quality2=2 : $quality2=85;

				resizeImage($tempFile, $tempFile, 400, 400, $quality, $ext);
				resizeImage($tempFile2, $tempFile2, 220, 66, $quality2, $ext2);

				if (move_uploaded_file($tempFile, $targetFile)) {
					$logo = str_replace("../","",$targetFile);
				}
				if (move_uploaded_file($tempFile2, $targetFile2)) {
					$logo_horizontal = str_replace("../","",$targetFile2);
				}
			}

				$db->setQuery("INSERT INTO sucursales (nombre_empresa, ruc, razon_social, sucursal, logo, logo_horizontal, colores, nombre_sistema, subtitulo_sistema, direccion, ciudad, departamento, pais, telefono, email, moneda, estado)
				VALUES ('$nombre_empresa','$ruc','$razon_social','$sucursal','$logo','$logo_horizontal','$colores1 , $colores2','$nombre_sistema','$subtitulo_sistema','$direccion','$ciudad','$departamento','$pais','$telefono','$email','$moneda','$estado')");

					if(!$db->alter()){
						echo "Error. ".$db->getError();
					}else{
						echo "Sucursal registrada correctamente";
					}
		break;


		case 'editar':

			$db = DataBase::conectar();
			$id_sucursal = $_POST['hidden_id_sucursal'];
			$nombre_empresa = $db->clearText($_POST['nombre_empresa']);
			$ruc = $db->clearText($_POST['ruc']);
			$razon_social = $db->clearText($_POST['razon_social']);
			$sucursal = $db->clearText($_POST['sucursal']);
			$logo = $db->clearText($_POST['logo']);
			$logo_horizontal = $db->clearText($_POST['logo_horizontal']);
			$colores1 = $db->clearText($_POST['colores1']);
			$colores2 = $db->clearText($_POST['colores2']);
			$nombre_sistema = $db->clearText($_POST['nombre_sistema']);
			$subtitulo_sistema = $db->clearText($_POST['subtitulo_sistema']);
			$direccion = $db->clearText($_POST['direccion']);
			$ciudad = $db->clearText($_POST['ciudad']);
			$departamento = $db->clearText($_POST['departamento']);
			$pais = $db->clearText($_POST['pais']);
			$telefono = $db->clearText($_POST['telefono']);
			$email = $db->clearText($_POST['email']);
			$moneda = $db->clearText($_POST['moneda']);
			$estado = $db->clearText($_POST['estado']);

			if (! empty($_FILES))  {
				//$imagePath = isset($_FILES["foto"]["name"]) ? $_FILES["foto"]["name"] : "Undefined";

				$targetPath = "../archivos/sucursales/";

				if (!is_dir($targetPath)) {
					mkdir($targetPath, 0777, true);
				}
				//$imagePath = $targetPath . $imagePath;
				$tempFile = $_FILES['logo']['tmp_name'];
				$tempFile2 = $_FILES['logo_horizontal']['tmp_name'];

				$ext_tmp = explode(".",$_FILES['logo']['name']);
				$ext = end($ext_tmp);

				$ext_tmp2 = explode(".",$_FILES['logo_horizontal']['name']);
				$ext2 = end($ext_tmp2);

				$targetFile = $targetPath . $nombre_empresa . "_" ."logo.".$ext;
				$targetFile2 = $targetPath . $nombre_empresa . "_" ."logo_horizontal.".$ext2;

				$ext == "png" ? $quality=2 : $quality=85;
				$ext2 == "png" ? $quality2=2 : $quality2=85;

				resizeImage($tempFile, $tempFile, 400, 400, $quality, $ext);
				resizeImage($tempFile2, $tempFile2, 220, 66, $quality2, $ext2);

				if (move_uploaded_file($tempFile, $targetFile)) {
					$logo = str_replace("../","",$targetFile);
				}
				if (move_uploaded_file($tempFile2, $targetFile2)) {
					$logo_horizontal = str_replace("../","",$targetFile2);
				}
			}


			$db->setQuery("UPDATE sucursales SET ruc='$ruc', razon_social='$razon_social', sucursal='$sucursal', estado='$estado', nombre_empresa='$nombre_empresa', logo='$logo',logo_horizontal='$logo_horizontal', colores='$colores1. , .$colores2', nombre_sistema='$nombre_sistema',
			subtitulo_sistema='$subtitulo_sistema', direccion='$direccion', ciudad='$ciudad', departamento='$departamento',
			pais='$pais', telefono='$telefono', email='$email', moneda='$moneda' WHERE id_sucursal = '$id_sucursal'");


			if(!$db->alter()){
				echo "Error. ". $db->getError();
			}else{
				echo "Sucursal '$sucursal' modificado correctamente";
			}

		break;

		case 'eliminar':
			$success = false;
			$id = $_POST['id'];
			$nombre = $_POST['nombre'];

			$db = DataBase::conectar();
			$db->setQuery("DELETE FROM sucursales WHERE id_sucursal = $id");

			if($db->alter()){
				echo "Sucursal '$nombre' eliminada correctamente";
			}else{
				echo "Error al eliminar '$nombre'. ". $db->getError();
			}

		break;

	}


?>
