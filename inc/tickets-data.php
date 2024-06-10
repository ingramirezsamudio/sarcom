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
			$id_proveedor = $_REQUEST['id_proveedor'];
			$limit = $_REQUEST['limit'];
			$offset	= $_REQUEST['offset'];
			$order = $_REQUEST['order'];
			$sort = $_REQUEST['sort'];
			if (!isset($sort)) $sort = 2;


			if (isset($_REQUEST['search']) && !empty($_REQUEST['search'])){
				$search = $_REQUEST['search'];
				$where = "AND CONCAT_WS(' ', puerto) LIKE '%$search%'";
			}

			$db->setQuery("SELECT  t.estado, cp.id_cupos_proveedor, cp.id_cupo, cp.id_proveedor, cp.cantidad as cantidad_asignada, c.id_cliente, c.id_puerto,
DATE_FORMAT(c.fecha, '%d-%m-%Y') as fecha, DATE_FORMAT(c.fecha_fin, '%d-%m-%Y') as fecha_fin, DATE_FORMAT(t.fecha_de_creacion, '%d-%m-%Y') as fecha_de_creacion, c.cantidad as cantidad_disponible, cl.razon_social, p.puerto, t.id_ticket, t.id_chofer, t.chapa, ch.nombre as chofer, pr.nombre as proveedor, c.id_usuario, u.usuario
			FROM tickets t
      left join cupos_proveedor cp on t.id_cupos_proveedor=cp.id_cupos_proveedor
			left join cupos c on c.id_cupo=cp.id_cupo
			left join clientes cl on cl.id_cliente=c.id_cliente
			left join puertos p on p.id_puerto=c.id_puerto
			left join choferes ch on ch.id_chofer=t.id_chofer
			left join proveedores pr on pr.id_proveedor=cp.id_proveedor
			left join usuarios u on t.id_usuario=u.id_usuario


			WHERE 1=1 $where
			and cp.id_proveedor=$id_proveedor

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

			$db->setQuery("  SELECT SQL_CALC_FOUND_ROWS *
												from proveedores
							");
			$rows = $db->loadObjectList();
			echo json_encode($rows);
		break;

		case 'buscar_clientes':
			$db = DataBase::conectar();

			$db->setQuery("  SELECT SQL_CALC_FOUND_ROWS *
												from clientes
							");
			$rows = $db->loadObjectList();
			echo json_encode($rows);
		break;

		case 'buscar_choferes':
			$db = DataBase::conectar();

			$db->setQuery("  SELECT SQL_CALC_FOUND_ROWS *
												from choferes
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

		case 'cargar_ticket':
			$db = DataBase::conectar();
			$hidden_id_cupos_proveedor = $db->clearText($_POST['hidden_id_cupos_proveedor']);
			$chofer = $db->clearText($_POST['chofer']);
			$chapa = $db->clearText($_POST['chapa']);
			$fecha_chofer = $db->clearText($_POST['fecha_chofer']);
			$id_usuario = $db->clearText($_POST['hidden_id_usuario']);
			$cantidad = $db->clearText($_POST['cantidad_chofer']);
			$a=0;

			// if (empty($chofer)){
			// 	echo "Error. Favor seleccione un Chofer";
			// 	exit;
			// }elseif (empty($chapa)) {
			// 	echo "Error. Un numero de chapa debe ser cargado";
			// 	exit;

			// }else
			if (empty($fecha_chofer)) {
				echo "Error. Una fecha debe estar asignada";
				exit;
			}
			if (empty($cantidad)) {
				echo "Error. Debe seleccionar una cantidad";
				exit;
			}



			while ($a < $cantidad) {
				$db->setQuery("INSERT INTO tickets (id_cupos_proveedor, id_chofer, chapa, fecha_de_creacion, estado, id_usuario)
								VALUES ('$hidden_id_cupos_proveedor','$chofer','$chapa','$fecha_chofer','PENDIENTE','$id_usuario')");
				if(!$db->alter()){
					echo "Error. ".$db->getError();
				}else{
					if ($a==1) {
						echo "Ticket/s registrado correctamente";
					}
				}
				$a++;
			}






			$db->setQuery("UPDATE cupos_proveedor SET estado='INICIADO', cantidad=cantidad-$cantidad
											WHERE id_cupos_proveedor = '$hidden_id_cupos_proveedor'");

			if(!$db->alter()){
				echo "Error. ". $db->getError();
			}else{
				echo "<BR>Estado del cupo, modificado";
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

		case 'editar_ticket':

			$db = DataBase::conectar();
			$id_cupos_proveedor = $_POST['hidden_id_cupos_proveedor'];
			$id_ticket = $db->clearText($_POST['hidden_id_ticket']);
			$chofer = $db->clearText($_POST['chofer']);
			$chapa = $db->clearText($_POST['chapa']);
			$fecha_chofer = $db->clearText($_POST['fecha_chofer']);


			$db->setQuery("UPDATE tickets SET id_chofer='$chofer', chapa='$chapa', fecha_de_creacion='$fecha_chofer'
				 WHERE id_ticket = '$id_ticket'");

			if(!$db->alter()){
				echo "Error. ". $db->getError();
			}else{
				echo "Ticket nro: '$id_ticket' modificado correctamente";
			}

		break;

		case 'eliminar':
			$success = false;
			$id = $_POST['id'];
			$id_cupos_proveedor = $_POST['id_cupos_proveedor'];
			$nombre = $_POST['nombre'];

			$db = DataBase::conectar();
			$db->setQuery("DELETE FROM tickets WHERE id_ticket = $id");

			if($db->alter()){
				echo "Cupo nro: '$id' eliminado correctamente";
			}else{
				echo "Error al cupo nro: '$id'. ". $db->getError();
			}

			$db->setQuery("UPDATE cupos_proveedor SET estado='INICIADO', cantidad=cantidad+1
				WHERE id_cupos_proveedor = '$id_cupos_proveedor'");

			if(!$db->alter()){
				echo "Error. ". $db->getError();
			}else{
				echo "<BR>Cupo eliminado y devuelto a total de cupos disponibles";
			}



		break;



		case 'ver_cupos':
			$db = DataBase::conectar();
			$where = "";
			$hoy = date('Y-m-d');

			//Parametros de ordenamiento, busqueda y paginacion
			$id_proveedor = $_REQUEST['id_proveedor'];
			$limit = $_REQUEST['limit'];
			$offset	= $_REQUEST['offset'];
			$order = $_REQUEST['order'];
			$sort = $_REQUEST['sort'];
			if (!isset($sort)) $sort = 2;

			if (isset($_REQUEST['search']) && !empty($_REQUEST['search'])){
				$search = $_REQUEST['search'];
				$where = "AND CONCAT_WS(' ', puerto) LIKE '%$search%'";
			}

			$db->setQuery("SELECT cp.id_cupos_proveedor, cp.id_cupo, cp.id_proveedor,c.id_cliente,c.id_puerto, cp.cantidad cantidad_disponible, cp.estado,  DATE_FORMAT(c.fecha, '%d-%m-%Y') as fecha_cupo, cl.razon_social, p.puerto
				from cupos_proveedor cp
				left join cupos c on cp.id_cupo=c.id_cupo
				LEFT JOIN clientes cl on cl.id_cliente=c.id_cliente
				left join puertos p on p.id_puerto=c.id_puerto

				WHERE 1=1 $where
				AND cp.id_proveedor='$id_proveedor'
				AND c.fecha_fin>='$hoy'

				-- and cp.estado='DISPONIBLE'
				-- dor cp.estado='INICIADO'
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




	}


?>
