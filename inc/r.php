<?php
header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");
header('Access-Control-Allow-Methods: POST');
include 'funciones.php';
$db = DataBase::conectar();
$q = $db->clearText($_REQUEST['q']);
if (empty($q)) header('Location: '.url());

				$db = DataBase::conectar();

				if (isset($_GET['crypt'])) {
					$email_recuperar = $_GET['crypt'];
					$id_usuario = $_GET['action'];
					$limit = $_GET['token'];
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
									header("Location: http://sarcom.namandu.com/login.html?estado=exito");
							}
									}else {
											$mensaje = array("mensaje" => "Error en la autenticacion");
									}
							}else {
								$mensaje = array("mensaje" => "El link ha expirado");
							}
							echo $mensaje;


				}else {
					echo 'ERROR EN LA VALIDACION, INTENTE GENERAR UN NUEVO LINK';
					header("Location: http://sarcom.namandu.com/login.html?estado=vencido");

				}

?>
