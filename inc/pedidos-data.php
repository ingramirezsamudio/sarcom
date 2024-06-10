<?php
	header('Access-Control-Allow-Origin: *');
	header("Access-Control-Allow-Headers: Origin, X-Requested-With, cache-control, Content-Type, Accept");
	header('Access-Control-Allow-Methods: GET, POST');
	include ("funciones.php");

	$q = $_REQUEST['q'];
	$usuario = $auth->getUsername();
	$id_sucursal = datosUsuario($usuario)->id_sucursal;
	switch ($q){

		// case 'guardar_firma':

		// 	$db = DataBase::conectar();
		// 	$id_pedido	= $_REQUEST['id_pedido'];
		// 	$firma = $_REQUEST['firma'];

		// 	$db->setQuery("UPDATE lista_pedidos SET estado='ENTREGADO', firma='$firma' WHERE id = '$id_pedido'");

		// 	if(!$db->alter()){
		// 		echo "Error. ". $db->getError();
		// 	}else{
		// 		echo "Pedido de actualizado Correctamente";
		// 	}

		// break;

		case 'verificar_pin':
			$db = DataBase::conectar();
			$id_pedido	= $_REQUEST['id_pedido'];
			$pin = $_REQUEST['pin'];

			$db->setQuery("SELECT SQL_CALC_FOUND_ROWS pin FROM lista_pedidos WHERE pin = '$pin'");
			$rows = $db->loadObjectList();

			if ($rows) {
				echo "PIN correcto";
			} else {
				echo "Error. PINincorrecto";
			}
		break;

		case 'verificar_pin_datos':
			$db = DataBase::conectar();
			$pin = $_REQUEST['pin'];

			$db->setQuery("SELECT SQL_CALC_FOUND_ROWS id FROM lista_pedidos WHERE pin = '$pin'");
			$rows = $db->loadObject();

			if ($rows) {
				// $salida = ["id"=>$rows->id];
				// echo json_encode($salida);
				// exit();

				$db = DataBase::conectar();
				$id_pedido = $rows->id;

				$db->setQuery("SELECT SQL_CALC_FOUND_ROWS p.id, p.razon_social, p.ruc, DATE_FORMAT(p.fecha_tope, '%Y/%m/%d') AS fecha_tope,
																p.entidad, p.correo, d.direccion, z.zona, p.nro_casa
				FROM lista_pedidos p
				JOIN direcciones d ON p.direccion = d.id_direccion
				JOIN zonas z ON p.zona = z.id_zona
				WHERE p.id = $id_pedido");

				$rows = $db->loadObject();

				if ($rows) {
					$id = $id_pedido;
					$razon_social = $rows->razon_social;
					$ruc = $rows->ruc;
					$fecha_tope = $rows->fecha_tope;
					$entidad = $rows->entidad;
					$correo = $rows->correo;
					$direccion = $rows->direccion;
					$nro_casa = $rows->nro_casa;
					$zona = $rows->zona;
				} else {
					$id = "";
					$razon_social = "";
					$ruc = "";
					$fecha_tope = "";
					$entidad = "";
					$correo = "";
					$direccion = "";
					$nro_casa = "";
					$zona = "";
				}

				$salida = ["id"=>$id, "razon_social"=>$razon_social, "ruc"=>$ruc, "fecha_tope"=>$fecha_tope, "entidad"=>$entidad, "correo"=>$correo, "direccion"=>$direccion, "nro_casa"=>$nro_casa, "zona"=>$zona];
				echo json_encode($salida);

			} else {
				echo "Error. PINincorrecto";
			}
		break;

		case 'registrar_entrega':
			$db = DataBase::conectar();

			// $foto_cedula = $_FILES['foto_cedula']['name'];
			$id_pedido	= $_REQUEST['id_pedido'];
			$firma = $_REQUEST['firma'];
			$pin = $_REQUEST['pin'];

			$razon_social = $db->clearText($_REQUEST['razon_social']);
			$ruc = $db->clearText($_REQUEST['ruc']);
			$direccion = $db->clearText($_REQUEST['direccion']);
			$zona = $db->clearText($_REQUEST['zona']);
			$correo = $db->clearText($_REQUEST['correo']);
			$ubicacion = $db->clearText($_REQUEST['ubicacion']);
			$saltear = $db->clearText($_REQUEST['saltear']);

			$contImg = 0;
			$foto_cedula1 = '';
			$foto_cedula2 = '';
			$foto_cedula3 = '';
			$foto_cedula4 = '';
			$foto_cedula5 = '';

			if ($_FILES['foto_cedula']['name'][0]) { $foto_cedula1 = date("Ymd") . '-' . $id_pedido . '-' . $_FILES['foto_cedula']['name'][0]; }
			if ($_FILES['foto_cedula']['name'][1]) { $foto_cedula2 = date("Ymd") . '-' . $id_pedido . '-' . $_FILES['foto_cedula']['name'][1]; }
			if ($_FILES['foto_cedula']['name'][2]) { $foto_cedula3 = date("Ymd") . '-' . $id_pedido . '-' . $_FILES['foto_cedula']['name'][2]; }
			if ($_FILES['foto_cedula']['name'][3]) { $foto_cedula4 = date("Ymd") . '-' . $id_pedido . '-' . $_FILES['foto_cedula']['name'][3]; }
			if ($_FILES['foto_cedula']['name'][4]) { $foto_cedula5 = date("Ymd") . '-' . $id_pedido . '-' . $_FILES['foto_cedula']['name'][4]; }
			// echo $foto_cedula1 .' x '. $foto_cedula2 .' x '. $foto_cedula3 .' x '. $foto_cedula4 .' x '. $foto_cedula5;
    		// exit();

			// contar foto
			foreach($_FILES['foto_cedula']['name'] as $key=>$val){
				$contImg++;
			}

			$targetDir = "../dist/fotos_cedula/";
			$allowTypes = array('jpg','png','jpeg','gif');

			// crea la carpeta sino existe
			if (!file_exists("../dist/fotos_cedula")) {
				mkdir("../dist/fotos_cedula", 0777, true);
			}

			if ($contImg <= 5) {
				foreach($_FILES['foto_cedula']['name'] as $key=>$val){
					$image_name = $_FILES['foto_cedula']['name'][$key];
					$tmp_name   = $_FILES['foto_cedula']['tmp_name'][$key];
					$type       = $_FILES['foto_cedula']['type'][$key];

					// File upload path
					$fileName = basename($_FILES['foto_cedula']['name'][$key]);
					$targetFilePath = $targetDir . date("Ymd") . '-' . $id_pedido . '-' . $fileName;

					// Check whether file type is valid
					$fileType = pathinfo($targetFilePath,PATHINFO_EXTENSION);
					if(in_array($fileType, $allowTypes)){
						// Store images on the server
						if(!move_uploaded_file($_FILES['foto_cedula']['tmp_name'][$key],$targetFilePath)){
							echo "Error. No se pudo subir foto de cédula";
							exit();
						}
					}
				}

			}else {
				for ($key = 0; $key < 5; $key++) {

					$image_name = $_FILES['foto_cedula']['name'][$key];
					$tmp_name   = $_FILES['foto_cedula']['tmp_name'][$key];
					$type       = $_FILES['foto_cedula']['type'][$key];

					// File upload path
					$fileName = basename($_FILES['foto_cedula']['name'][$key]);
					// $targetFilePath = $targetDir . date("Ymd") . '--' . $fileName;
					$targetFilePath = $targetDir . date("Ymd") . '-' . $id_pedido . '-' . $fileName;

					// Check whether file type is valid
					$fileType = pathinfo($targetFilePath,PATHINFO_EXTENSION);
					if(in_array($fileType, $allowTypes)){
						// Store images on the server
						if(!move_uploaded_file($_FILES['foto_cedula']['tmp_name'][$key],$targetFilePath)){
							echo "Error. No se pudo subir foto de cédula";
							exit();
						}
					}
				}

			}



if ($saltear) {
	// sin VERIFICA EL PIN
	$db->setQuery("SELECT SQL_CALC_FOUND_ROWS pin, id_lote FROM lista_pedidos WHERE id = '$id_pedido'");
	$rows = $db->loadObject();
	if ($rows) {
		$id_lote = $rows->id_lote;

		$db->setQuery("UPDATE lista_pedidos SET estado='ENTREGADO', firma='$firma', foto_cedula='$foto_cedula1', foto_cedula2='$foto_cedula2', foto_cedula3='$foto_cedula3', foto_cedula4='$foto_cedula4', foto_cedula5='$foto_cedula5', observaciones='', fecha_entrega=now(), hora_confirmacion=now() WHERE id = '$id_pedido'");

		if(!$db->alter()){
			echo "Error. ". $db->getError();
		}else{
			echo "Entrega resistrada";
		}


	}
	}	else {
	// VERIFICA EL PIN
	$db->setQuery("SELECT SQL_CALC_FOUND_ROWS pin, id_lote FROM lista_pedidos WHERE id = '$id_pedido' AND pin = '$pin'");
	$rows = $db->loadObject();
	if ($rows) {
		$id_lote = $rows->id_lote;

		$db->setQuery("UPDATE lista_pedidos SET estado='ENTREGADO', firma='$firma', foto_cedula='$foto_cedula1', foto_cedula2='$foto_cedula2', foto_cedula3='$foto_cedula3', foto_cedula4='$foto_cedula4', foto_cedula5='$foto_cedula5', observaciones='', fecha_entrega=now(), hora_confirmacion=now() WHERE id = '$id_pedido'");

		if(!$db->alter()){
			echo "Error. ". $db->getError();
		}else{
			echo "Entrega resistrada";
		}
	}
};



				$db->setQuery("UPDATE lotes SET cantidad_actual = cantidad_actual+1 WHERE id_lote = '$id_lote'");

				if(!$db->alter()){
					//echo "Error. ". $db->getError();
				}else{
					//echo "Entrega resistrada";
				}


			//consulta si el lote fue finalizado
			$db->setQuery("SELECT SQL_CALC_FOUND_ROWS id_lote, estado FROM lista_pedidos WHERE id_lote = '$id_lote'");
			$rows = $db->loadObjectList();
			$contador=0;
			$max = sizeof($rows);

			for($i = 0; $i < $max; $i++){
				if ($rows[$i]->estado=='EN TRÁNSITO') {
					$contador=$contador+1;
				}
			}
			if ($contador==0) {
				$db->setQuery("UPDATE lotes SET estado='FINALIZADO' WHERE id_lote = '$id_lote'");

				if(!$db->alter()){
					echo "Error. ". $db->getError();
				}else{
					echo "<br>Las entregas de este lote han finalizado";
				}
			}else {
			echo "<br>Quedan entregas pendientes para este Lote";
			}


		break;



		case 'registrar_no_entregado':
			$db = DataBase::conectar();

			$id_pedido	= $db->clearText($_REQUEST['id_pedido']);
			$motivo = $db->clearText($_REQUEST['motivo']);
			$ubicacion = $db->clearText($_REQUEST['ubicacion']);
			$razon_social = $db->clearText($_REQUEST['razon_social']);
			$ruc = $db->clearText($_REQUEST['ruc']);
			$direccion = $db->clearText($_REQUEST['direccion']);
			$zona = $db->clearText($_REQUEST['zona']);
			$correo = $db->clearText($_REQUEST['correo']);
			$hora = date("H:m");

			$db->setQuery("SELECT SQL_CALC_FOUND_ROWS * FROM usuarios_finales  WHERE ruc='$ruc'");
			$rows = $db->loadObject();

			// // SI EL USUARIO FIANAL ESTA REGISTRADO ACTUALIZA SINO INSERTA
			// if ($rows) {
			// 	$db->setQuery("UPDATE usuarios_finales SET razon_social='$razon_social', direccion='$direccion', zona='$zona', correo='$correo', ubicacion_tres = (SELECT ubicacion_dos FROM usuarios_finales WHERE ruc='$ruc'), ubicacion_dos = (SELECT ubicacion_uno FROM usuarios_finales WHERE ruc='$ruc'), ubicacion_uno='$ubicacion' WHERE ruc='$ruc'");
			// } else {
			// 	$db->setQuery("INSERT INTO usuarios_finales (ruc, razon_social, direccion, zona, correo, ubicacion_uno) VALUES('$ruc', '$razon_social', '$direccion' , '$zona', '$correo','$ubicacion')");
			// }
			//
			// if (!$db->alter()) {
			// 	echo "Error. ".$db->getError();
			// 	exit();
			// }

			$db->setQuery("UPDATE lista_pedidos SET estado='NO ENTREGADO', observaciones='$motivo', fecha_entrega=now(), hora_confirmacion=now() WHERE id = '$id_pedido'");

			if(!$db->alter()){
				echo "Error. ". $db->getError();
			}else{
				echo "Pedido actualizado a NO ENTREGADO";
			}
		break;

		case 'rastrear_pedido':
			$db = DataBase::conectar();
			//$ruc =  $db->clearText($_POST['ruc']);
			$pin = $db->clearText($_POST['pin']);

			$db->setQuery("SELECT r.ubicacion_actual
											from lista_pedidos l
											left join repartidores r on l.id_repartidor=r.id_repartidor
											where l.pin='$pin'");
			$rows = $db->loadObject();

			if ($rows) {
				$ubicacion = explode(",", $rows->ubicacion_actual);

				$latitud = $ubicacion[0];
				$longitud = $ubicacion[1];
				$estatus = "Mostrando envio de $ruc<br>PIN $pin";

			} else {
				$latitud = "";
				$longitud = "";
				$estatus = "Error. El envio no esta registrado o no se encuentra en circulaión";
			}

			$salida = ["latitud"=>$latitud, "longitud"=>$longitud, "estatus"=>$estatus];
			echo json_encode($salida);
		break;


		case 'ver':
		  $db = DataBase::conectar();
			$where = "";
			//Parametros de ordenamiento, busqueda y paginacion
			$limit = $_REQUEST['limit'];
			$offset	= $_REQUEST['offset'];
			$order = $_REQUEST['order'];
			$sort = $_REQUEST['sort'];
			$id_repartidor = $_REQUEST['id_repartidor'];




			if (!isset($sort)) $sort = 2;


			if (isset($_REQUEST['search']) && !empty($_REQUEST['search'])){
				$search = $_REQUEST['search'];
				$where = "AND CONCAT_WS(' ', p.razon_social, u.ruc, lp.direccion, lp.nro_casa, lp.zona, lp.fecha_tope, c.razon_social, lp.estado, lp.pin, u.correo) LIKE '%$search%'";
			}


			if (isset($id_repartidor)){
				$db->setQuery("SELECT SQL_CALC_FOUND_ROWS lp.id as id_pedido, lp.razon_social, r.nombre as proveedor,r.id_repartidor, u.ruc, concat(d.direccion,' ', d.observacion) as direccion, d.id_direccion, lp.nro_casa, z.zona, z.id_zona, DATE_FORMAT(lp.fecha_tope, '%d/%m/%Y') AS fecha_tope,  DATE_FORMAT(lp.fecha_tope, '%d/%m/%Y') AS fecha_tope2, c.razon_social AS entidad,
				lp.estado, lp.pin, u.correo, lp.id_lote AS nro_lote, lp.cantidad_reprogramaciones, c.razon_social as entidad, l.encargado,lp.consideraciones, u.celular, lp.ubicacion as ubicacion_uno
				FROM lista_pedidos lp
				LEFT JOIN lotes l ON l.id_lote=lp.id_lote
				LEFT JOIN clientes c ON l.id_entidad=c.id_cliente
				LEFT JOIN direcciones d ON lp.direccion=d.id_direccion
				LEFT JOIN repartidores r ON r.id_repartidor=lp.id_repartidor
				LEFT JOIN usuarios_finales u ON u.razon_social=lp.razon_social

				LEFT JOIN zonas z ON lp.zona=z.id_zona
				WHERE 1=1 $where
				and r.id_repartidor=$id_repartidor
				ORDER BY $sort $order LIMIT $offset, $limit");
			}else {
				$db->setQuery("SELECT SQL_CALC_FOUND_ROWS lp.id as id_pedido, lp.razon_social, r.nombre as proveedor,r.id_repartidor, u.ruc, concat(d.direccion,' ', d.observacion) as direccion, d.id_direccion, lp.nro_casa, z.zona, z.id_zona, DATE_FORMAT(lp.fecha_tope, '%d/%m/%Y') AS fecha_tope,  DATE_FORMAT(lp.fecha_tope, '%d/%m/%Y') AS fecha_tope2, c.razon_social AS entidad,
				lp.estado, lp.pin, u.correo, lp.id_lote AS nro_lote, lp.cantidad_reprogramaciones, c.razon_social as entidad, l.encargado,lp.consideraciones, u.celular, lp.ubicacion as ubicacion_uno
				FROM lista_pedidos lp
				LEFT JOIN lotes l ON l.id_lote=lp.id_lote
				LEFT JOIN clientes c ON l.id_entidad=c.id_cliente
				LEFT JOIN direcciones d ON lp.direccion=d.id_direccion
				LEFT JOIN repartidores r ON r.id_repartidor=lp.id_repartidor
				LEFT JOIN usuarios_finales u ON u.razon_social=lp.razon_social


				LEFT JOIN zonas z ON lp.zona=z.id_zona
				WHERE 1=1 $where ORDER BY $sort $order LIMIT $offset, $limit");
			}

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

		// BUSCAR USUARIO FINAL
		case 'buscar_usuario':
			$db = DataBase::conectar();
			$ruc = $db->clearText($_POST['ruc']);

			$db->setQuery("SELECT SQL_CALC_FOUND_ROWS razon_social, correo, direccion, zona FROM usuarios_finales  WHERE ruc='$ruc'");
			$rows = $db->loadObject();

			if ($rows) {
				$razon_social = $rows->razon_social;
				$correo = $rows->correo;
				$direccion = $rows->direccion;
				$zona = $rows->zona;
			} else {
				$razon_social = "";
				$correo = "";
				$direccion = "";
				$zona = "";
			}

			$salida = ["razon_social"=>$razon_social, "correo"=>$correo, "direccion"=>$direccion, "zona"=>$zona];
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



		case 'buscar_cliente_final':
			$db = DataBase::conectar();
			$ruc_tmp = $db->clearText($_POST['ruc']);
			$razon_social_tmp = $db->clearText($_POST['razon_social']);

			if ($ruc_tmp) {
				$db->setQuery("SELECT u.ruc, u.razon_social, u.celular, u.direccion as id_direccion, u.zona, u.correo, u.ubicacion_uno, u.ubicacion_dos, u.ubicacion_tres, d.id_direccion,d.direccion, d.nro_casa, d.id_zona, d.observacion
											from usuarios_finales u
											left JOIN direcciones d on u.direccion=d.id_direccion
											where u.ruc=$ruc_tmp");
			}elseif ($razon_social_tmp) {
				$db->setQuery("SELECT u.ruc, u.razon_social, u.celular, u.direccion as id_direccion, u.zona, u.correo, u.ubicacion_uno, u.ubicacion_dos, u.ubicacion_tres, d.id_direccion,d.direccion, d.nro_casa, d.id_zona, d.observacion
											from usuarios_finales u
											left JOIN direcciones d on u.direccion=d.id_direccion
											where u.razon_social='$razon_social_tmp'");
			}




			$rows = $db->loadObject();

			if ($rows) {
				$ruc = $rows->ruc;
				$razon_social = $rows->razon_social;
				$id_direccion = $rows->id_direccion;
				$direccion = $rows->direccion;
				$nro_casa = $rows->nro_casa;
				$zona = $rows->zona;
				$correo = $rows->correo;
				$celular = $rows->celular;
				$ubicacion_uno = $rows->ubicacion_uno;
				$ubicacion_dos = $rows->ubicacion_dos;
				$ubicacion_tres = $rows->ubicacion_tres;
			} else {
				$salida = [];
				exit;
				$ruc = $ruc_tmp ;
				$razon_social = " ";
				$direccion = " ";
				$id_direccion = " ";
				$celular = " ";
				$nro_casa = " ";
				$zona = " ";
				$correo = " ";
				$ubicacion_uno =" ";
				$ubicacion_dos = " ";
				$ubicacion_tres = " ";
			}



			$salida = ["ruc"=>$ruc,"razon_social"=>$razon_social,"id_direccion"=>$id_direccion,"direccion"=>$direccion,"celular"=>$celular,"nro_casa"=>$nro_casa,"zona"=>$zona,"correo"=>$correo,"ubicacion_uno"=>$ubicacion_uno,"ubicacion_dos"=>$ubicacion_dos,"ubicacion_tres"=>$ubicacion_tres];
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
				$razon_social = strtoupper($db->clearText($_POST['razon_social']));
				$direccion = $db->clearText($_POST['direccion']);
				$nro_casa = $db->clearText($_POST['nro_casa']);
				$zona = $db->clearText($_POST['zona2']);
				$fecha_tope = fechaMYSQL($db->clearText($_POST['fecha_tope']));
				$id_lote = $db->clearText($_POST['nro_lote']);
				$entidad = $db->clearText($_POST['entidad']);
				$proveedor = $db->clearText($_POST['proveedor']);
				$correo = $db->clearText($_POST['correo']);
				$celularx = $db->clearText($_POST['celular']);
				$celular = 	str_replace(' ', '', $celularx);
				$consideraciones = $db->clearText($_POST['consideracion']);
				$ubicacion_new = $db->clearText($_POST['hidden_ubicacion_map']);
				$pin = mt_rand(100000, 999999); // pin de pedido - 6 digitos

				if ($ubicacion_new) {
					// code...
				}else {
					echo "Ingrese una posicion GPS";
					exit;
				}

				if (empty($razon_social)){
					echo "Error. Favor ingrese nombre y apellido del cliente o Razón Social";
					exit;
				}

				if (empty($fecha_tope)){
					echo "Error. Favor ingrese Fecha Tope";
					exit;
				}

				if (empty($id_lote)){

						// REGISTRA EL PEDIDO
						$db->setQuery("INSERT INTO lista_pedidos (razon_social, ruc, direccion, nro_casa, zona, fecha_tope, pin, correo, estado, entidad, id_repartidor, consideraciones,ubicacion) VALUES ('$razon_social','$ruc', '$direccion','$nro_casa','$zona', '$fecha_tope','$pin','$correo', 'PENDIENTE', '$entidad', '$proveedor', '$consideraciones', '$ubicacion_new')");



					if(!$db->alter()){
						echo "Error. ".$db->getError();
					}else{
						$cantidad_cargada++;
						$cantidad_faltante = $cantidad_total - $cantidad_cargada;
						// se envia PIN al cliente y al usuario final
						enviar_pin_usuario_final($correo, $pin, $razon_social, $fecha_tope);
						enviar_pin_cliente($ruc, $pin, $razon_social, $fecha_tope);

						if ($celular) {
							require 'gateway_namandu/api_namandu.php';
							sendSingleMessage("$celular", "Su entrega vía SARCOM Secure Mail se encuentra en camino, su PIN de entrega es ".$pin.' Para rastrear su sobre/paquete ingresar a https://frontliner.namandu.com/android/rastrear-envio.html', 2);
						}
						echo "Pedido $cantidad_cargada registrado, faltan $cantidad_faltante pedidos";
					}

				}else {

					// CANTIDAD DE PEDIDOS CARGADOS EN EL LOTE
					$db->setQuery("SELECT SQL_CALC_FOUND_ROWS COUNT(id_lote) AS cantidad FROM lista_pedidos WHERE id_lote='$id_lote'");
					$rows = $db->loadObject();
					$cantidad_cargada = $rows->cantidad;

					// CANTIDAD LIMITE DE PEDIDOS DEL LOTE
					$db->setQuery("SELECT SQL_CALC_FOUND_ROWS cantidad FROM lotes WHERE id_lote='$id_lote'");
					$rows = $db->loadObject();
					$cantidad_total = $rows->cantidad;

					if ($cantidad_cargada >= $cantidad_total) {
						echo "Error. Limite de pedidos alcanzado para este lote";
					} else {


							// REGISTRA EL PEDIDO
							$db->setQuery("INSERT INTO lista_pedidos (razon_social, ruc, direccion, nro_casa, zona, fecha_tope, id_lote, pin, correo, estado, entidad, id_repartidor, consideraciones, ubicacion) VALUES ('$razon_social','$ruc', '$direccion','$nro_casa','$zona', '$fecha_tope','$id_lote','$pin','$correo', 'PENDIENTE', '$entidad', '$proveedor', '$consideraciones', '$ubicacion_new')");


						if(!$db->alter()){
							echo "Error. ".$db->getError();
						}else{
							$cantidad_cargada++;

							$cantidad_actual = $cantidad_cargada;
							$db->setQuery("UPDATE lotes SET cantidad_actual='$cantidad_actual' WHERE id_lote='$id_lote'");


							$cantidad_faltante = $cantidad_total - $cantidad_cargada;
							// se envia PIN al cliente y al usuario final
							enviar_pin_usuario_final($correo, $pin, $razon_social, $fecha_tope);
							enviar_pin_cliente($ruc, $pin, $razon_social, $fecha_tope);

							if ($celular) {
								require 'gateway_namandu/api_namandu.php';
								sendSingleMessage("$celular", "Su entrega vía SARCOM Secure Mail se encuentra en camino, su PIN de entrega es ".$pin.' Para rastrear su sobre/paquete ingresar a https://frontliner.namandu.com/android/rastrear-envio.html', 2);
							}

							echo "Pedido $cantidad_cargada registrado, faltan $cantidad_faltante pedidos";
						}
					}
				}

				//carga de usuario final
				// revisar si existe el usuario final
				$db->setQuery("SELECT * FROM usuarios_finales WHERE ruc='$ruc' and razon_social='$razon_social'");
				$rows = $db->loadObject();
				$usuario_final = $rows->ruc;
				$usuario_final2 = $rows->razon_social;
				$ubicacion_uno = $rows->ubicacion_uno;
				$ubicacion_dos = $rows->ubicacion_dos;
				$ubicacion_tres = $rows->ubicacion_tres;


				if ($usuario_final!='') {
					//echo 'existe el usuario final';
					if ($ubicacion_dos) {
							if ($ubicacion_new!=$ubicacion_dos) {

							$db->setQuery("UPDATE usuarios_finales SET ubicacion_tres='$ubicacion_new' WHERE razon_social = '$usuario_final2'");
							if(!$db->alter()){
								//echo "Error. No se pudo registrar la direccion. Intente nuevamente. ".$db->getError();
							}else{
								//echo "Direccion registrada con éxito.".$db->getError();
							}
						}
					}else {
						if ($ubicacion_new!=$ubicacion_uno) {
							$db->setQuery("UPDATE usuarios_finales SET ubicacion_dos ='$ubicacion_new' WHERE razon_social = '$usuario_final2'");
							if(!$db->alter()){
								//echo "Error. No se pudo registrar la direccion. Intente nuevamente. ".$db->getError();
							}else{
								//echo "Direccion registrada con éxito.".$db->getError();
							}
						}

					}


				}else if ($usuario_final2!='') {
					//echo 'existe el usuario final2222';
					if ($ubicacion_dos) {
							if ($ubicacion_new!=$ubicacion_dos) {

							$db->setQuery("UPDATE usuarios_finales SET ubicacion_tres='$ubicacion_new' WHERE razon_social = '$usuario_final2'");
							if(!$db->alter()){
								//echo "Error. No se pudo registrar la direccion. Intente nuevamente. ".$db->getError();
							}else{
								//echo "Direccion registrada con éxito.".$db->getError();
							}
						}
					}else {
						if ($ubicacion_new!=$ubicacion_uno) {
							$db->setQuery("UPDATE usuarios_finales SET ubicacion_dos ='$ubicacion_new' WHERE razon_social = '$usuario_final2'");
							if(!$db->alter()){
								//echo "Error. No se pudo registrar la direccion. Intente nuevamente. ".$db->getError();
							}else{
								//echo "Direccion registrada con éxito.".$db->getError();
							}
						}

					}
				}
				else {
					//echo 'NO NO NO existe el usuario final';
					$db->setQuery("INSERT INTO usuarios_finales (ruc, razon_social, direccion,celular, zona, correo, ubicacion_uno)
					VALUES ('$ruc','$razon_social','$direccion','$celular','$zona','$correo','$ubicacion_new')");
					if(!$db->alter()){
						echo "Error. ".$db->getError();
					}else{

					}

				}











			break;

		case 'editar':

			// $db = DataBase::conectar();
			// $id_cliente = $_POST['hidden_id_cliente'];
			// $ruc = $db->clearText($_POST['ruc']);
			// $razon_social = $db->clearText($_POST['razon_social']);
			// $telefono = $db->clearText($_POST['telefono']);
			// $celular = $db->clearText($_POST['celular']);
			// $direccion = $db->clearText($_POST['direccion']);
			// $email = $db->clearText($_POST['email']);
			// // $tipo = $db->clearText($_POST['tipo']);
			// $obs = $db->clearText($_POST['obs']);

			// $db->setQuery("UPDATE clientes SET ruc='$ruc', razon_social='$razon_social', telefono='$telefono', celular='$celular', direccion='$direccion',email='$email', obs='$obs', usuario='$usuario' WHERE id_cliente = '$id_cliente'");

			// if(!$db->alter()){
			// 	echo "Error. ". $db->getError();
			// }else{
			// 	echo "Cliente '$razon_social' modificado correctamente";
            // }

      $db = DataBase::conectar();
      $id = $_POST['hidden_id_pedido'];
			$ruc = $db->clearText($_POST['ruc']);
			$razon_social = strtoupper($db->clearText($_POST['razon_social']));
      $direccion = $db->clearText($_POST['direccion']);
      $nro_casa = $db->clearText($_POST['nro_casa']);
      $zona = $db->clearText($_POST['zona2']);
			$correo = $db->clearText($_POST['correo']);
			$celular = $db->clearText($_POST['celular']);
			$id_lote = $db->clearText($_POST['nro_lote']);
			$entidad = $db->clearText($_POST['entidad']);
			$proveedor = $db->clearText($_POST['proveedor']);
			$consideracion = $db->clearText($_POST['consideracion']);
			$ubicacion_uno = $db->clearText($_POST['hidden_ubicacion_map']);



			if (empty($direccion)){
				echo "Error. Favor ingrese Direccion";
				exit;
			}

			if (empty($zona)){
				echo "Error. Favor ingrese Zona";
				exit;
			}

			$sumar_fecha = $db->clearText($_POST['sumar']);
			$fecha_tope = fechaMYSQL($db->clearText($_POST['fecha_tope']));
			$cantidad_r = $db->clearText($_POST['cantidad_r']);

			if (empty($fecha_tope)){
				echo "Error. Favor ingrese fecha";
				exit;
			}


			if (empty($id_lote)){

				if ($sumar_fecha == 'si'){
					$estado = 'REPROGRAMADO';
					$cantidad_rn = $cantidad_r + 1;

					$db->setQuery("UPDATE lista_pedidos SET id_repartidor='$proveedor',entidad='$entidad',ruc='$ruc', razon_social='$razon_social', direccion='$direccion', nro_casa='$nro_casa', zona='$zona',
						fecha_tope='$fecha_tope', correo='$correo', celular='$celular', estado='$estado', consideraciones='$consideracion', cantidad_reprogramaciones='$cantidad_rn', ubicacion='$ubicacion_uno'
					WHERE id = '$id'");
				}else {

					$db->setQuery("UPDATE lista_pedidos SET id_repartidor='$proveedor',entidad='$entidad',ruc='$ruc', razon_social='$razon_social', direccion='$direccion', nro_casa='$nro_casa', zona='$zona', fecha_tope='$fecha_tope', correo='$correo',celular='$celular', consideraciones='$consideracion' , ubicacion='$ubicacion_uno' WHERE id = '$id'");
				}

				if(!$db->alter()){
					echo "Error. ". $db->getError();
				}else{
					//echo "Pedido de '$razon_social' modificado correctamente";
				}
				//id_usuario_final, ruc, razon_social, direccion, zona, correo, celular, ubicacion_uno, ubicacion_dos, ubicacion_tres
				$db->setQuery("UPDATE usuarios_finales
											SET ruc='$ruc', razon_social='$razon_social', direccion='$direccion',  zona='$zona', correo='$correo' ,celular='$celular', ubicacion_uno='$ubicacion_uno'
											WHERE razon_social = '$razon_social'
											");

				if(!$db->alter()){
					echo "Error. ". $db->getError();
				}else{
					echo "Pedido de '$razon_social' modificado correctamente";
				}


			}else {








				if ($sumar_fecha == 'si'){
					// $fecha_actual = $fecha;
					$estado = 'REPROGRAMADO';
					$cantidad_rn = $cantidad_r + 1;

					$db->setQuery("UPDATE lista_pedidos SET  id_repartidor='$proveedor',entidad='$entidad',ruc='$ruc', razon_social='$razon_social', 	direccion='$direccion', nro_casa='$nro_casa', zona='$zona',
													fecha_tope='$fecha_tope',id_lote='$id_lote',correo='$correo', estado='$estado', cantidad_reprogramaciones='$cantidad_rn', ubicacion='$ubicacion_uno' , consideraciones='$consideracion'
													WHERE id = '$id'
												");

				}else {
					$db->setQuery("UPDATE lista_pedidos SET  id_repartidor='$proveedor',entidad='$entidad',ruc='$ruc', razon_social='$razon_social', direccion='$direccion', nro_casa='$nro_casa', zona='$zona', fecha_tope='$fecha_tope',id_lote='$id_lote',correo='$correo', ubicacion='$ubicacion_uno' , consideraciones='$consideracion'
					WHERE id = '$id'
					");
				}

				if(!$db->alter()){
					echo "Error. ". $db->getError();
				}else{
					//echo "Pedido de '$razon_social' modificado correctamente";
				}

				//id_usuario_final, ruc, razon_social, direccion, zona, correo, celular, ubicacion_uno, ubicacion_dos, ubicacion_tres
				$db->setQuery("UPDATE usuarios_finales
											SET ruc='$ruc', razon_social='$razon_social', direccion='$direccion', zona='$zona',  correo='$correo' ,celular='$celular', ubicacion_uno='$ubicacion_uno'
											WHERE razon_social = '$razon_social'
											");

				if(!$db->alter()){
					echo "Error. ". $db->getError();
				}else{
					echo "Pedido de '$razon_social' modificado correctamente";
				}







			}

		break;

        case 'eliminar':
            // $success = false;
			// $id = $_POST['id'];
			// $nombre = $_POST['nombre'];

			// $db = DataBase::conectar();
			// $db->setQuery("DELETE FROM clientes WHERE id_cliente = $id");

			// if($db->alter()){
			// 	echo "Cliente '$nombre' eliminado correctamente";
			// }else{
			// 	echo "Error al eliminar '$nombre'. ". $db->getError();
			// }

			$success = false;
			$id = $_POST['id'];
			$nombre = $_POST['nombre'];

			$db = DataBase::conectar();
			$db->setQuery("DELETE FROM lista_pedidos WHERE id = $id");

			if($db->alter()){
				echo "Pedido de '$nombre' eliminado correctamente";
			}else{
				echo "Error al eliminar el pedido de '$nombre'. ". $db->getError();
			}

		break;

		case 'buscar_lotes':
			$db = DataBase::conectar();
			$page = $db->clearText($_GET['page']);
			$term = $db->clearText($_GET['term']);
			$resultCount = 5;
			$end = ($page - 1) * $resultCount;
			$db->setQuery("SELECT SQL_CALC_FOUND_ROWS l.id_lote, l.encargado, c.razon_social
				FROM lotes l
				left join clientes c on l.id_entidad=c.id_cliente

				WHERE 1=1
				AND l.estado!='EN TRÁNSITO'
				AND l.estado!='FINALIZADO'
				AND CONCAT_WS(' ', l.id_lote, l.encargado, c.razon_social) LIKE '%$term%'
				ORDER BY l.id_lote LIMIT $end, $resultCount");
			$rows = $db->loadObjectList();

			$db->setQuery("SELECT FOUND_ROWS() as total");
			$total_row = $db->loadObject();
			$count = $total_row->total;

			if ($rows){
				foreach ($rows as $r){
					$salida[] = ['id_lote' => $r->id_lote,'razon_social' => $r->razon_social, 'encargado' => $r->encargado, 'total_count'=>$count];
				}
			}else{
				$salida[] = ['id_lote' => '', 'total_count'=> ''];
			}

			echo json_encode($salida);
		break;


		case 'buscar_repartidor':
			$db = DataBase::conectar();
			$page = $db->clearText($_GET['page']);
			$term = $db->clearText($_GET['term']);
			$resultCount = 5;
			$end = ($page - 1) * $resultCount;
			$db->setQuery("SELECT SQL_CALC_FOUND_ROWS id_repartidor, nombre
				FROM repartidores

				WHERE 1=1
				AND CONCAT_WS(' ', id_repartidor, nombre) LIKE '%$term%'
				ORDER BY id_repartidor LIMIT $end, $resultCount");
			$rows = $db->loadObjectList();

			$db->setQuery("SELECT FOUND_ROWS() as total");
			$total_row = $db->loadObject();
			$count = $total_row->total;

			if ($rows){
				foreach ($rows as $r){
					$salida[] = ['id_repartidor' => $r->id_repartidor, 'proveedor' => $r->nombre ,'total_count'=>$count];
				}
			}else{
				$salida[] = ['id_repartidor' => '', 'total_count'=> ''];
			}

			echo json_encode($salida);
		break;

		case 'reenviar_pin':
			$pin = $_REQUEST['pin'];
			$correo = $_REQUEST['correo'];
			$celular = $_REQUEST['celular'];
			$nombre = $_REQUEST['nombre'];
			$fecha_tope = $_REQUEST['fecha_tope'];
			if (enviar_pin_usuario_final($correo, $pin, $nombre, $fecha_tope)) {
				echo "PIN reenviado correctamente a $nombre";
			} else {
				echo "Error. No se pudo reenviar PIN a $nombre";
			}
			require 'gateway_namandu/api_namandu.php';
			sendSingleMessage("$celular", "Su entrega vía SARCOM Secure Mail se encuentra en camino, su PIN de entrega es ".$pin.' Para rastrear su sobre/paquete ingresar a https://frontliner.namandu.com/android/rastrear-envio.html', 2);

		break;

		case 'buscar_direccion':
			$db = DataBase::conectar();
			$page = $db->clearText($_GET['page']);
			$term = $db->clearText($_GET['term']);
			$resultCount = 5;
			$end = ($page - 1) * $resultCount;
			$db->setQuery("SELECT SQL_CALC_FOUND_ROWS * FROM direcciones WHERE direccion LIKE '%$term%' ORDER BY direccion LIMIT $end, $resultCount");
			$rows = $db->loadObjectList();

			$db->setQuery("SELECT FOUND_ROWS() as total");
			$total_row = $db->loadObject();
			$count = $total_row->total;

			if ($rows){
				foreach ($rows as $r){
					$salida[] = ['id_direccion' => $r->id_direccion, 'direccion' => $r->direccion, 'total_count'=>$count];
				}
			}else{
				$salida[] = ['id_direccion' => '', 'direccion' => '', 'total_count'=> ''];
			}

			echo json_encode($salida);
		break;

		case 'buscar_pedido':
			$db = DataBase::conectar();
			$id_pedido = $db->clearText($_REQUEST['id_pedido']);


			$db->setQuery("SELECT SQL_CALC_FOUND_ROWS l.razon_social , l.ruc, l.nro_casa, l.fecha_tope, l.correo, d.direccion, z.zona, c.razon_social as entidad, l.estado
					FROM lista_pedidos l
					left join direcciones d on d.id_direccion=l.direccion
					left join zonas z on z.id_zona=l.zona
          left join lotes lo on lo.id_lote=l.id_lote
          left join clientes c on c.id_cliente=lo.id_entidad
					WHERE l.id = $id_pedido");

			$rows = $db->loadObjectList();

			$db->setQuery("SELECT FOUND_ROWS() as total");
			$total_row = $db->loadObject();
			$count = $total_row->total;

			if ($rows){
				foreach ($rows as $r){
					//id, razon_social, ruc, direccion, nro_casa, zona, fecha_tope, id_lote, id_repartidor, estado, firma, foto_cedula, foto_cedula2, foto_cedula3, foto_cedula4, foto_cedula5, pin, correo, observaciones, cantidad_reprogramaciones, entidad, fecha_entrega, hora_confirmacion, consideraciones
					$salida[] = ['nombre' => $r->razon_social, 'ruc' => $r->ruc, 'direccion' => $r->direccion, 'nro_casa' => $r->nro_casa, 'fecha_tope' => $r->fecha_tope, 'zona' => $r->zona,
					'correo' => $r->correo, 'entidad' => $r->entidad, 'estado' => $r->estado];
				}
			}else{
				$salida[] = ['nombre' => '', 'ruc' => '', 'direccion'=> ''];
			}
			echo json_encode($salida);
		break;

		case 'buscar_zona_completar':
			$db = DataBase::conectar();
			$id = $db->clearText($_POST['id']);

			$db->setQuery("SELECT SQL_CALC_FOUND_ROWS d.nro_casa,z.id_zona, z.zona, d.direccion
										FROM direcciones d LEFT JOIN zonas z ON d.id_zona=z.id_zona WHERE d.id_direccion = '$id'");
			$rows = $db->loadObject();

			if ($rows) {
				$id_zona = $rows->id_zona;
				$zona = $rows->zona;
				$nro_casa = $rows->nro_casa;
				$direccion = $rows->direccion;
			} else {
				$id_zona = "";
				$zona = "";
				$nro_casa = "";
				$direccion = "";
			}

			$salida = ["nro_casa"=>$nro_casa,"id_zona"=>$id_zona,"zona"=>$zona,"direccion"=>$direccion];
			echo json_encode($salida);


		break;

		case 'buscar_ubicaciones':
			$db = DataBase::conectar();
			$id_producto = $db->clearText($_REQUEST['id_producto']);
			$query = "SELECT  s.id_producto, s.id_ubicacion, u.ubicacion
								FROM stock s
								JOIN ubicaciones u
								ON s.id_ubicacion=u.id_ubicacion
								WHERE s.id_producto=$id_producto";

			$db->setQuery($query);
			$rows = $db->loadObjectList();
			if (empty($rows)){
				echo json_encode(array());
			}else{
				echo json_encode($rows);
			}
		break;

		case 'buscar_zona':
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

		case 'cargar_direccion':
			$db = DataBase::conectar();
			$direccion = $db->clearText($_POST['direccion_carga']);
			$id_zona = $db->clearText($_POST['zona_carga']);
			$observacion = $db->clearText($_POST['observacion']);
			$nro_casa = $db->clearText($_POST['nro_casa_carga']);
			$db->setQuery("INSERT INTO direcciones (direccion, id_zona, observacion, nro_Casa) VALUES ('$direccion','$id_zona','$observacion','$nro_casa')");
			if (empty($direccion)){ echo json_encode(["mensaje"=>"Error. Favor cargue un producto"]);	exit; }
			if(!$db->alter()){
				//echo "Error. No se pudo registrar la direccion. Intente nuevamente. ".$db->getError();
			}else{
				//echo "Direccion registrada con éxito.".$db->getError();
			}

			$id_direccion = $db->getLastID();
			$salida[] = ['id_direccion' => $id_direccion, 'direccion' => $direccion, 'nro_casa'=>$nro_casa, 'id_zona'=>$id_zona];
			echo json_encode($salida);

		break;

		//BUSCAR entidad
		case 'buscar_entidad':

			$db = DataBase::conectar();
			$id = $db->clearText($_POST['id']);

			$db->setQuery("SELECT SQL_CALC_FOUND_ROWS c.razon_social FROM lotes l LEFT JOIN clientes c ON l.id_entidad=c.id_cliente WHERE id_lote = '$id'");
			$rows = $db->loadObject();

			if ($rows) {
				$razon_social = $rows->razon_social;
			} else {
				$razon_social = "";
			}

			$salida = ["razon_social"=>$razon_social];
			echo json_encode($salida);

		break;

		case 'buscar_fecha_tope':

			$db = DataBase::conectar();
			$id = $db->clearText($_POST['id']);

			$db->setQuery("SELECT SQL_CALC_FOUND_ROWS DATE_FORMAT(fecha_tope, '%d/%m/%Y') AS fecha_tope FROM lotes  WHERE id_lote = '$id'");
			$rows = $db->loadObject();

			if ($rows) {
				$fecha_tope = $rows->fecha_tope;
			} else {
				$fecha_tope = "";
			}

			$salida = ["fecha_tope"=>$fecha_tope];
			echo json_encode($salida);

		break;

		case 'sumar_fecha_tope':

			$db = DataBase::conectar();
			$fecha_actual = $db->clearText($_POST['fecha_topeA']);


			$fecha_tope_nuevo = date("d/m/Y",strtotime($fecha_actual."+ 5 days"));

			$salida = ["fecha_tope_nuevo"=>$fecha_tope_nuevo];
			echo json_encode($salida);

		break;


	}

	function enviar_pin_usuario_final($correo, $pin, $nombre_usuario, $fecha_tope) {
		$to = $correo;
		$subject = "SARCOM - PIN de pedido";

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
						<img style="margin: auto; height: 66px;" src="http://frontliner.namandu.com/dist/images/logo-icon.png">
					</div>
					<div style="height: auto; margin: 0; padding: 0;">
						<div style="display: flex; margin: 0; padding: 0;">
							<h1 style="text-align: center; margin: 20px auto;">PIN de pedido</h1>
						</div>
						<div style="display: flex;  margin: 0; padding: 0;">
							<h3 style="padding: 10px 100px; border-radius: 5px; margin: 20px auto; background-color: #ffffff; color: #111111;">'
								.$pin.
							'</h3>
						</div>
						<div style="margin: 30px; padding: 0;">
							<p>
								Hola ' .$nombre_usuario.':<br><br>
								Este PIN debe ser ingresado al momento de la recepción de su sobre/paquete.
								Recuérdelo o guárdelo en un lugar apropiado.<br><br><br><br>
								<b>Fecha limite de entrega:</b> '.$fecha_tope.'<br>
								<h4>Para rastrear su sobre/paquete <a href="https://frontliner.namandu.com/android/rastrear-envio.html">haga clic aquí</a></h4>

							</p>
						</div>
					</div>
				</div>
			</body>
			</html>
		';

		$headers =  "From: webmaster@example.com" . "\r\n" .
					"Content-type: text/html" . "\r\n" .
					"CC: somebodyelse@example.com";

		// retorna true o false
		return mail($to,$subject,$txt,$headers);
	}

	// function enviar_pin_sms($celular,$razon_social, $fecha_tope, $pin){
	// 		sendSingleMessage("$celular", "Sr/Sra. '$razon_social'. Tiene una entrega de parte de SARCOM Secure Mail, la cual le será entregada antes del '$fecha_tope'. Su PIN es '$pin'", 1);
	// 		try {
	// 		    // Obtenemos los datos del mensaje mediante esta funcion y le pasamos la id
	// 		    $msg = getMessageByID("12");
	// 		    print_r($msg);
	// 		    $estado_gateway = $msg['status'];
	//
	// 			if ($estado_gateway=="Sent"){
	// 				$estado_gateway = "Enviado";
	// 			}
	// 			echo $estado_gateway;
	//
	// 		} catch (Exception $e) {
	// 		    echo $e->getMessage();
	// 		}
	// 	}

	function enviar_pin_cliente($ruc, $pin, $nombre_usuario, $fecha_tope) {
		$db = DataBase::conectar();

		$db->setQuery("SELECT SQL_CALC_FOUND_ROWS c.correo FROM clientes c JOIN lotes l ON c.id_cliente=l.id_entidad JOIN lista_pedidos lp ON lp.id_lote=l.id_lote WHERE lp.pin = '$pin' AND lp.ruc='$ruc'");
		$rows = $db->loadObjectList();

		if ($rows) {
			foreach ($rows as $r){
				$correo = $r->correo;
			}

			$to = $correo;
			$subject = "SARCOM Secure Mail - PIN de pedido";

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
							<img style="margin: auto; height: 66px;" src="http://frontliner.namandu.com/dist/images/logo-icon.png">
						</div>
						<div style="height: auto; margin: 0; padding: 0;">
							<div style="display: flex; margin: 0; padding: 0;">
								<h1 style="text-align: center; margin: 20px auto; padding: 0 20px;">Nuevo pedido registrado</h1>
							</div>
							<div style="font-size: 1.2em; margin: 30px; padding: 0;">
							<p>Hola '.$nombre_usuario.'</p>
								<p>
									<b>Su PIN de Entrega es: </b> '.$pin.'<br><br>
									Este PIN es un requisito para la entrega, y deberá ser ingresado al momento de la recepción de su sobre/paquete.<br>
									Favor recuérdelo y no lo comparta.<br>
									<b>Fecha limite de entrega:</b> '.$fecha_tope.'<br><br>
									<h4>Para rastrear su sobre/paquete <a href="https://frontliner.namandu.com/android/rastrear-envio.html">haga clic aquí</a></h4>
								</p>
							</div>
						</div>
					</div>
				</body>
				</html>
			';

			$headers =  "From: webmaster@example.com" . "\r\n" .
						"Content-type: text/html" . "\r\n" .
						"CC: somebodyelse@example.com";

			// retorna true o false
			return mail($to,$subject,$txt,$headers);
		}
	}


?>
