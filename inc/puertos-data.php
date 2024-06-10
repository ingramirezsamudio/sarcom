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
				$where = "AND CONCAT_WS(' ', puerto) LIKE '%$search%'";
			}

			$db->setQuery("SELECT SQL_CALC_FOUND_ROWS * FROM puertos WHERE 1=1 $where ORDER BY $sort $order LIMIT $offset, $limit");
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

		//BUSCAR RUC EN SET
		case 'buscar_ruc':
			$db = DataBase::conectar();
			$ruc_tmp = $db->clearText($_POST['ruc']);

			//Si tiene guion, entonces sacamos
			if (stripos($ruc_tmp, "-") !== false) {
				$ruc_sin_dv_tmp = explode("-",$ruc_tmp);
				$ruc_tmp = $ruc_sin_dv_tmp[0];
			}
			$url = "https://marangatu.set.gov.py/eset-restful/contribuyentes/consultar?ruc=$ruc_tmp&codigoEstablecimiento=001";
			$ch = curl_init();
			// Disable SSL verification
			curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
			// Will return the response, if false it print the response
			curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
			// Set the url
			curl_setopt($ch, CURLOPT_URL,$url);
			// Execute
			$json=curl_exec($ch);
			// Closing
			curl_close($ch);

			$arr = json_decode($json);

			if ($arr->procesamientoCorrecto=="true"){
				$ruc = $arr->ruc;
				$dv = $arr->dv;
				$nombre_tmp = $arr->nombre;
				$nombre = trim(preg_replace('/\s\s+/', ' ', str_replace("\n", " ", $nombre_tmp)));
				$telefono = $arr->telefono;
				$direccion = $arr->direccion;
			}else{
				$ruc=""; $dv=""; $nombre=""; $telefono=""; $direccion="";
			}

			$salida = ["ruc"=>$ruc, "dv"=>$dv, "nombre"=>$nombre, "telefono"=>$telefono, "direccion"=>$direccion];
			echo json_encode($salida);

		break;

		//BUSCAR CI EN SET
		case 'buscar_ci':
			$db = DataBase::conectar();
			$ci = $db->clearText($_POST['ci']);

			//Si tiene guion, entonces sacamos
			if (stripos($ci, "-") !== false) {
				$ruc_sin_dv_tmp = explode("-",$ci);
				$ci = $ruc_sin_dv_tmp[0];
			}
			$url = "https://servicios.set.gov.py/eset-publico/ciudadano/recuperar?cedula=$ci";
			$ch = curl_init();
			// Disable SSL verification
			curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
			// Will return the response, if false it print the response
			curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
			// Set the url
			curl_setopt($ch, CURLOPT_URL,$url);
			// Execute
			$json=curl_exec($ch);
			// Closing
			curl_close($ch);

			$arr = json_decode($json);

			if ($arr->presente=="true"){
				$cedula = $arr->resultado->cedula;
				$nombreCompleto_tmp = $arr->resultado->nombreCompleto;

				$nombre = trim(preg_replace('/\s\s+/', ' ', str_replace("\n", " ", $nombreCompleto_tmp)));
			}else{
				$cedula="";
				$nombre="";
			}

			$salida = ["ci"=>$cedula, "nombre"=>$nombre];
			echo json_encode($salida);
		break;

		case 'cargar':
			$db = DataBase::conectar();
			$puerto = $db->clearText($_POST['puerto']);
			$capacidad_estatica = $db->clearText($_POST['capacidad_estatica']);
			$capacidad_embarque = $db->clearText($_POST['capacidad_embarque']);
			$capacidad_camiones = $db->clearText($_POST['capacidad_camiones']);
			$superficie = $db->clearText($_POST['superficie']);


			if (empty($puerto)){
				echo "Error. Favor ingrese nombre del Puerto";
				exit;
			}

			$db->setQuery("INSERT INTO puertos (puerto, capacidad_estatica, capacidad_embarque, capacidad_camiones, superficie)
							VALUES ('$puerto','$capacidad_estatica Tm','$capacidad_embarque Tm/día','$capacidad_camiones Camiones','$superficie Hectáreas')");

			if(!$db->alter()){
				echo "Error. ".$db->getError();
			}else{
				echo "Puerto registrado correctamente";
			}

		break;

		case 'editar':

			$db = DataBase::conectar();
			$id_puerto = $_POST['hidden_id_puerto'];
			$puerto = $db->clearText($_POST['puerto']);
			$capacidad_estatica = $db->clearText($_POST['capacidad_estatica']);
			$capacidad_embarque = $db->clearText($_POST['capacidad_embarque']);
			$capacidad_camiones = $db->clearText($_POST['capacidad_camiones']);
			$superficie = $db->clearText($_POST['superficie']);


			$db->setQuery("UPDATE puertos SET puerto='$puerto', capacidad_estatica='$capacidad_estatica Tm', capacidad_embarque='$capacidad_embarque Tm/día',
				capacidad_camiones='$capacidad_camiones Camiones', superficie='$superficie Hectáreas' WHERE id_puerto = '$id_puerto'");

			if(!$db->alter()){
				echo "Error. ". $db->getError();
			}else{
				echo "Puerto '$puerto' modificado correctamente";
			}

		break;

		case 'eliminar':
			$success = false;
			$id = $_POST['id'];
			$nombre = $_POST['nombre'];

			$db = DataBase::conectar();
			$db->setQuery("DELETE FROM puertos WHERE id_puerto = $id");

			if($db->alter()){
				echo "Puerto '$nombre' eliminado correctamente";
			}else{
				echo "Error al eliminar '$nombre'. ". $db->getError();
			}

		break;

	}


?>
