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
				$where = "AND CONCAT_WS(' ', zona, descropcion) LIKE '%$search%'";
			}

			// $db->setQuery("SELECT SQL_CALC_FOUND_ROWS id_direccion, direccion, id_zona FROM direcciones  WHERE 1=1  $where ORDER BY $sort $order LIMIT $offset, $limit");
			$db->setQuery("SELECT SQL_CALC_FOUND_ROWS d.id_direccion, d.direccion, d.id_zona, z.zona FROM direcciones d, zonas z  WHERE 1=1 AND z.id_zona = d.id_zona  $where ORDER BY $sort $order LIMIT $offset, $limit");
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

				$direccion_tmp = $arr->direccion;

				//REEMPLAZAMOS PALABRAS INNECESARIAS EN DIRECCIONES
				$search  = array('AVENIDA, ', 'Numero #', ' //DEPARTAMENTO', ' //CASA', ' //OFICINA', 'CALLE, ', ' //INTERIOR', 'CASA #', 'ESQUINA', 'CASI ', 'ENTRE ');
				$replace = array('', 'N° ', '', '', '', '', '', 'N° ', 'ESQ.', 'C/ ', 'E/ ');
				$direccion = str_ireplace($search, $replace, $direccion_tmp);

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
            $direccion = $db->clearText($_POST['direccion']);
            $zona = $db->clearText($_POST['zona']);
			// $ruc = $db->clearText($_POST['ruc']);
			// $razon_social = $db->clearText($_POST['razon_social']);
			// $telefono = $db->clearText($_POST['telefono']);
			// $celular = $db->clearText($_POST['celular']);
			// $direccion = $db->clearText($_POST['direccion']);
			// $email = $db->clearText($_POST['email']);
			// $tipo = $db->clearText($_POST['tipo']);
			// $obs = $db->clearText($_POST['obs']);

			if (empty($zona)){
				echo "Error. Favor ingrese zona";
				exit;
			}

			if ($zona){
				$db->setQuery("INSERT INTO direcciones (direccion, id_zona) VALUES ('$direccion','$zona')");
            }
            // else{
			// 	$db->setQuery("INSERT INTO clientes (razon_social, direccion, telefono, celular, email, tipo, obs, usuario, fecha) VALUES ('$razon_social','$direccion','$telefono','$celular','$email','Minorista','$obs','$usuario',NOW())");
			// }

			if(!$db->alter()){
				echo "Error. ".$db->getError();
			}else{
				echo "Zona registrado correctamente";
			}

		break;

		case 'editar':

			$db = DataBase::conectar();
			$id_direccion = $_POST['hidden_id_direccion'];
			$direccion = $db->clearText($_POST['direccion']);
			$zona = $db->clearText($_POST['zona']);
			// $telefono = $db->clearText($_POST['telefono']);
			// $celular = $db->clearText($_POST['celular']);
			// $direccion = $db->clearText($_POST['direccion']);
			// $email = $db->clearText($_POST['email']);
			// $tipo = $db->clearText($_POST['tipo']);
			// $obs = $db->clearText($_POST['obs']);

			$db->setQuery("UPDATE direcciones SET direccion='$direccion', id_zona='$zona' WHERE id_direccion = '$id_direccion'");

			if(!$db->alter()){
				echo "Error. ". $db->getError();
			}else{
				echo "Dirección '$direccion' modificado correctamente";
			}

		break;

		case 'eliminar':
			$success = false;
			$id = $_POST['id'];
			$nombre = $_POST['nombre'];

			$db = DataBase::conectar();
			$db->setQuery("DELETE FROM direcciones WHERE id_direccion = $id");

			if($db->alter()){
				echo "Dirección '$nombre' eliminado correctamente";
			}else{
				echo "Error al eliminar '$nombre'. ". $db->getError();
			}

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
