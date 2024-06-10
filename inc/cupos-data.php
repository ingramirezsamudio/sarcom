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
				$where = "AND CONCAT_WS(' ', pu.puerto, cl.razon_social) LIKE '%$search%'";
			}

			$db->setQuery("SELECT  c.id_cupo, c.id_cliente, c.id_puerto, DATE_FORMAT(c.fecha, '%d-%m-%Y') as fecha,DATE_FORMAT(c.fecha_fin, '%d-%m-%Y') as fecha_fin, c.id_proveedor, c.cantidad,c.cantidad_original, cl.razon_social as cliente,
				pu.puerto, p.nombre as proveedor, c.id_usuario, u.usuario, c.repetir,
				DATE_FORMAT(c.repetir_hasta, '%d-%m-%Y') as repetir_hasta
				FROM cupos c
				left join clientes cl on cl.id_cliente=c.id_cliente
				left join proveedores p on p.id_proveedor=c.id_proveedor
				left join puertos pu on pu.id_puerto=c.id_puerto
				left join usuarios u on c.id_usuario=u.id_usuario

				WHERE 1=1 $where
				and c.cantidad > 0
				and c.fecha_fin >= DATE(NOW())
				ORDER BY $sort $order LIMIT $offset, $limit");
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


		case 'ver_agotados':
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

			$db->setQuery("SELECT  c.id_cupo, c.id_cliente, c.id_puerto,DATE_FORMAT(c.fecha, '%d-%m-%Y') as fecha, DATE_FORMAT(c.fecha_fin, '%d-%m-%Y') as fecha_fin, c.id_proveedor, c.cantidad,c.cantidad_original, cl.razon_social as cliente,
			pu.puerto, p.nombre as proveedor, DATE_FORMAT(c.repetir_hasta, '%d-%m-%Y') as repetir_hasta, c.repetir
				FROM cupos c
				left join clientes cl on cl.id_cliente=c.id_cliente
				left join proveedores p on p.id_proveedor=c.id_proveedor
				left join puertos pu on pu.id_puerto=c.id_puerto

				WHERE 1=1 $where
				ORDER BY $sort $order LIMIT $offset, $limit");
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

		case 'ver_vencidos':
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

			$db->setQuery("SELECT  c.id_cupo, c.id_cliente, c.id_puerto, DATE_FORMAT(c.fecha, '%d-%m-%Y') as fecha, DATE_FORMAT(c.fecha_fin, '%d-%m-%Y') as fecha_fin, c.id_proveedor, c.cantidad,c.cantidad_original, cl.razon_social as cliente, pu.puerto, p.nombre as proveedor,
				DATE_FORMAT(c.repetir_hasta, '%d-%m-%Y') as repetir_hasta, c.repetir
				FROM cupos c
				left join clientes cl on cl.id_cliente=c.id_cliente
				left join proveedores p on p.id_proveedor=c.id_proveedor
				left join puertos pu on pu.id_puerto=c.id_puerto

				WHERE 1=1 $where
				ORDER BY $sort $order LIMIT $offset, $limit");
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

		case 'buscar_puertos':
			$db = DataBase::conectar();

			$db->setQuery("  SELECT SQL_CALC_FOUND_ROWS *
                        from puertos p
							");
			$rows = $db->loadObjectList();
			echo json_encode($rows);
		break;


				case 'buscar_proveedor':
					$db = DataBase::conectar();
					$term	= $_REQUEST['term'];
					$db->setQuery("  SELECT SQL_CALC_FOUND_ROWS *
														from proveedores
														where nombre LIKE '%$term%'
									");
					$rows = $db->loadObjectList();
					echo json_encode($rows);
				break;
		case 'buscar_clientes':
			$db = DataBase::conectar();
			$term	= $_REQUEST['term'];


			$db->setQuery("  SELECT SQL_CALC_FOUND_ROWS *
												from clientes
												where razon_social LIKE '%$term%'
												-- group by razon_social

							");
			$rows = $db->loadObjectList();
			echo json_encode($rows);
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
			$puertos = $db->clearText($_POST['puertos']);
			$clientes = $db->clearText($_POST['clientes']);
			$proveedor = $db->clearText($_POST['proveedor']);
			$fecha = $db->clearText($_POST['fecha']);
			$fecha_fin = $db->clearText($_POST['fecha_fin']);
			$cantidad = $db->clearText($_POST['cantidad']);
			$id_usuario = $db->clearText($_POST['hidden_id_usuario']);
			$hidden_repetir = $db->clearText($_POST['hidden_repetir']);
			$repetir = $db->clearText($_POST['repetir']);


			if (empty($puertos)){
				echo "Error. Favor seleccione un Puerto";
				exit;
			}elseif (empty($clientes)) {
				echo "Error. Un cliente debe estar seleccionado";
				exit;

			}elseif (empty($fecha)) {
				echo "Error. Una fecha debe estar asignada";
				exit;
			}elseif (empty($cantidad)) {
				echo "Error. Debe establecer una cantidad";
				exit;
			}	elseif (empty($repetir) && $hidden_repetir=='si') {
					echo "Error. Debe establecer una fecha tope de repeticion";
					exit;
			}

			if ($hidden_repetir=='si') {
				$db->setQuery("INSERT INTO cupos (id_cliente, id_puerto, fecha, id_proveedor, cantidad, cantidad_original, fecha_fin, id_usuario, repetir, repetir_hasta)
								VALUES ('$clientes','$puertos','$fecha','$proveedor','$cantidad','$cantidad','$fecha_fin','$id_usuario','$hidden_repetir','$repetir')");

			}else {
				$db->setQuery("INSERT INTO cupos (id_cliente, id_puerto, fecha, id_proveedor, cantidad, cantidad_original, fecha_fin, id_usuario)
								VALUES ('$clientes','$puertos','$fecha','$proveedor','$cantidad','$cantidad','$fecha_fin','$id_usuario')");

			}



			if(!$db->alter()){
				echo "Error. ".$db->getError();
			}else{
				echo "Cupo registrado correctamente";
			}

		break;

		case 'editar':

			$db = DataBase::conectar();
			$id_cupo = $_POST['hidden_id_cupo'];
			$puertos = $db->clearText($_POST['puertos']);
			$clientes = $db->clearText($_POST['clientes']);
			$proveedor = $db->clearText($_POST['proveedor']);
			$fecha = $db->clearText($_POST['fecha']);
			$fecha_fin = $db->clearText($_POST['fecha_fin']);
			$cantidad = $db->clearText($_POST['cantidad']);
			$id_usuario = $db->clearText($_POST['hidden_id_usuario']);
			$hidden_repetir = $db->clearText($_POST['hidden_repetir']);
			$repetir = $db->clearText($_POST['repetir']);

			if (empty($puertos)){
				echo "Error. Favor seleccione un Puerto";
				exit;
			}elseif (empty($clientes)) {
				echo "Error. Un cliente debe estar seleccionado";
				exit;

			}elseif (empty($fecha)) {
				echo "Error. Una fecha debe estar asignada";
				exit;
			}elseif (empty($cantidad)) {
				echo "Error. Debe establecer una cantidad";
				exit;
			}	elseif (empty($repetir) && $hidden_repetir=='si') {
					echo "Error. Debe establecer una fecha tope de repeticion";
					exit;
			}

			if ($hidden_repetir=='si') {
				$db->setQuery("UPDATE cupos SET id_cliente='$clientes', id_puerto='$puertos', fecha='$fecha',fecha_fin='$fecha_fin',
					id_proveedor='$proveedor', cantidad='$cantidad' ,cantidad_original='$cantidad' , id_usuario='$id_usuario', repetir='si', repetir_hasta='$repetir' WHERE id_cupo = '$id_cupo'");
			}else {
				$db->setQuery("UPDATE cupos SET id_cliente='$clientes', id_puerto='$puertos', fecha='$fecha',fecha_fin='$fecha_fin',
					id_proveedor='$proveedor', cantidad='$cantidad' ,cantidad_original='$cantidad', id_usuario='$id_usuario' , repetir='no', repetir_hasta=null WHERE id_cupo = '$id_cupo'");
			}



			if(!$db->alter()){
				echo "Error. ". $db->getError();
			}else{
				echo "Cupo nro: '$id_cupo' modificado correctamente";
			}

		break;

		case 'eliminar':
			$success = false;
			$id = $_POST['id'];
			$nombre = $_POST['nombre'];

			$db = DataBase::conectar();
			$db->setQuery("DELETE FROM cupos WHERE id_cupo = $id");

			if($db->alter()){
				echo "Cupo nro: '$id' eliminado correctamente";
			}else{
				echo "Error al cupo nro: '$id'. ". $db->getError();
			}

			$db->setQuery("DELETE FROM cupos_proveedor WHERE id_cupo = $id");

			if($db->alter()){
				echo "<br>Cupo/s asignados a proveedores con ID: '$id' eliminado/s correctamente";
			}else{
				echo "Error al cupo nro: '$id'. ". $db->getError();
			}




		break;

	}


?>
