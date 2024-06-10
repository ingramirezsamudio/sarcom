<?php
	include ("funciones.php");
	$q = $_REQUEST['q'];
	$usuario = $auth->getUsername();
	$id_sucursal = datosUsuario($usuario)->id_sucursal;
	switch ($q){
		
		case 'ver_lotes':
			$db = DataBase::conectar();
			$where = "";
			//Parametros de ordenamiento, busqueda y paginacion
			$limit = $_REQUEST['limit'];
			$offset	= $_REQUEST['offset'];
			$order = $_REQUEST['order'];
			if (!isset($order) && empty($order)){
				$order = "DESC";
			}
			$sort = $_REQUEST['sort'];
			if ((!isset($sort) && empty($sort)) || $sort=="fecha"){
				$sort = "DATE_FORMAT(fecha,'%Y%m%d')";
			}
			
			if (isset($_REQUEST['search']) && !empty($_REQUEST['search'])){
				$search = $_REQUEST['search'];
				$where = "AND CONCAT_WS(' ', descripcion, DATE_FORMAT(fecha,'%d/%m/%Y')) LIKE '%$search%'";
			}
			$db->setQuery("SELECT SQL_CALC_FOUND_ROWS id_lote, descripcion, FORMAT(porcentaje,2) AS porcentaje, DATE_FORMAT(fecha,'%d/%m/%Y') AS fecha, margen, usuario FROM lotes WHERE YEAR(fecha) >=2015 $where ORDER BY $sort $order");
			
			//LIMIT $offset, $limit
			$rows = $db->loadObjectList();
			
			/*$db->setQuery("SELECT FOUND_ROWS() as total");		
			$total_row = $db->loadObject();
			$total = $total_row->total;
			
			if ($rows){
				$salida = array('total' => $total, 'rows' => $rows);
			}else{
				$salida = array('total' => 0, 'rows' => array());
			}*/
			
			echo json_encode($rows);
		
		break;
		
		case 'ver_detalles':	
			$db = DataBase::conectar();
			$id_lote = $_REQUEST['id_lote'];
			$db->setQuery("SELECT l.id_lote_detalle, l.id_lote, l.descripcion, FORMAT(l.monto,0,'de_DE') AS monto, l.id_tipo_pago, t.tipo_pago, l.dolar_venta, IFNULL(l.monto_gs,0) AS monto_gs, DATE_FORMAT(l.fecha,'%d/%m/%Y %H:%i') AS fecha, l.usuario FROM lote_detalle l LEFT JOIN tipo_pagos t ON t.id_tipo_pago=l.id_tipo_pago WHERE l.id_lote=$id_lote ORDER BY l.descripcion LIKE 'MERCADER%' DESC, l.descripcion ASC");
			$rows = $db->loadObjectList();
			echo json_encode($rows);
		break;
		
		case 'ver_proveedor':
			$db = DataBase::conectar();
			$buscar = trim($db->clearText($_GET['query']));
			$db->setQuery("SELECT * FROM proveedores WHERE proveedor LIKE '%$buscar%' ORDER BY proveedor LIMIT 8");
			$rows = $db->loadObjectList();
			
			$suggestions = array();
			if ($rows){
				foreach ($rows AS $row) {
					$suggestions[] = array(
						"value" => trim($row->proveedor),
						"data" => $row->id_proveedor
					);
				}
			}
			$result = array(
				"query" => "Unit",
				"suggestions" => $suggestions
			);
			echo json_encode($result);
		break;
		
		case 'ver_tipo_pago':
			$db = DataBase::conectar();
			$db->setQuery("SELECT * FROM tipo_pagos");
			$rows = $db->loadObjectList();
			echo json_encode($rows);
		break;
		
		case 'ver_mercaderias':
			$db = DataBase::conectar();
			$id_lote = $db->clearText($_GET['id_lote']);
			$db->setQuery("SELECT m.id_lote_mercaderia, m.id_lote, m.id_proveedor, p.proveedor, m.cantidad, t.tipo_pago, m.detalle_pago, m.transporte, FORMAT(m.costo_usd,2,'de_DE') AS costo_usd, m.dolar_venta, FORMAT(m.costo_gs,0,'de_DE') AS costo_gs, FORMAT(m.promedio,2,'de_DE') AS promedio, m.obs, DATE_FORMAT(m.fecha,'%d/%m/%Y %H:%i') AS fecha, m.usuario 
							FROM lote_mercaderias m LEFT JOIN proveedores p ON m.id_proveedor=p.id_proveedor LEFT JOIN tipo_pagos t ON t.id_tipo_pago=m.id_tipo_pago WHERE m.id_lote=$id_lote ORDER BY 1 DESC");
			
			$rows = $db->loadObjectList();
			if (empty($rows)) $rows = array();
			echo json_encode($rows);
		break;
		
		case 'cargar_mercaderia':
			$db = DataBase::conectar();
			$db->autocommit(FALSE); 
			
			$id_lote = $db->clearText($_POST['id_lote']);
			$numero = $db->clearText($_POST['numero']);
			$id_proveedor = $db->clearText($_POST['proveedor']);
			$cantidad = $db->clearText($_POST['cantidad']);
			$id_tipo_pago = $db->clearText($_POST['tipo_pago_merca']);
			$detalle_pago = strtoupper($db->clearText($_POST['detalle_pago']));
			$transporte = $db->clearText($_POST['transporte']);
			$costo_usd = $db->clearText($_POST['costo_usd']);
			$dolar_venta = $db->clearText($_POST['dolar_venta_merca']);
			
			
			$obs = $db->clearText($_POST['obs']);
		
			if (empty($id_proveedor) || $id_proveedor=="0"){
				echo "Error. Favor elija un proveedor de la lista";
				exit;
			}
			if (empty($costo_usd)){
				echo "Error. Favor ingrese costo en Dólares Americanos";
				exit;
			}
			if (empty($cantidad)){
				echo "Error. Favor ingrese cantidad mayor a cero";
				exit;
			}
			
			$costo_gs = round($dolar_venta*$costo_usd,0);
			$promedio = $costo_usd/$cantidad;
			
			$db->setQuery("INSERT INTO lote_mercaderias (id_lote, id_proveedor, numero, cantidad, id_tipo_pago, detalle_pago, transporte, costo_usd, dolar_venta, costo_gs, promedio, obs, fecha, usuario) VALUES ('$id_lote', '$id_proveedor', '$numero', '$cantidad', '$id_tipo_pago', '$detalle_pago', '$transporte', '$costo_usd', '$dolar_venta', '$costo_gs', '$promedio', '$obs', NOW(), '$usuario')");
			
			if(!$db->alter()){
				echo "Error. ".$db->getError();
				$db->rollback();
				exit;
			}
			
			//VERIFICAMOS SI EL GASTO MERCADERIA ESTÁ EN lote_detalle (GASTOS)
			$db->setQuery("SELECT id_lote_detalle FROM lote_detalle WHERE descripcion LIKE 'MERCADER%' AND id_lote=$id_lote");
			$row_lote = $db->loadObject();
			
			if (empty($row_lote)){
				$db->setQuery("INSERT INTO lote_detalle (id_lote, descripcion, monto, dolar_venta, monto_gs, fecha, usuario) VALUES ('$id_lote', 'MERCADERIAS', '$costo_usd', '$dolar_venta', '$costo_gs', NOW(), '$usuario')");
			}else{
				$db->setQuery("UPDATE lote_detalle SET monto=monto+$costo_usd, dolar_venta=$dolar_venta, monto_gs=monto_gs+$costo_gs, fecha=NOW(), usuario='$usuario' WHERE id_lote=$id_lote AND descripcion='MERCADERIAS'");
			}
			
			if(!$db->alter()){
				echo "Error. ". $db->getError();
				$db->rollback();
				exit;
			}
			
			$db->commit();
			echo "Mercadería registrada correctamente";
			
		break;
		
		case 'eliminar_mercaderia':
			$db = DataBase::conectar();
			$db->autocommit(FALSE); 
			
			$id_lote_mercaderia = $db->clearText($_POST['id']);
			$id_lote = $db->clearText($_POST['id_lote']);
			$nombre = $db->clearText($_POST['nombre']);
			
			//SELECCIONAMOS EL COSTO EN lote_mercaderias
			$db->setQuery("SELECT costo_usd, costo_gs FROM lote_mercaderias WHERE id_lote_mercaderia=$id_lote_mercaderia");
			$row_costo = $db->loadObject();
			$monto = $row_costo->costo_usd;
			$monto_gs = $row_costo->costo_gs;
			
			//RESTAMOS EL COSTO EN lote_detalle
			$db->setQuery("UPDATE lote_detalle SET monto=monto-$monto, monto_gs=monto_gs-$monto_gs WHERE id_lote=$id_lote AND descripcion='MERCADERIAS'");
			if(!$db->alter()){
				echo "Error al eliminar '$nombre'. ". $db->getError();
				$db->rollback();
				exit;
			}
				
			$db->setQuery("DELETE FROM lote_mercaderias WHERE id_lote_mercaderia = $id_lote_mercaderia");

			if(!$db->alter()){
				echo "Error al eliminar '$nombre'. ". $db->getError();
				$db->rollback();
				exit;
			}
			
			$db->commit();
			echo "Proveedor '$nombre' eliminado de la lista de mercaderías con éxito.";

		break;		

		case 'cargar_lote':
			$db = DataBase::conectar();
		
			$descripcion = $db->clearText($_POST['descripcion']);
			$fecha = $db->clearText($_POST['fecha']);
			$margen = $db->clearText($_POST['margen']);
			
			if (empty($descripcion)) { echo "Error. Favor ingrese nombre del lote"; exit; }
			if (empty($margen)) { echo "Error. Favor ingrese margen"; exit; }
			if (empty($fecha)) { echo "Error. Favor ingrese fecha del lote"; exit; }
			
		
			$db->setQuery("INSERT INTO lotes (descripcion, fecha, margen, usuario) VALUES ('$descripcion','$fecha','$margen','$usuario')");
		
			if(!$db->alter()){
				echo "Error. ".$db->getError();
			}else{
				echo "Lote registrado exitosamente";
			}
			
		break;
					
		case 'editar_lote':
		
			$db = DataBase::conectar();
			$id_lote = $_POST['hidden_id_lote'];
			$descripcion = $db->clearText($_POST['descripcion']);
			$fecha = $db->clearText($_POST['fecha']);
			$margen = $db->clearText($_POST['margen']);
			
			if (empty($descripcion)) { echo "Error. Favor ingrese nombre del lote"; exit; }
			if (empty($margen)) { echo "Error. Favor ingrese margen"; exit; }
			if (empty($fecha)) { echo "Error. Favor ingrese fecha del lote"; exit; }

			$db->setQuery("UPDATE lotes SET descripcion='$descripcion', margen='$margen', fecha='$fecha', usuario='$usuario' WHERE id_lote = '$id_lote'");
	
			if(!$db->alter()){
				echo "Error. ". $db->getError();
			}else{
				echo "Lote '$descripcion' modificado correctamente";
			}

		break;
		
		case 'eliminar_lote':
			$success = false;
			$id = $_POST['id'];
			$nombre = $_POST['nombre'];
			
			$db = DataBase::conectar();
			$db->setQuery("DELETE FROM lotes WHERE id_lote = $id");

			if($db->alter()){
				echo "Lote '$nombre' eliminado correctamente";
			}else{
				echo "Error al eliminar '$nombre'. ". $db->getError();
			}
			
		break;		
		
		
		case 'cargar_gasto':
			$db = DataBase::conectar();

			$id_lote = $db->clearText($_POST['id_lote']);
			$descripcion = $db->clearText($_POST['descrip_gastos']);
			$monto = $db->clearText($_POST['monto']);
			$dolar_venta = $db->clearText($_POST['dolar_venta_gasto']);
			$id_tipo_pago = $db->clearText($_POST['tipo_pago']);
			$monto_gs = round($monto*$dolar_venta,0);
			
				
			if (empty($descripcion)) { echo "Error. Favor ingrese descripción del gasto"; exit; }
			if (empty($monto)) { echo "Error. Favor ingrese monto en dólares del gasto"; exit; }
			if (empty($id_tipo_pago)) { echo "Error. Favor ingrese tipo de pago"; exit; }
			if (empty($dolar_venta)) { echo "Error. Favor ingrese dólar venta en guaraníes"; exit; }
			
		
			$db->setQuery("INSERT INTO lote_detalle (id_lote, descripcion, monto, dolar_venta, monto_gs, id_tipo_pago, fecha, usuario) VALUES ($id_lote, '$descripcion','$monto','$dolar_venta','$monto_gs','$id_tipo_pago',NOW(), '$usuario')");
		
			if(!$db->alter()){
				echo "Error. ".$db->getError();
			}else{
				echo "Gasto registrado exitosamente";
			}
		
		
		break;

		case 'eliminar_gasto':
			$db = DataBase::conectar();

			$id_lote_detalle = $db->clearText($_POST['id_lote_detalle']);
			$db->setQuery("DELETE FROM lote_detalle WHERE id_lote_detalle = $id_lote_detalle");
		
			if(!$db->alter()){
				echo "Error. ".$db->getError();
			}else{
				echo "Gasto eliminado correctamente";
			}
		break;
		
		case 'actualizar_porcentaje':
			$db = DataBase::conectar();
			$id_lote = $db->clearText($_POST['id_lote']);
			$porcentaje = $db->clearText($_POST['porcentaje']);
			
			if (empty($id_lote)) { echo "Error. No se encontró el ID del lote. Favor recargue la página e intente nuevamente."; exit; }
			if (empty($porcentaje))  $porcentaje = 0;

			$db->setQuery("UPDATE lotes SET porcentaje='$porcentaje' WHERE id_lote=$id_lote");
	
			if(!$db->alter()){
				echo "Error. ". $db->getError();
			}
		break;

	}


?>