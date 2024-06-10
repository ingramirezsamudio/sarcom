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
			$proveedore = $db->clearText($_POST['proveedore']);

			if (empty($nombre) || empty($proveedore) || empty($ci)) {
				echo "Error. Favor complete todos los campos";
				exit;
			}

			$db->setQuery("INSERT INTO choferes (id_proveedor, ci, nombre, telefono, correo, direccion)
										VALUES('$proveedore','$ci','$nombre', '$telefono','$correo', '$direccion')");

			if(!$db->alter()){
				echo "Error. ".$db->getError();
			}else{
				echo "Proveedor registrado correctamente";
			}
		break;


		case 'cargar_proveedor':
			$db = DataBase::conectar();
			$proveedor_ruc = $db->clearText($_POST['proveedor_ruc']);
			$proveedor_nombre = $db->clearText($_POST['proveedor_nombre']);
			$proveedor_direccion = $db->clearText($_POST['proveedor_direccion']);
			$proveedor_telefono = $db->clearText($_POST['proveedor_telefono']);
			$proveedor_correo = $db->clearText($_POST['proveedor_correo']);
			$proveedor_encargado = $db->clearText($_POST['proveedor_encargado']);
			$usuario = $db->clearText($_POST['usuario']);
			$id_usuario_creador = $db->clearText($_POST['hidden_id_usuario_creador']);
			$password = sha1($db->clearText($_POST['password']));

			if (empty($proveedor_ruc) || empty($proveedor_nombre)) {
				echo "Error. El nombre y numero de RUC son indispensables";
				exit;
			}
			if (empty($usuario) || empty($password)){
				echo "Error. Se necesita un usuario y contraseña para crear un perfil de proveedor";
				exit;
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
				}if ($email_c==$proveedor_correo) {
					echo "Error. El e-mail de ya existe.";
					exit;
				}if ($nombre_apellido_e==$proveedor_nombre) {
						echo "Error. El nombre del proveedor ya existe";
						exit;
				}if ($ci_e==$proveedor_ruc) {
					echo "Error. El RUC del proveedor ya existe.";
					exit;
				}
			};



			$db->setQuery("INSERT INTO usuarios (usuario, nombre_apellido, email, ci, telefono, password, estado, fecha_registro, adminpass, tipo_usuario, direccion, foto)
			VALUES ('$usuario','$proveedor_nombre','$proveedor_correo','$proveedor_ruc','$proveedor_telefono','$password','1',NOW(),'aa1bb91d337db673c913634999d7b2b2daacca12','proveedor','$proveedor_direccion','archivos/multimedia/perfil/usuario_1_1.jpg')");

			if(!$db->alter()){
				echo "Error. ".$db->getError();
			}else{
				echo "Usuario registrado correctamente";
			}
			$id_usuario = $db->getLastID();
			$db->setQuery("INSERT INTO proveedores(ruc, id_usuario , nombre, direccion, telefono, correo, encargado, id_usuario_creador)
									VALUES('$proveedor_ruc','$id_usuario','$proveedor_nombre', '$proveedor_direccion','$proveedor_telefono','$proveedor_correo','$proveedor_encargado','$id_usuario_creador')");

			if(!$db->alter()){
				echo "Error. ".$db->getError();
			}else{
				echo "<br>Proveedor registrado correctamente";
			}
		break;

		case 'editar':

            $db = DataBase::conectar();

						$proveedor_ruc = $_POST['proveedor_ruc'];
						$hidden_id_proveedor = $_POST['hidden_id_proveedor'];
						$id_usuario = $_POST['hidden_id_usuario'];
						$id_usuario_creador = $_POST['hidden_id_usuario_creador'];
						$proveedor_nombre = $_POST['proveedor_nombre'];
						$proveedor_direccion = $_POST['proveedor_direccion'];
						$proveedor_telefono = $_POST['proveedor_telefono'];
						$proveedor_correo = $_POST['proveedor_correo'];
						$proveedor_encargado = $_POST['proveedor_encargado'];
						$usuario = $db->clearText($_POST['usuario']);
						$password = sha1($db->clearText($_POST['password']));


			if (empty($proveedor_ruc) || empty($proveedor_nombre)){
				echo "Error. Favor complete todos los campos";
				exit;
			}

			if ($id_usuario=='') {
				//echo "Se creará un perfil de usuario";
				if (empty($usuario) || empty($password)){
					echo "Error. Un nombre de usuario y contraseña son requeridos para la creación de un perfil de Proveedor";
					exit;
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
					}if ($email_c==$proveedor_correo) {
						echo "Error. El e-mail de ya existe.";
						exit;
					}
				};


				$db->setQuery("INSERT INTO usuarios (usuario, nombre_apellido, email, ci, telefono, password, estado, fecha_registro, adminpass, tipo_usuario, direccion, foto)
				VALUES ('$usuario','$proveedor_nombre','$proveedor_correo','$proveedor_ruc','$proveedor_telefono','$password','1',NOW(),'aa1bb91d337db673c913634999d7b2b2daacca12','proveedor','$proveedor_direccion','archivos/multimedia/perfil/usuario_1_1.jpg')");

				if(!$db->alter()){
					echo "Error. ".$db->getError();
				}else{
					echo "Usuario registrado correctamente";
				}
				$id_usuario = $db->getLastID();

				$db->setQuery("UPDATE proveedores SET id_usuario='$id_usuario',ruc='$proveedor_ruc', nombre='$proveedor_nombre', direccion='$proveedor_direccion',
					telefono='$proveedor_telefono', correo='$proveedor_correo', encargado='$proveedor_encargado'
				WHERE id_proveedor = '$hidden_id_proveedor'");

				if(!$db->alter()){
					echo "Error. ". $db->getError();
				}else{
					echo "<br>Proveedor modificado correctamente";
				}
			}else {
				//echo "NONONO se creara un perfil de usuario";
				$db->setQuery("UPDATE proveedores SET ruc='$proveedor_ruc', nombre='$proveedor_nombre', direccion='$proveedor_direccion',
					telefono='$proveedor_telefono', correo='$proveedor_correo', encargado='$proveedor_encargado'
				WHERE id_proveedor = '$hidden_id_proveedor'");

				if(!$db->alter()){
					echo "Error. ". $db->getError();
				}else{
					echo "Proveedor modificado correctamente";
				}
				if ($usuario=='' || $password=='') {

				}else {
					$db->setQuery("UPDATE usuarios SET usuario='$usuario', password='$password', verificado='no'
					WHERE id_usuario = '$id_usuario'");
					if(!$db->alter()){
						echo "Error. ". $db->getError();
					}else{
						echo "<br>Usuario modificado correctamente";
					}
				}







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
				$where = "AND CONCAT_WS(' ', ruc, nombre, direccion, encargado) LIKE '%$search%'";
			}

			$db->setQuery("SELECT SQL_CALC_FOUND_ROWS *
			FROM proveedores
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
			$id_proveedor = $_REQUEST['id_proveedor'];
			$limit = $_REQUEST['limit'];
			$offset	= $_REQUEST['offset'];
			$order = $_REQUEST['order'];
			$sort = $_REQUEST['sort'];


			$db->setQuery("SELECT l.id as id_pedido, l.razon_social, l.ruc, l.nro_casa, l.zona, l.fecha_tope, l.id_proveedor, l.estado, l.correo,
				l.observaciones, l.cantidad_reprogramaciones, c.razon_social as proveedore, concat(d.direccion,' ',d.observacion) as direccion,
				z.zona, l.consideraciones,l.ubicacion,l.firma,l.hora_confirmacion as entregado
											FROM lista_pedidos l
											left join direcciones d on d.id_direccion=l.direccion
											left join zonas z on z.id_zona=l.zona
											left join lotes lo on lo.id_proveedor=l.id_proveedor
											left join clientes c on c.id_cliente=lo.id_proveedor
											WHERE l.id_proveedor='$id_proveedor'
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



        case 'eliminar':

			$success = false;
			$id = $_POST['id'];

			$db = DataBase::conectar();

						$db->setQuery("SELECT * from proveedores WHERE id_proveedor = $id");
						$row = $db->loadObject();
						$id_usuario= $row->id_usuario;

						$db->setQuery("DELETE FROM usuarios WHERE id_usuario = $id_usuario");

						if($db->alter()){
							echo "Usuario del proveedor '$nombre' eliminado correctamente";
						}else{
							echo "Error al eliminar '$nombre'. ". $db->getError();
						}




			$db->setQuery("DELETE FROM proveedores WHERE id_proveedor = $id");

			if($db->alter()){
				echo "Proveedor eliminado correctamente";
			}else{
				echo "Error al eliminar Proveedor". $db->getError();
			}

		break;

		case 'buscar_proveedores':
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
					$salida[] = ['id_proveedor' => $r->id_proveedor, 'proveedore' => $r->nombre, 'total_count'=>$count];
				}
			}else{
				$salida[] = ['id_proveedor' => '', 'proveedore' => '', 'total_count'=>''];
			}

			echo json_encode($salida);
		break;

		case 'buscar_encargado':
			$db = DataBase::conectar();
			$id_cliente = $db->clearText($_GET['id_proveedor']);

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
