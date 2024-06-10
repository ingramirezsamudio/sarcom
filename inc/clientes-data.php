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
				$where = "AND CONCAT_WS(' ', c.ruc, c.razon_social, c.direccion, c.telefono, c.correo, c.encargado) LIKE '%$search%'";
			}

			$db->setQuery("SELECT c.id_cliente, c.id_usuario, c.ruc, c.razon_social, c.direccion, c.telefono, c.correo, c.encargado, u.usuario, u.id_usuario
				FROM clientes c
				left join usuarios u on u.id_usuario=c.id_usuario
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
			$ruc = $db->clearText($_POST['ruc']);
			$razon_social = $db->clearText($_POST['razon_social']);
			$telefono = $db->clearText($_POST['telefono']);
			$correo = $db->clearText($_POST['correo']);
			$direccion = $db->clearText($_POST['direccion']);
			$encargado = $db->clearText($_POST['encargado']);
			$usuario = $db->clearText($_POST['usuario']);
			$contraseña = sha1($db->clearText($_POST['contraseña']));

			$db->setQuery("SELECT * from usuarios");
			$rows = $db->loadObjectList();
			foreach ($rows as $r){
				$usuario_e = $r->usuario;
				$nombre_apellido_e = $r->nombre_apellido;
				$email_c = $r->email;
				$ci_e = $r->ci;
				if ($usuario_e==$usuario) {
					echo "Error. El nombre de usuario ya existe.";
					exit;
				}if ($email_c==$correo) {
					echo "Error. El e-mail de ya existe.";
					exit;
				
			}if ($ruc==$ci_e) {
				echo "Error. El numero de CI/RUC ya existe";
				exit;

		}if ($razon_social==$nombre_apellido_e) {
			echo "Error. El nombre del cliente ya existe";
			exit;
		}
			};




			if (empty($razon_social)){
				echo "Error. Favor ingrese  Razón Social";
				exit;
			}
			if (empty($correo)){
				echo "Error. Un correo es necesario para la creación de un perfil";
				exit;
			}

			$db->setQuery("INSERT INTO usuarios (usuario, nombre_apellido, email, ci, telefono, password, estado, fecha_registro, adminpass, tipo_usuario, direccion, foto)
			VALUES ('$usuario','$razon_social','$correo','$ruc','$telefono','$contraseña','1',NOW(),'aa1bb91d337db673c913634999d7b2b2daacca12','cliente','$direccion','archivos/multimedia/perfil/usuario_1_1.jpg')");

			if(!$db->alter()){
				echo "Error. ".$db->getError();
			}else{
				echo "Usuario registrado correctamente";
			}


			$id_usuario = $db->getLastID();
			$db->setQuery("INSERT INTO clientes (id_usuario, ruc, razon_social, direccion, telefono, correo, encargado)
												VALUES ('$id_usuario','$ruc','$razon_social','$direccion','$telefono','$correo','$encargado')");
			if(!$db->alter()){
				echo "Error. ".$db->getError();
			}else{
				echo "<br>Cliente registrado correctamente";
			}
		break;

		case 'editar':

			$db = DataBase::conectar();
			$id_cliente = $_POST['hidden_id_cliente'];
			$id_usuario = $_POST['hidden_id_usuario'];
			$ruc = $db->clearText($_POST['ruc']);
			$razon_social = $db->clearText($_POST['razon_social']);
			$telefono = $db->clearText($_POST['telefono']);
			$correo = $db->clearText($_POST['correo']);
			$direccion = $db->clearText($_POST['direccion']);
			$encargado = $db->clearText($_POST['encargado']);
			$usuario = $db->clearText($_POST['usuario']);
			$contraseña = sha1($db->clearText($_POST['contraseña']));

			$db->setQuery("SELECT * from usuarios where id_usuario<>'$id_usuario'");
			$rows = $db->loadObjectList();
			foreach ($rows as $r){
				$usuario_e = $r->usuario;
				$nombre_apellido_e = $r->nombre_apellido;
				$email_c = $r->email;
				$ci_e = $r->ci;
				if ($usuario_e==$usuario) {
					echo "Error. El nombre de usuario ya existe.";
					exit;

				}if ($email_c==$correo) {
					echo "Error. El e-mail de ya existe.";
					exit;
				}
			};
			if (empty($correo)){
				echo "Error. Un correo es necesario para la creación de un perfil";
				exit;
			}




			$db->setQuery("UPDATE clientes SET ruc='$ruc', razon_social='$razon_social', telefono='$telefono', correo='$correo', direccion='$direccion',encargado='$encargado' WHERE id_cliente = '$id_cliente'");

			if(!$db->alter()){
				echo "Error. ". $db->getError();
			}else{
				echo "Cliente '$razon_social' modificado correctamente";
			}

			if ($usuario=='' || $contraseña=='') {

			}else {


				$db->setQuery("UPDATE usuarios SET usuario='$usuario', password='$contraseña', nombre_apellido='$razon_social', verificado='no'
					 						WHERE id_usuario = '$id_usuario'");
				if(!$db->alter()){
					echo "Error. ". $db->getError();
				}else{
					echo "<br>Usuario modificado correctamente";
				}
			}



		break;

		case 'eliminar':
			$success = false;
			$id = $_POST['id'];
			$nombre = $_POST['nombre'];

			$db = DataBase::conectar();

			$db->setQuery("SELECT * from clientes WHERE id_cliente = $id");
			$row = $db->loadObject();
			$id_usuario= $row->id_usuario;

			$db->setQuery("DELETE FROM usuarios WHERE id_usuario = $id_usuario");

			if($db->alter()){
				echo "Usuario del cliente '$nombre' eliminado correctamente";
			}else{
				echo "Error al eliminar '$nombre'. ". $db->getError();
			}


			$db->setQuery("DELETE FROM clientes WHERE id_cliente = $id");

			if($db->alter()){
				echo "<br>Cliente '$nombre' eliminado correctamente";
			}else{
				echo "Error al eliminar '$nombre'. ". $db->getError();
			}

		break;

	}


?>
