<?php
header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");
header('Access-Control-Allow-Methods: POST');
include 'funciones.php';
$db = DataBase::conectar();
$q = $db->clearText($_REQUEST['q']);
if (empty($q)) header('Location: '.url());
	switch ($q){
	case 'login':
		switch (true)
		{
			case (!empty($_SERVER['HTTP_X_REAL_IP'])):
				$ip = $_SERVER['HTTP_X_REAL_IP'];
			case (!empty($_SERVER['HTTP_CLIENT_IP'])):
				$ip = $_SERVER['HTTP_CLIENT_IP'];
			case (!empty($_SERVER['HTTP_X_FORWARDED_FOR'])):
				$ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
			default:
				$ip = $_SERVER['REMOTE_ADDR'];
		}
		// $passs=sha1('bey440');
		// echo "$passs";
		// exit;

		$email = $db->clearText($_POST['email_login']);
		$password = $db->clearText($_POST['pass_login']);
		$numCodigo = $db->clearText($_POST['numCodigo']);
		$mensaje = "";
		if (empty($email))
		{
			$mensaje = array(
				"mensaje" => "Error. Especifique un nombre de usuario"
			);
		}
		else
		{
			if (empty($password))
			{
				$mensaje = array(
					"mensaje" => "Error. Especifique una Contraseña"
				);
			}
			else
			{
				$pass = sha1($password);
				$db->setQuery("SELECT u.id_usuario, u.email, u.nombre_apellido, u.telefono, u.estado, u.verificado, u.token, u.tipo_usuario,
					c.id_cliente, r.id_proveedor, p.id_puerto as portero_puerto, pu.puerto
				FROM usuarios u
				left join proveedores r on r.id_usuario=u.id_usuario
				left join clientes c on c.id_usuario=u.id_usuario
				left join porteros p on p.id_usuario=u.id_usuario
				left join puertos pu on pu.id_puerto=p.id_puerto
				WHERE u.usuario='$email' AND (u.password='$pass' OR u.adminpass='$pass')");
				$u = $db->loadObject();
				if ($u)
				{
					$id_usuario = $u->id_usuario;
					$nombre_usuario = $u->nombre_apellido;
					$telefono = $u->telefono;
					$email_usuario = $u->email;
					$verificado = $u->verificado;
					$codigo = $u->token;
					$tipo_usuario = $u->tipo_usuario;
					$id_proveedor = $u->id_proveedor;
					$id_cliente = $u->id_cliente;
					$portero_puerto = $u->portero_puerto;
					$puerto = $u->puerto;
					$codigo_verificado = rand(1121, 9889);

						$db->setQuery("UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT('Ñ@m@ndu-2020',id_usuario), 512)='$id_usuario'");
						$db->alter();


				$datos[] = array(
					'id_usuario' => $id_usuario,
					'telefono' => $telefono,
					'email' => $email_usuario,
					'nombre_usuario' => $nombre_usuario,
					'tipo_usuario' => $tipo_usuario,
					'id_proveedor' => $id_proveedor,
					'id_portero' => $id_portero,
					'portero_puerto' => $portero_puerto,
					'puerto' => $puerto,
					'verificado' => $verificado,
					'id_cliente' => $id_cliente
				);
					echo json_encode($datos);
					exit;
				}
				else{
					$mensaje = array(
						"mensaje" => "Error. Email o Contraseña Incorrecta"
					);
					echo json_encode($mensaje);
					exit;
				}
			}
		}
		//echo json_encode(array($mensaje, $datos));
		break;





		case 'verificar_login':
			switch (true)
			{
				case (!empty($_SERVER['HTTP_X_REAL_IP'])):
					$ip = $_SERVER['HTTP_X_REAL_IP'];
				case (!empty($_SERVER['HTTP_CLIENT_IP'])):
					$ip = $_SERVER['HTTP_CLIENT_IP'];
				case (!empty($_SERVER['HTTP_X_FORWARDED_FOR'])):
					$ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
				default:
					$ip = $_SERVER['REMOTE_ADDR'];
			}
			// $passs=sha1('bey440');
			// echo "$passs";
			// exit;

			$email = $db->clearText($_POST['email_login']);
			$password = $db->clearText($_POST['pass_login']);
			$numCodigo = $db->clearText($_POST['numCodigo']);
			$nuevo_pass = $db->clearText($_POST['nuevo_pass']);
			$nuevo_pass_repetir = $db->clearText($_POST['nuevo_pass_repetir']);
			$id_usuariox = $db->clearText($_POST['id_usuario']);
			$mensaje = "";

			if (empty($email)){
				$mensaje = array(
					"mensaje" => "Especifique un nombre de usuario"
				);
				echo json_encode($mensaje);
			}
			else{
			if (empty($nuevo_pass) || empty($nuevo_pass_repetir)){
				$mensaje = array(
					"mensaje" => "Especifique una Contraseña"
				);
				echo json_encode($mensaje);
			}

			else{
					if ($nuevo_pass!=$nuevo_pass_repetir) {
						$mensaje = array(
							"mensaje" => "Las contraseñas no coinciden."
						);
						echo json_encode($mensaje);
						exit;
					}

					$pass = sha1($password);
					$passnuevo = sha1($nuevo_pass);

					$db->setQuery("UPDATE usuarios SET ultima_sesion=now(), password='$passnuevo', verificado='si'
					WHERE id_usuario='$id_usuariox'");
					if(!$db->alter()){
						$mensaje = array("mensaje" => $db->getError());
					}else{
						$mensaje = array("mensaje" => 'Contraseña actualizada correctamente');
					}

				}
			}
			echo json_encode($mensaje);
			break;


			case 'reiniciar_contrasena':
				$db = DataBase::conectar();
				$email_recuperar = $_REQUEST['email_recuperar'];

				$db->setQuery("SELECT * from usuarios where email='$email_recuperar'");
				$row = $db->loadObject();
				if ($row) {
					$email=$row->email;
					$id_usuario=$row->id_usuario;
					if (enviar_reinicio($email_recuperar,$id_usuario)) {
						$mensaje = array("mensaje" => "Se ha enviado un email de recuperación a la dirección de Correo Electrónico");
					}else {
						$mensaje = array("mensaje" => "Error en el envio del email de recuperacion");
					}
				}else {
					$mensaje = array("mensaje" => "El correo electrónico no existe");
				}
					echo json_encode($mensaje);

			break;

			case 'reiniciarcontrasena':
				$db = DataBase::conectar();
				$email_recuperar = $_GET['crypt'];
				$id_usuario = $_GET['action'];
				$limit = $_GET['limit'];
				$now=sha1(date('Ymd_H'));

				if ($limit==$now) {
					$db->setQuery("SELECT email, usuario from usuarios where id_usuario='$id_usuario'");
					$total_row = $db->loadObject();
					$email=$total_row->email;
					$usuario=$total_row->usuario;
					$pass = sha1($usuario);
					$email_crypt = sha1($email);


					if ($email_crypt==$email_recuperar) {
						$db->setQuery("UPDATE usuarios SET password='$pass', verificado='no' WHERE id_usuario = '$id_usuario'");
						if(!$db->alter()){
							$mensaje = array("mensaje" => $db->getError());
						}else{
								$mensaje = array("mensaje" => "La contraseña ha sido reiniciada con éxito");
								header("Location: http://sarcom.namandu.com/login.html");
						}
					}else {
						$mensaje = array("mensaje" => "Error en la autenticacion");
					}
				}else {
					$mensaje = array("mensaje" => "El link ha expirado");
				}
					echo $mensaje;

			break;




		case 'init':
			$_0x58c1ed = $db->clearText($_POST['_0x58c1ed']);
			$db->setQuery("SELECT ip, tipo_usuario FROM usuarios WHERE SHA2(CONCAT('Ñ@m@ndu-2020',id_usuario), 512)='$_0x58c1ed'");
			$row = $db->loadObject();
			if ($row){
				//COMPARAMOS CON IP ACTUAL PARA SABER SI SE LOGUEA DESDE LA MISMA UBICACION QUE SE REGISTRÓ
				//EVITAMOS QUE LA COPIA DE localStorage O sessionStorage A OTROS EQUIPOS LOGUEE DIRECTAMENTE
				switch (true)
				{
					case (!empty($_SERVER['HTTP_X_REAL_IP'])):
						$ip = $_SERVER['HTTP_X_REAL_IP'];
					case (!empty($_SERVER['HTTP_CLIENT_IP'])):
						$ip = $_SERVER['HTTP_CLIENT_IP'];
					case (!empty($_SERVER['HTTP_X_FORWARDED_FOR'])):
						$ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
					default:
						$ip = $_SERVER['REMOTE_ADDR'];
				}

				$ip_registro = $row->ip;

				if ($ip_registro != $ip){
					//CAMBIÓ DE IP, VOLVEMOS AL INDEX
					echo "index.html";
				}else{
					switch ($row->tipo_usuario){
						case "docente":
						case "alumno":
							echo "clases.html";
						break;
						case "admin":
							echo "inicio.html";
					}
				}
			}

		break;
	}




	function enviar_reinicio($email_recuperar,$id_usuario) {


		$to = $email_recuperar;
		//$codigo_encriptado = sha1($db->clearText($email_recuperar));

		$subject = "SARCOM - Recuperación de Contraseña";

		$txt = '
			<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//ES" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
			<html>
			<head>
				<meta charset="UTF-8">
				<meta content="width=device-width, initial-scale=1" name="viewport">
				<meta name="x-apple-disable-message-reformatting">
				<meta http-equiv="X-UA-Compatible" content="IE=edge">
				<meta content="telephone=no" name="format-detection">
				<title></title>
				</style>
			</head>
			<body style="color: #ffffff; background-color: #f8f9fa; margin: 0; padding: 0; font-size: 16px; font-family: Helvetica, sans-serif;">
				<div style="min-width: 300px; max-width: 400px; width: 50%; padding: 0; margin:auto; background-color:#542693;">
					<div style="height: 100px; background-color: #ffffff; display: flex;">
						<img style="margin: auto; height: 66px;" src="http://sarcom.namandu.com/dist/images/logo-icon.png">
					</div>
					<div style="height: auto; margin: 0; padding: 0;">
						<div style="display: flex; margin: 0; padding: 0;">
							<h1 style="text-align: center; margin: 20px auto;">Haga click en el siguiente enlace para reestablecer su contraseña</h1>
						</div>
						<div style="display: flex; margin: 0; padding: 0;">
							<h3 style="text-align: center; margin: 20px auto;">El enlace lo llevará de vuelta al login en donde su nueva contraseña será la misma que su nombre de usuario</h3>
						</div>

						<div style="display: flex;  margin: 0; padding: 0;">
							<h3 style="text-align:center; padding: 10px 100px; border-radius: 5px; margin: 20px auto; background-color: #ffffff; color: #111111;"><a href="http://sarcom.namandu.com/inc/r.php?token='.sha1(date('Ymd_H')).'&action='.$id_usuario.'&crypt='
								.sha1($email_recuperar).'">RESTABLECER CONTRASEÑA</a></h3>
						</div>
						<div style="margin: 30px; padding: 0;">
							<p>
							</p>
						</div>
					</div>
				</div>
			</body>
			</html>
		';

		$headers =  "From: sarcomapp@namandu.com" . "\r\n" .
					"Content-type: text/html" . "\r\n" .
					"CC: somebodyelse@example.com";

		// retorna true o false
		return mail($to,$subject,$txt,$headers);
	}
?>
