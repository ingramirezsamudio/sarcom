<?php
	include ("funciones.php");
	$q = $_REQUEST['q'];
	$usuario = $auth->getUsername();
	//$id_sucursal = datosUsuario($usuario)->id_sucursal;
	switch ($q){
		
		case 'ver':
			$db = DataBase::conectar();
			$where = "";
			if (isset($_REQUEST['search']) && !empty($_REQUEST['search'])){
				$search = $_REQUEST['search'];
				$where = "AND CONCAT_WS(' ',s.nombre_empresa,s.sucursal,m.monto_gs,m.mes,m.ano) LIKE '%$search%'";
			}
			$db->setQuery("SET lc_time_names = 'es_ES'");
			$db->alter();
			$db->setQuery("SELECT m.id_meta, m.id_sucursal, CONCAT_WS(' - ',s.nombre_empresa,s.sucursal) AS sucursal, m.mes, m.ano, CONCAT_WS(' ',UPPER(MONTHNAME(STR_TO_DATE(m.mes, '%m'))),m.ano) AS mes_ano, FORMAT(m.meta_gs,0,'de_DE') AS meta_gs, FORMAT(m.monto_alcanzado,0,'de_DE') AS monto_alcanzado, CONCAT(m.porcentaje_alcanzado,'%') AS porcentaje_alcanzado, DATE_FORMAT(m.fecha_carga,'%d/%m/%Y %H:%i') AS fecha_carga, m.usuario FROM metas m INNER JOIN sucursales s ON s.id_sucursal=m.id_sucursal WHERE 1=1 $where ORDER BY CONCAT(m.ano,m.mes) DESC, m.id_sucursal ASC");
			$rows = $db->loadObjectList();

			echo json_encode($rows);
		
		break;
		
		case 'actualizar':
			$db = DataBase::conectar();
			$id_meta = $_POST['id_meta'];
			$mes = $_POST['mes'];
			$ano = $_POST['ano'];
			$id_sucursal = $_POST['id_sucursal'];
			$db->setQuery("UPDATE metas SET monto_alcanzado=(SELECT SUM(total_a_pagar-IFNULL(nota_credito_gs,0)) AS total_ventas FROM facturas WHERE MONTH(fecha)='$mes' AND YEAR(fecha)='$ano' AND id_sucursal=$id_sucursal AND estado!='Anulada'), porcentaje_alcanzado=ROUND((SELECT SUM(total_a_pagar-IFNULL(nota_credito_gs,0)) AS total_ventas FROM facturas WHERE MONTH(fecha)='$mes' AND YEAR(fecha)='$ano' AND id_sucursal=$id_sucursal AND estado!='Anulada')/meta_gs*100,2) WHERE id_meta=$id_meta");
			
			if(!$db->alter()){
				echo "Error al actualizar los montos. ".$db->getError();
			}else{
				echo "Montos actualizados correctamente";
			}
		break;

		case 'cargar':
			$db = DataBase::conectar();
			$sucursal = $db->clearText($_POST['sucursal']);
			$mes = $db->clearText($_POST['mes']);
			$ano = $db->clearText($_POST['ano']);
			$monto_gs = $db->clearText($_POST['monto_gs']);
			
			if (empty($sucursal)){ echo "Error. Favor ingrese sucursal"; exit; }
			if (empty($mes)){ echo "Error. Favor ingrese mes"; exit; }
			if (empty($ano)){ echo "Error. Favor ingrese año"; exit; }
			if (empty($monto_gs)){ echo "Error. Favor ingrese monto a alcanzar en guaraníes"; exit; }
			
		
			$meta_gs = quitaSeparadorMiles($monto_gs);
			
			$db->setQuery("INSERT INTO metas (id_sucursal, mes, ano, meta_gs, fecha_carga, usuario) VALUES ($sucursal,'$mes','$ano','$meta_gs',NOW(),'$usuario')");
		
			if(!$db->alter()){
				echo "Error al cargar la meta. ".$db->getError();
			}else{
				echo "Meta registrada correctamente";
			}
			
		break;
					
		case 'editar':
		
			$db = DataBase::conectar();
			$id_meta = $_POST['hidden_id'];

			$sucursal = $db->clearText($_POST['sucursal']);
			$mes = $db->clearText($_POST['mes']);
			$ano = $db->clearText($_POST['ano']);
			$monto_gs = $db->clearText($_POST['monto_gs']);
			
			if (empty($sucursal)){ echo "Error. Favor ingrese sucursal"; exit; }
			if (empty($mes)){ echo "Error. Favor ingrese mes"; exit; }
			if (empty($ano)){ echo "Error. Favor ingrese año"; exit; }
			if (empty($monto_gs)){ echo "Error. Favor ingrese monto a alcanzar en guaraníes"; exit; }
			
		
			$meta_gs = quitaSeparadorMiles($monto_gs);
			
			$db->setQuery("UPDATE metas SET mes='$mes', ano='$ano', meta_gs='$meta_gs', id_sucursal='$sucursal' WHERE id_meta=$id_meta");
		
			if(!$db->alter()){
				echo "Error al actualizar la meta. ".$db->getError();
			}else{
				echo "Meta editada correctamente";
			}

		break;
		
		case 'ver_ventas':
			$db = DataBase::conectar();
			$id_meta = $db->clearText($_GET['id_meta']);
			$db->setQuery("SELECT id_meta_vendedora, id_meta, id_vendedora, vendedora, FORMAT(monto_ventas,0,'de_DE') AS monto_ventas, CONCAT(porcentaje_alcanzado,'%') AS porcentaje_alcanzado, CONCAT(porcentaje_comision,'%') AS porcentaje_comision, FORMAT(monto_comision,0,'de_DE') AS monto_comision, DATE_FORMAT(actualizado_el,'%d/%m/%Y %H:%i') AS actualizado_el FROM metas_vendedoras WHERE id_meta=$id_meta");
			$rows = $db->loadObjectList();

			echo json_encode($rows);
		break;
		
		case 'actualizar_ventas':
			$db = DataBase::conectar();
			$id_meta = $db->clearText($_POST['id_meta']);
			$id_sucursal = $db->clearText($_POST['id_sucursal']);
			$mes = $db->clearText($_POST['mes']);
			$ano = $db->clearText($_POST['ano']);
			$meta_gs = quitaSeparadorMiles($db->clearText($_POST['meta_gs']));
			$total_ventas=0;
			
			//CONSULTAMOS VENDEDORAS ACTIVAS
			$db->setQuery("SELECT id FROM users WHERE status=0 AND roles_mask=2 AND id_sucursal=$id_sucursal AND username!='vendedor'");
			$rows_vendedoras = $db->loadObjectList();
			
			foreach($rows_vendedoras as $rv){
				//OBTENEMOS SUS VENTAS
				$id_vendedora = $rv->id;
				$db->setQuery("SELECT u.nombre_apellido, ROUND(SUM(f.total_a_pagar-IFNULL(f.nota_credito_gs,0)),0) AS total_ventas FROM facturas f 
								INNER JOIN users u ON u.id=f.id_vendedora WHERE MONTH(f.fecha)='$mes' AND YEAR(f.fecha)='$ano' AND f.id_sucursal=$id_sucursal AND f.estado!='Anulada' 
								AND f.id_vendedora=$id_vendedora");
				$row_ventas = $db->loadObject();
				
				$vendedora = $row_ventas->nombre_apellido;
				$monto_ventas = $row_ventas->total_ventas;
				$porcentaje_alcanzado = ROUND(($monto_ventas / $meta_gs * 100), 2); //INDIVIDUAL SOBRE LA META
				
				$total_ventas += $monto_ventas;
				
				$db->setQuery("INSERT INTO metas_vendedoras (id_meta,id_vendedora,vendedora,monto_ventas,porcentaje_alcanzado) VALUES($id_meta,$id_vendedora,'$vendedora','$monto_ventas','$porcentaje_alcanzado') ON DUPLICATE KEY UPDATE monto_ventas='$monto_ventas',porcentaje_alcanzado='$porcentaje_alcanzado'");
				if(!$db->alter()){
					echo "Error al actualizar los datos de ventas. ".$db->getError();
					exit;
				}
			}
			
			//SACAMOS COMISION SEGUN ESCALAS DE COMISIONES
			$total_porcentaje = ROUND(($total_ventas / $meta_gs * 100), 2);
		
			$db->setQuery("SELECT porcentaje_comision FROM metas_comisiones WHERE $total_porcentaje>=porcentaje_desde AND $total_porcentaje<=porcentaje_hasta");
			$r_com = $db->loadObject();
			$porcentaje_comision =  $r_com->porcentaje_comision;
			
			if (empty($porcentaje_comision)){
				$porcentaje_comision=0;
			}
			
			//$monto_comision = $total_ventas * $porcentaje_comision / 100;
			
			//ACTUALIZAMOS COMISIONES EN VENDEDORAS
			$db->setQuery("UPDATE metas_vendedoras SET porcentaje_comision='$porcentaje_comision', monto_comision=ROUND((IFNULL(monto_ventas,0)*$porcentaje_comision/100),0), actualizado_el=NOW() WHERE id_meta=$id_meta");
		
			if(!$db->alter()){
				echo "Error al actualizar las comisiones. ".$db->getError();
			}else{
				echo "Ventas y comisiones actualizadas correctamente";
			}

		break;
		
		case 'eliminar':
			$success = false;
			$id = $_POST['id'];
			$nombre = $_POST['nombre'];
			
			$db = DataBase::conectar();
			$db->setQuery("DELETE FROM metas WHERE id_meta = $id");

			if($db->alter()){
				echo "Meta '$nombre' eliminada correctamente";
			}else{
				echo "Error al eliminar '$nombre'. ". $db->getError();
			}
			
		break;		

	}


?>