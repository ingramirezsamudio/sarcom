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
			$id_cliente = $_REQUEST['id_cliente'];
			if (!isset($sort)) $sort = 2;

			if (isset($_REQUEST['search']) && !empty($_REQUEST['search'])){
				$search = $_REQUEST['search'];
				$where = "AND CONCAT_WS(' ', puerto) LIKE '%$search%'";
			}

			$db->setQuery("SELECT  c.cantidad_original, cp.id_cupos_proveedor, cp.id_cupo, c.id_cliente, cl.razon_social as cliente, c.id_puerto, pu.puerto,
				DATE_FORMAT(c.fecha, '%d-%m-%Y') AS fecha, DATE_FORMAT(c.fecha_fin, '%d-%m-%Y') AS fecha_fin,  cp.id_proveedor,
				p.nombre as proveedor, cp.cantidad, DATE_FORMAT(cp.repetir_hasta, '%d-%m-%Y') as repetir_hasta,cp.repetir,cp.id_usuario, u.usuario
				FROM cupos_proveedor cp
        		left join cupos c on c.id_cupo=cp.id_cupo
				left join clientes cl on cl.id_cliente=c.id_cliente
				left join proveedores p on p.id_proveedor=cp.id_proveedor
				left join puertos pu on pu.id_puerto=c.id_puerto
				left join usuarios u on cp.id_usuario=u.id_usuario


				WHERE 1=1 $where
				AND cl.id_cliente='$id_cliente'
				and cp.cantidad > 0
				and c.fecha_fin >= DATE(NOW())


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

		case 'ver_agotados':
			$db = DataBase::conectar();
			$where = "";
			//Parametros de ordenamiento, busqueda y paginacion
			$limit = $_REQUEST['limit'];
			$offset	= $_REQUEST['offset'];
			$order = $_REQUEST['order'];
			$sort = $_REQUEST['sort'];
			$id_cliente = $_REQUEST['id_cliente'];
			if (!isset($sort)) $sort = 2;

			if (isset($_REQUEST['search']) && !empty($_REQUEST['search'])){
				$search = $_REQUEST['search'];
				$where = "AND CONCAT_WS(' ', puerto) LIKE '%$search%'";
			}

			$db->setQuery("SELECT  c.cantidad_original,cp.id_cupos_proveedor, cp.id_cupo, c.id_cliente, cl.razon_social as cliente, c.id_puerto, pu.puerto,
				DATE_FORMAT(c.fecha, '%d-%m-%Y') AS fecha, DATE_FORMAT(c.fecha_fin, '%d-%m-%Y') AS fecha_fin,  cp.id_proveedor,
				p.nombre as proveedor, cp.cantidad, DATE_FORMAT(cp.repetir_hasta, '%d-%m-%Y') as repetir_hasta,cp.repetir,cp.id_usuario, u.usuario
				FROM cupos_proveedor cp
				left join cupos c on c.id_cupo=cp.id_cupo
				left join clientes cl on cl.id_cliente=c.id_cliente
				left join proveedores p on p.id_proveedor=cp.id_proveedor
				left join puertos pu on pu.id_puerto=c.id_puerto
				left join usuarios u on cp.id_usuario=u.id_usuario


				WHERE 1=1 $where
				AND cl.id_cliente='$id_cliente'
				and cp.cantidad = 0
				-- and c.fecha_fin >= DATE(NOW())


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

		case 'ver_vencidos':


		
			$db = DataBase::conectar();
			$where = "";
			//Parametros de ordenamiento, busqueda y paginacion
			$limit = $_REQUEST['limit'];
			$offset	= $_REQUEST['offset'];
			$order = $_REQUEST['order'];
			$sort = $_REQUEST['sort'];
			$id_cliente = $_REQUEST['id_cliente'];
			if (!isset($sort)) $sort = 2;

			if (isset($_REQUEST['search']) && !empty($_REQUEST['search'])){
				$search = $_REQUEST['search'];
				$where = "AND CONCAT_WS(' ', puerto) LIKE '%$search%'";
			}

			$db->setQuery("SELECT  cp.id_cupos_proveedor, cp.id_cupo, c.id_cliente, cl.razon_social as cliente, c.id_puerto, pu.puerto,
				DATE_FORMAT(c.fecha, '%d-%m-%Y') AS fecha, DATE_FORMAT(c.fecha_fin, '%d-%m-%Y') AS fecha_fin,  cp.id_proveedor,
				p.nombre as proveedor, cp.cantidad, DATE_FORMAT(cp.repetir_hasta, '%d-%m-%Y') as repetir_hasta,cp.repetir,cp.id_usuario, u.usuario
				FROM cupos_proveedor cp
				left join cupos c on c.id_cupo=cp.id_cupo
				left join clientes cl on cl.id_cliente=c.id_cliente
				left join proveedores p on p.id_proveedor=cp.id_proveedor
				left join puertos pu on pu.id_puerto=c.id_puerto
				left join usuarios u on cp.id_usuario=u.id_usuario


				WHERE 1=1 $where
				AND cl.id_cliente='$id_cliente'
				and cp.cantidad > 0
				and c.fecha_fin < DATE(NOW())


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




		case 'ver_cupos':
			$db = DataBase::conectar();
			$where = "";
			$hoy = date('Y-m-d');

			//Parametros de ordenamiento, busqueda y paginacion
			$id_cliente = $_REQUEST['id_cliente'];
			$limit = $_REQUEST['limit'];
			$offset	= $_REQUEST['offset'];
			$order = $_REQUEST['order'];
			$sort = $_REQUEST['sort'];
			if (!isset($sort)) $sort = 2;

			if (isset($_REQUEST['search']) && !empty($_REQUEST['search'])){
				$search = $_REQUEST['search'];
				$where = "AND CONCAT_WS(' ', puerto) LIKE '%$search%'";
			}

			$db->setQuery("SELECT  c.id_cupo, c.id_cliente, c.id_puerto, DATE_FORMAT(c.fecha, '%d-%m-%Y') AS fecha,
			DATE_FORMAT(c.fecha_fin, '%d-%m-%Y') AS fecha_fin, c.id_proveedor, c.cantidad, cl.razon_social as cliente,
			pu.puerto, p.nombre as proveedor
				FROM cupos c
				left join clientes cl on cl.id_cliente=c.id_cliente
				left join proveedores p on p.id_proveedor=c.id_proveedor
				left join puertos pu on pu.id_puerto=c.id_puerto
				-- left join cupos_proveedor cu on cu.id_cupo=c.id_cupo

				WHERE 1=1 $where
				AND c.id_cliente='$id_cliente'
				AND c.fecha_fin>='$hoy'
				AND c.cantidad>0
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

		case 'ver_cupos_editar':
			$db = DataBase::conectar();
			$id_cupo = $_REQUEST['id_cupo'];
			$db->setQuery("SELECT  *
				FROM cupos
				WHERE id_cupo=$id_cupo
				");
			$rows = $db->loadObject();
			echo json_encode($rows);
			exit;




			$where = "";
			//Parametros de ordenamiento, busqueda y paginacion
			$id_cliente = $_REQUEST['id_cliente'];
			$limit = $_REQUEST['limit'];
			$offset	= $_REQUEST['offset'];
			$order = $_REQUEST['order'];
			$sort = $_REQUEST['sort'];
			if (!isset($sort)) $sort = 2;

			if (isset($_REQUEST['search']) && !empty($_REQUEST['search'])){
				$search = $_REQUEST['search'];
				$where = "AND CONCAT_WS(' ', puerto) LIKE '%$search%'";
			}

			$db->setQuery("SELECT  c.id_cupo, c.id_cliente, c.id_puerto, c.fecha, c.id_proveedor, c.cantidad, cl.razon_social as cliente, pu.puerto, p.nombre as proveedor
				FROM cupos c
				left join clientes cl on cl.id_cliente=c.id_cliente
				left join proveedores p on p.id_proveedor=c.id_proveedor
				left join puertos pu on pu.id_puerto=c.id_puerto

				WHERE 1=1 $where
				AND c.id_cliente=$id_cliente
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
												-- group by nombre
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
			$cantidad = $db->clearText($_POST['cantidad']);


			if (empty($puertos)){
				echo "Error. Favor seleccione un Puerto";
				exit;
			}elseif (empty($clientes)) {
				echo "Error. Un cliente debe estar seleccionado";
				exit;
			}elseif (empty($proveedor)) {
				echo "Error. Un proveedor debe estar seleccionado";
				exit;
			}elseif (empty($fecha)) {
				echo "Error. Una fecha debe estar asignada";
				exit;
			}elseif (empty($cantidad)) {
				echo "Error. Debe establecer una cantidad";
				exit;
			}

			$db->setQuery("INSERT INTO cupos (id_cliente, id_puerto, fecha, id_proveedor, cantidad)
							VALUES ('$clientes','$puertos','$fecha','$proveedor','$cantidad')");

			if(!$db->alter()){
				echo "Error. ".$db->getError();
			}else{
				echo "Cupo registrado correctamente";
			}

		break;




		case 'asignar_cupos':
			$db = DataBase::conectar();
			$id_cupo = $db->clearText($_POST['hidden_id_cupo']);
			$id_clientes = $db->clearText($_POST['hidden_id_cliente']);
			$id_usuario = $db->clearText($_POST['hidden_id_usuario']);
			$proveedor = $db->clearText($_POST['proveedor']);
			$cantidad = $db->clearText($_POST['cantidad']);
			$agotado = $db->clearText($_POST['agotado']);
			$hidden_repetir = $db->clearText($_POST['hidden_repetir']);
			$repetir_hasta = $db->clearText($_POST['repetir']);

			if (empty($id_cupo)){
				echo "Error. Al seleccionar el cupo";
				exit;
			}elseif (empty($id_clientes)) {
				echo "Error. Un cliente debe estar seleccionado";
				exit;
			}elseif (empty($proveedor)) {
				echo "Error. Un proveedor debe estar seleccionado";
				exit;
			}elseif (empty($cantidad)) {
				echo "Error. Debe establecer una cantidad";
				exit;
			}



			if ($repetir_hasta=='') {
				$repetir='no';
				$db->setQuery("INSERT INTO cupos_proveedor (id_cupo, id_proveedor, cantidad, estado, cantidad_asignada, id_usuario)
								VALUES ('$id_cupo','$proveedor','$cantidad','DISPONIBLE','$cantidad','$id_usuario')");
			}else {
				$repetir='si';
				$db->setQuery("INSERT INTO cupos_proveedor (id_cupo, id_proveedor, cantidad, estado, cantidad_asignada, repetir, repetir_hasta, id_usuario)
								VALUES ('$id_cupo','$proveedor','$cantidad','DISPONIBLE','$cantidad','$repetir','$repetir_hasta','$id_usuario')");

			}
			if(!$db->alter()){
				echo "Error. ".$db->getError();
			}else{
				echo "Cupo asignado al proveedor correctamente";
			}


			$db->setQuery("UPDATE cupos SET cantidad=cantidad-'$cantidad'
				WHERE id_cupo = '$id_cupo'");

			if(!$db->alter()){
				echo "Error. ". $db->getError();
			}else{
				echo "<br>Cantidad de cupos descontados correctamente";
			}

			if ($agotado=='si') {
				$db->setQuery("UPDATE cupos SET estado='AGOTADO'
					WHERE id_cupo = '$id_cupo'");

				if(!$db->alter()){
					echo "Error. ". $db->getError();
				}else{
					echo "<br>Cantidad de cupos AGOTADOS";
				}
			}






		break;


		case 'editar_cupos':
			$db = DataBase::conectar();
			$id_cupo = $db->clearText($_POST['hidden_id_cupo_editar']);
			$id_usuario = $db->clearText($_POST['hidden_id_usuario_editar']);
			$id_cupos_proveedor = $db->clearText($_POST['hidden_id_cupo_proveedor_editar']);
			$id_clientes = $db->clearText($_POST['hidden_id_cliente_editar']);
			$proveedor = $db->clearText($_POST['proveedor_editar']);
			$cantidad_original = intval($db->clearText($_POST['hidden_cantidad_original']));
			$cantidad = intval($db->clearText($_POST['cantidad_editar']));

			$repetir = $db->clearText($_POST['hidden_repetir']);
			$repetir_hasta = $db->clearText($_POST['repetir_editar']);

			if ($repetir=='si') {
				if (empty($repetir_hasta)){
					echo "Error. Al debe asignar una fecha final de la repeticion";
					exit;
			}};

			if (empty($id_cupo)){
				echo "Error. Al seleccionar el cupo";
				exit;
			}elseif (empty($id_clientes)) {
				echo "Error. Un cliente debe estar seleccionado";
				exit;
			}elseif (empty($proveedor)) {
				echo "Error. Un proveedor debe estar seleccionado";
				exit;
			}elseif (empty($cantidad)) {
				echo "Error. Debe establecer una cantidad";
				exit;
			}


			//si la cantidad fue modificada, devolvemos a los cupos sin asignar
			if ($cantidad_original!=$cantidad) {
				if ($cantidad<$cantidad_original) {
					// echo "<br>La cantidad nueva es MENOR=SUMAR";
					$cantidad_final = $cantidad_original-$cantidad;
					echo "<br>$cantidad_final";

					$db->setQuery("UPDATE cupos SET cantidad=cantidad+'$cantidad_final'
						WHERE id_cupo = '$id_cupo'");
						if(!$db->alter()){
							echo "Error. ". $db->getError();
						}else{
							echo "<br>Cupos editados correctamente";}



				}else {
					// echo "<br>La cantidad nueva es MAYOR=RESTAR";
					$cantidad_final = $cantidad_original-$cantidad;
					echo "<br>$cantidad_final";

					$db->setQuery("UPDATE cupos SET cantidad=cantidad+'$cantidad_final'
						WHERE id_cupo = '$id_cupo'");
						if(!$db->alter()){
							echo "Error. ". $db->getError();
						}else{
							echo "<br>Cupos editados correctamente";}


				}
				$cantidad_final = $cantidad_original-$cantidad;
			}else {
				echo "<br>La cantidad nueva se mantiene";
			}


			if ($repetir=='si') {
				$db->setQuery("UPDATE cupos_proveedor SET repetir_hasta='$repetir_hasta',repetir='$repetir',cantidad='$cantidad' ,cantidad_asignada='$cantidad', id_proveedor='$proveedor', id_usuario='$id_usuario'
					WHERE id_cupos_proveedor = '$id_cupos_proveedor'");

			}else {
				$db->setQuery("UPDATE cupos_proveedor SET repetir_hasta=null, repetir='$repetir', cantidad='$cantidad', cantidad_asignada='$cantidad', id_proveedor='$proveedor', id_usuario='$id_usuario'
					WHERE id_cupos_proveedor = '$id_cupos_proveedor'");
				}




			if(!$db->alter()){
				echo "Error. ". $db->getError();
			}else{
				echo "<br>Cupos editados correctamente";
			}





		break;


























		case 'editar':

			$db = DataBase::conectar();
			$id_cupo = $_POST['hidden_id_cupo'];
			$puertos = $db->clearText($_POST['puertos']);
			$clientes = $db->clearText($_POST['clientes']);
			$proveedor = $db->clearText($_POST['proveedor']);
			$fecha = $db->clearText($_POST['fecha']);
			$cantidad = $db->clearText($_POST['cantidad']);


			$db->setQuery("UPDATE cupos SET id_cliente='$clientes', id_puerto='$puertos', fecha='$fecha',
				id_proveedor='$proveedor', cantidad='$cantidad' WHERE id_cupo = '$id_cupo'");

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

			$db->setQuery("SELECT * from cupos_proveedor where id_cupos_proveedor='$id'");
			$row = $db->loadObject();
			$cantidad_original = $row->cantidad_asignada;
			$id_cupo = $row->id_cupo;

			// devolver los cupos asignados
			$db->setQuery("UPDATE cupos SET cantidad=cantidad+'$cantidad_original' 	WHERE id_cupo = '$id_cupo'");
			if(!$db->alter()){echo "Error. ". $db->getError();}else{echo "Cantidad de cupos devueltos correctamente";}

			// eliminar cupo a proveedor
			$db->setQuery("DELETE FROM cupos_proveedor WHERE id_cupos_proveedor = $id");
				if($db->alter()){
					echo "<br>Cupo a Proveedor nro: '$id' eliminado correctamente";
				}else{
					echo "Error al eliminar Cupo a Proveedor nro: '$id'. ". $db->getError();
				}

				// eliminar tickets
				$db->setQuery("DELETE FROM tickets WHERE id_cupos_proveedor = $id");
					if($db->alter()){
						echo "<br>Ticket/s eliminado/s correctamente";
					}else{
						echo "Error al eliminar Tickets ". $db->getError();
					}





		break;

	}


?>
