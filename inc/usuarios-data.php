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

			if (isset($_REQUEST['search']) && !empty($_REQUEST['search'])){
				$search = $_REQUEST['search'];
				$where = "AND CONCAT_WS(' ', c.razon_social, c.ruc, c.direccion, c.email, c.obs, s.sucursal) LIKE '%$search%'";
			}

			$db->setQuery("SELECT u.id_usuario, u.usuario, u.nombre_apellido, u.email, u.ci, u.telefono, u.password, u.estado, u.fecha_registro, u.token, u.adminpass, u.verificado, u.ultima_sesion, u.ip, u.tipo_usuario, u.direccion, u.foto,
p.id_portero, pu.id_puerto,
pu.puerto
from usuarios u
										left join porteros p on p.id_usuario=u.id_usuario
										left join puertos pu on pu.id_puerto=p.id_puerto
										where u.id_usuario!=1
			");

			$rows = $db->loadObjectList();
			foreach ($rows as $r){
				$id = $r->id;
				//$estado = $r->status;
				switch ($r->status){
					case 0: $estado = "Activo";	break;
					case 1:	$estado = "Archivado"; break;
					case 2:	$estado = "Baneado"; break;
					case 3:	$estado = "Bloqueado"; break;
					case 4: $estado = "Pendiente"; break;
					case 5: $estado = "Suspendido"; break;
				}

				//$roles = implode(" / ",$auth->admin()->getRolesForUserById($id));


				// $registered = new DateTime();
				// $registered->setTimestamp($r->registered);
				// $fecha_registro = $registered->format('d/m/Y H:i:s');
				
				// $last_login = new DateTime();
				// $last_login->setTimestamp($r->last_login);
				// $ultimo_acceso = $last_login->format('d/m/Y H:i:s');
				

				
				// para php 8.2
				$registered = new DateTime();
				if (!is_null($r->registered)) {
					$registered->setTimestamp((int)$r->registered);
				} else {
					// Maneja el caso cuando $r->registered es null, por ejemplo:
					$registered->setTimestamp(time());
				}
				$fecha_registro = $registered->format('d/m/Y H:i:s');

				$last_login = new DateTime();
				if (!is_null($r->last_login)) {
					$last_login->setTimestamp((int)$r->last_login);
				} else {
					// Maneja el caso cuando $r->last_login es null, por ejemplo:
					$last_login->setTimestamp(time());
				}
				$ultimo_acceso = $last_login->format('d/m/Y H:i:s');




				$salida[] = [
					'id' => $id,
					'id_usuario' => $r->id_usuario,
					'ci' => $r->ci,
					'email' => $r->email,
					'username' => $r->usuario,
					'nombre_apellido' => $r->nombre_apellido,
					'departamento' => $r->departamento,
					'cargo' => $r->cargo,
					'telefono' => $r->telefono,
					'direccion' => $r->direccion,
					'id_sucursal' => $r->id_sucursal,
					'sucursal' => $r->sucursal,
					'foto' => $r->foto,
					'estado' => $estado,
					'status' => $r->status,
					//'roles' => $roles,
					'fecha_registro' => $fecha_registro,
					'rol' => $r->tipo_usuario,
					'ultima_sesion' => $r->ultima_sesion,
					'id_puerto' => $r->id_puerto,
					'puerto' => $r->puerto
				];
			}

			echo json_encode($salida);

		break;

		case 'ver_roles':
			foreach (\Delight\Auth\Role::getMap() as $roleValue => $roleName) {
				//$roles[] = ["id_rol"=>$roleValue, "rol"=>$roleName];
				$roles[] = ["rol"=>$roleName];
			}
			echo json_encode($roles);
		break;

		case 'ver_roles_usuario':
			$id = $_REQUEST['id'];
			$roles = $auth->admin()->getRolesForUserById($id);
			foreach($roles as $key => $value){
				//$salida[] = $key;
				$salida[] = $value;
			}
			//echo json_encode($salida, JSON_NUMERIC_CHECK);
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
			$ci = $db->clearText($_POST['ci']);
			$nombre = $db->clearText($_POST['nombre']);
			$telefono = $db->clearText($_POST['telefono']);
			$direccion = $db->clearText($_POST['direccion']);
			$email = $db->clearText($_POST['email']);
			$rol =  $db->clearText($_POST['rol']);
			$puerto =  $db->clearText($_POST['puertos']);
			$usuario = $db->clearText(trim(strtolower($_POST['usuario'])));
			$password = sha1($db->clearText($_POST['password']));
			$id_usuario_creador = $db->clearText($_POST['hidden_id_usuario_creador']);

			// $expira=="on" ? $status = 4 : $status = 0;

			if (empty($nombre)){
				echo "Error. Favor ingrese nombre y apellido del usuario";
				exit;
			}
			if (empty($ci)){
				echo "Error. Favor ingrese número de cédula";
				exit;
			}
			if (empty($rol)){
				echo "Error. Favor ingrese rol. El rol es el conjunto de permisos que posee el usuario en el sistema.";
				exit;
			}
			if (empty($usuario)){
				echo "Error. Favor ingrese nombre de usuario. Este dato se requiere para iniciar sesión en el sistema.";
				exit;
			}
			if (empty($password)){
				echo "Error. Favor escriba una contraseña temporal. Se requiere para el primer inicio de sesión en el sistema.";
				exit;
			}

			if (empty($email)){
				if ($rol=='proveedor' || $rol=='cliente') {
					echo "Error. Para la creacion de un ".$rol." es necesaria un correo.";
					exit;
				}
				$email = $usuario."@localhost.com";
			}

			if ($rol=='portero') {
				if (empty($puerto)) {
					echo "Error. Debe seleccionar un puerto para el portero ";
					exit;
				}	
		}




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
			}if ($email_c==$email) {
				echo "Error. El e-mail de ya existe.";
				exit;
			}if ($nombre_apellido_e==$nombre) {
					echo "Error. El nombre ya existe";
					exit;
			}if ($ci_e==$ci) {
				echo "Error. El CI/RUC ya existe ";
				exit;
			}
		};


			if ($rol=='proveedor') {

				$db->setQuery("INSERT INTO usuarios(usuario, nombre_apellido, email, ci, telefono, password, estado, fecha_registro, adminpass, ultima_sesion, tipo_usuario, direccion, foto)
				VALUES('$usuario','$nombre', '$email','$ci', '$telefono', '$password', '1', NOW(), 'aa1bb91d337db673c913634999d7b2b2daacca12', NOW(), '$rol', '$direccion', 'archivos/multimedia/perfil/usuario_1_1.jpg')");

				if(!$db->alter()){
					echo "Error. ".$db->getError();
				}else{
					echo "";
				}
				$id_usuario = $db->getLastID();

				$db->setQuery("INSERT INTO proveedores (id_usuario, nombre, telefono, correo, direccion, id_usuario_creador)
				VALUES('$id_usuario','$nombre', '$telefono','$email', '$direccion', '$id_usuario_creador')");

				if(!$db->alter()){
					echo "Error. ".$db->getError();
				}else{
					echo "Proveedor registrado correctamente proceda a modificar sus datos en la pestaña Proveedores";
				}


			}else if ($rol=='cliente') {
				$db->setQuery("INSERT INTO usuarios(usuario, nombre_apellido, email, ci, telefono, password, estado, fecha_registro, adminpass, ultima_sesion, tipo_usuario, direccion, foto)
				VALUES('$usuario','$nombre', '$email','$ci', '$telefono', '$password', '1', NOW(), 'aa1bb91d337db673c913634999d7b2b2daacca12', NOW(), '$rol', '$direccion', 'archivos/multimedia/perfil/usuario_1_1.jpg')");

				if(!$db->alter()){
					echo "Error. ".$db->getError();
				}else{
					echo "";
				}
				$id_usuario = $db->getLastID();
				$db->setQuery("INSERT INTO clientes (id_usuario, ruc, razon_social, telefono, correo, direccion)
				VALUES('$id_usuario','$ci','$nombre', '$telefono','$email', '$direccion')");
				if(!$db->alter()){
					echo "Error. ".$db->getError();
				}else{
					echo "Cliente registrado correctamente proceda a modificar sus datos en la pestaña Clientes<br>";
				}
			}else if ($rol=='portero') {

				$db->setQuery("INSERT INTO usuarios(usuario, nombre_apellido, email, ci, telefono, password, estado, fecha_registro, adminpass, ultima_sesion, tipo_usuario, direccion, foto)
				VALUES('$usuario','$nombre', '$email','$ci', '$telefono', '$password', '1', NOW(), 'aa1bb91d337db673c913634999d7b2b2daacca12', NOW(), '$rol', '$direccion', 'archivos/multimedia/perfil/usuario_1_1.jpg')");

				if(!$db->alter()){
					echo "Error. ".$db->getError();
				}else{
					echo "";
				}
				$id_usuario = $db->getLastID();
				$db->setQuery("INSERT INTO porteros (id_usuario, id_puerto, portero, telefono, direccion)
				VALUES('$id_usuario','$puerto','$nombre', '$telefono','$direccion')");
				if(!$db->alter()){
					echo "Error. ".$db->getError();
				}else{
					echo "Portero registrado correctamente";
				}




			}else {

				$db->setQuery("INSERT INTO usuarios(usuario, nombre_apellido, email, ci, telefono, password, estado, fecha_registro, adminpass, ultima_sesion, tipo_usuario, direccion, foto)
				VALUES('$usuario','$nombre', '$email','$ci', '$telefono', '$password', '1', NOW(), 'aa1bb91d337db673c913634999d7b2b2daacca12', NOW(), '$rol', '$direccion', 'archivos/multimedia/perfil/usuario_1_1.jpg')");

				if(!$db->alter()){
					echo "Error. ".$db->getError();
				}else{
					echo "Usuario registrado exitosamente";
				}
			}







		break;

		case 'editar':

			$db = DataBase::conectar();
			$id_usuario = $_POST['hidden_id_usuario'];
			$ci = $db->clearText($_POST['ci']);
			$nombre = $db->clearText($_POST['nombre']);
			$telefono = $db->clearText($_POST['telefono']);
			$direccion = $db->clearText($_POST['direccion']);
			$email = $db->clearText($_POST['email']);
			$rol = $db->clearText($_POST['rol']);
			$puerto = $db->clearText($_POST['puertos']);

			$usuario = $db->clearText($_POST['usuario']);
			$password = sha1($db->clearText($_POST['password']));


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
				}if ($email_c==$email) {
					echo "Error. El e-mail de ya existe.";
					exit;
				}
			};

			if ($usuario=='' || $password=='') {
				$db->setQuery("UPDATE usuarios SET ci='$ci', nombre_apellido='$nombre', telefono='$telefono', direccion='$direccion',
					email='$email', tipo_usuario='$rol'
					WHERE id_usuario = '$id_usuario'
					");
				}else {
				$db->setQuery("UPDATE usuarios SET ci='$ci', nombre_apellido='$nombre', telefono='$telefono', direccion='$direccion',
					email='$email', tipo_usuario='$rol', usuario='$usuario', password='$password', verificado='no'
					WHERE id_usuario = '$id_usuario'
					");
				}

			if(!$db->alter()){
				echo "Error. ". $db->getError();
			}else{
				echo "Usuario '$nombre' modificado correctamente";
			}
		break;


		case 'restablecer_pass':
			$success = false;
			$id = $_POST['id'];
			$nombre = $_POST['nombre'];

			$db = DataBase::conectar();

			$auth->admin()->changePasswordForUserByUsername($nombre, $nombre);
			$db->setQuery("UPDATE users SET status=4 WHERE id = $id");

			if($db->alter()){
				echo "Usuario '$nombre' restablecido correctamente";
			}else{
				echo "Error al eliminar '$nombre'. ". $db->getError();
			}

		break;


		case 'eliminar':
			$success = false;
			$id = $_POST['id'];
			$nombre = $_POST['nombre'];
			$rol = $_POST['rol'];

			$db = DataBase::conectar();
			$db->setQuery("DELETE FROM usuarios WHERE id_usuario = $id");

			if($db->alter()){
				echo "Usuario '$nombre' eliminado correctamente";
			}else{
				echo "Error al eliminar a '$nombre'. ". $db->getError();
			}

			if ($rol=='cliente') {
				$db->setQuery("DELETE FROM clientes  WHERE id_usuario = $id");
				if($db->alter()){
					echo "<br>Cliente '$nombre' eliminado correctamente";
				}else{
					echo "Error al eliminar al cliente '$nombre'. ". $db->getError();
				}

			}elseif ($rol=='proveedor') {
				$db->setQuery("DELETE FROM proveedores  WHERE id_usuario = $id");
				if($db->alter()){
					echo "<br>Proveedor '$nombre' eliminado correctamente";
				}else{
					echo "Error al eliminar al proveedor '$nombre'. ". $db->getError();
				}
			}
		elseif ($rol=='portero') {
			$db->setQuery("DELETE FROM porteros  WHERE id_usuario = $id");
			if($db->alter()){
				echo "<br>Portero '$nombre' eliminado correctamente";
			}else{
				echo "Error al eliminar al portero '$nombre'. ". $db->getError();
			}
		}






		break;















	}


?>
