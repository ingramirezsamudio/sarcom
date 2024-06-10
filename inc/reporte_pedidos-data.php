<?php
	header('Access-Control-Allow-Origin: *');
	header("Access-Control-Allow-Headers: Origin, X-Requested-With, cache-control, Content-Type, Accept");
	header('Access-Control-Allow-Methods: GET, POST');
	include ("funciones.php");
	$q = $_REQUEST['q'];
	$usuario = $auth->getUsername();
	$id_sucursal = datosUsuario($usuario)->id_sucursal;
	switch ($q) {

        case 'ver':

            $db = DataBase::conectar();
            $desde = $_REQUEST['desde'];
            $hasta = $_REQUEST['hasta'];
						$id_cliente = $_REQUEST['id_cliente'];
						$id_clientex = $_REQUEST['id_clientex'];
						$id_repartidor = $_REQUEST['id_repartidor'];
            $ruc_usuario = $_REQUEST['ruc_usuario'];
            $where = "";
            $mostrar = "AND lp.fecha_entrega  BETWEEN '$desde' AND '$hasta'";


            if ($id_cliente != 'null') {
                $mostrar .= " AND l.id_entidad = '$id_cliente'";
            }

            if ($id_repartidor != 'null') {
                $mostrar .= " AND lp.id_repartidor = '$id_repartidor'";
            }

            if ($ruc_usuario != 'null') {
                $mostrar .= " AND u.id_usuario_final = '$ruc_usuario'";
            }
            // print_r($mostrar);
            // exit;


            //Parametros de ordenamiento, busqueda y paginacion
            $limit = $_REQUEST['limit'];
            $offset	= $_REQUEST['offset'];
            $order = $_REQUEST['order'];
            $sort = $_REQUEST['sort'];
            if (!isset($sort)) $sort = 2;

            if (isset($_REQUEST['search']) && !empty($_REQUEST['search'])){
                $search = $_REQUEST['search'];
                $where = " AND CONCAT_WS(' ', lp.razon_social, lp.ruc, lp.direccion, lp.zona, lp.fecha_tope, c.razon_social, lp.estado, lp.pin, lp.correo,  DATE_FORMAT(lp.fecha_entrega, '%d/%m/%Y') AS fecha_entrega) LIKE '%$search%'";
            }




						if ($id_clientex!='null') {
							$db->setQuery("SELECT SQL_CALC_FOUND_ROWS lp.id, lp.razon_social, lp.ruc, d.direccion, d.id_direccion, z.zona, z.id_zona,
							DATE_FORMAT(lp.fecha_tope, '%Y/%m/%d') AS fecha_tope,
							DATE_FORMAT(lp.fecha_tope, '%Y/%m/%d') AS fecha_tope2, c.razon_social AS entidad, lp.estado, lp.pin, lp.correo,
							lp.id_lote AS nro_lote, lp.cantidad_reprogramaciones, DATE_FORMAT(lp.fecha_entrega, '%d/%m/%Y') AS fecha_entrega, lp.hora_confirmacion, lp.observaciones, lp.ubicacion
							FROM lista_pedidos lp
							LEFT JOIN lotes l ON l.id_lote=lp.id_lote
							LEFT JOIN clientes c ON l.id_entidad=c.id_cliente
							LEFT JOIN direcciones d ON lp.direccion=d.id_direccion
							LEFT JOIN zonas z ON lp.zona=z.id_zona
							left join usuarios_finales u on u.razon_social=lp.razon_social
							WHERE 1=1 AND lp.estado='ENTREGADO'
							and c.id_cliente=$id_clientex
							$mostrar
							$where ORDER BY $sort $order LIMIT $offset, $limit");


						}else {


							$db->setQuery("SELECT SQL_CALC_FOUND_ROWS lp.id, lp.razon_social, lp.ruc, d.direccion, d.id_direccion, z.zona, z.id_zona,
							DATE_FORMAT(lp.fecha_tope, '%Y/%m/%d') AS fecha_tope,
							DATE_FORMAT(lp.fecha_tope, '%Y/%m/%d') AS fecha_tope2, c.razon_social AS entidad, lp.estado, lp.pin, lp.correo,
							lp.id_lote AS nro_lote, lp.cantidad_reprogramaciones, DATE_FORMAT(lp.fecha_entrega, '%d/%m/%Y') AS fecha_entrega, lp.hora_confirmacion, lp.observaciones, lp.ubicacion
							FROM lista_pedidos lp
							LEFT JOIN lotes l ON l.id_lote=lp.id_lote
							LEFT JOIN clientes c ON l.id_entidad=c.id_cliente
							LEFT JOIN direcciones d ON lp.direccion=d.id_direccion
							LEFT JOIN zonas z ON lp.zona=z.id_zona
							left join usuarios_finales u on u.razon_social=lp.razon_social
							WHERE 1=1 AND lp.estado='ENTREGADO'
							$mostrar
							$where ORDER BY $sort $order LIMIT $offset, $limit");
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

        case 'buscar_cliente':
			$db = DataBase::conectar();
			$page = $db->clearText($_GET['page']);
			$term = $db->clearText($_GET['term']);
			$resultCount = 5;
			$end = ($page - 1) * $resultCount;
			$db->setQuery("SELECT SQL_CALC_FOUND_ROWS * FROM clientes WHERE razon_social LIKE '%$term%' ORDER BY razon_social LIMIT $end, $resultCount");
			$rows = $db->loadObjectList();

			$db->setQuery("SELECT FOUND_ROWS() as total");
			$total_row = $db->loadObject();
			$count = $total_row->total;

			if ($rows){
				foreach ($rows as $r){
					$salida[] = ['id_cliente' => $r->id_cliente, 'razon_social' => $r->razon_social, 'total_count'=>$count];
				}
			}else{
				$salida[] = ['id_cliente' => '', 'cliente' => '', 'total_count'=>''];
			}

			echo json_encode($salida);
        break;

        case 'buscar_usuario_final':
			$db = DataBase::conectar();
			$page = $db->clearText($_GET['page']);
			$term = $db->clearText($_GET['term']);
			$resultCount = 5;
			$end = ($page - 1) * $resultCount;
			$db->setQuery("SELECT SQL_CALC_FOUND_ROWS * FROM usuarios_finales WHERE razon_social LIKE '%$term%' ORDER BY razon_social LIMIT $end, $resultCount");
			$rows = $db->loadObjectList();

			$db->setQuery("SELECT FOUND_ROWS() as total");
			$total_row = $db->loadObject();
			$count = $total_row->total;

			if ($rows){
				foreach ($rows as $r){
					$salida[] = ['id_usuario_final' => $r->id_usuario_final,'ruc' => $r->ruc, 'razon_social' => $r->razon_social, 'total_count'=>$count];
				}
			}else{
				$salida[] = ['id_usuario_final' => '', 'ruc' => '', 'razon_social' => '', 'total_count'=>''];
			}

			echo json_encode($salida);
        break;

        case 'buscar_repartidor':
			$db = DataBase::conectar();
			$page = $db->clearText($_GET['page']);
			$term = $db->clearText($_GET['term']);
			$resultCount = 5;
			$end = ($page - 1) * $resultCount;
			$db->setQuery("SELECT SQL_CALC_FOUND_ROWS * FROM repartidores WHERE nombre LIKE '%$term%' ORDER BY nombre LIMIT $end, $resultCount");
			$rows = $db->loadObjectList();

			$db->setQuery("SELECT FOUND_ROWS() as total");
			$total_row = $db->loadObject();
			$count = $total_row->total;

			if ($rows){
				foreach ($rows as $r){
					$salida[] = ['id_repartidor' => $r->id_repartidor, 'nombre' => $r->nombre, 'total_count'=>$count];
				}
			}else{
				$salida[] = ['id_repartidor' => '', 'nombre' => '', 'total_count'=>''];
			}

			echo json_encode($salida);
        break;



        // case 'filtrar_por_cliente':
		// 	$db = DataBase::conectar();
        //     $where = "";
        //     //Parametros de ordenamiento, busqueda y paginacion
        //     $limit = $_REQUEST['limit'];
        //     $offset	= $_REQUEST['offset'];
        //     $order = $_REQUEST['order'];
        //     $sort = $_REQUEST['sort'];
        //     if (!isset($sort)) $sort = 2;

        //     $id_cliente = $_REQUEST['id_cliente'];
        //     $fecha_1 = $_REQUEST['desde'];
        //     $fecha_2 = $_REQUEST['hasta'];


        //     if (isset($_REQUEST['search']) && !empty($_REQUEST['search'])){
        //         $search = $_REQUEST['search'];
        //         $where = "AND CONCAT_WS(' ', lp.razon_social, lp.ruc, lp.direccion, lp.zona, lp.fecha_tope, c.razon_social, lp.estado, lp.pin, lp.correo, id_cliente) LIKE '%$search%'";
        //     }

        //     $db->setQuery("SELECT SQL_CALC_FOUND_ROWS lp.id, lp.razon_social, lp.ruc, d.direccion, d.id_direccion, z.zona, z.id_zona, DATE_FORMAT(lp.fecha_tope, '%Y/%m/%d') AS fecha_tope,  DATE_FORMAT(lp.fecha_tope, '%Y/%m/%d') AS fecha_tope2, c.razon_social AS entidad, lp.estado, lp.pin, lp.correo, lp.id_lote AS nro_lote, lp.cantidad_reprogramaciones, lp.entidad, fecha_entrega
        //     FROM lista_pedidos lp
        //     LEFT JOIN lotes l ON l.id_lote=lp.id_lote
        //     LEFT JOIN clientes c ON l.id_entidad=c.id_cliente
        //     LEFT JOIN direcciones d ON lp.direccion=d.id_direccion
        //     LEFT JOIN zonas z ON lp.zona=z.id_zona
        //     WHERE 1=1 AND lp.estado='ENTREGADO'
        //     AND l.id_entidad = '$id_cliente'
        //     AND lp.fecha_entrega  BETWEEN '$fecha_1' AND '$fecha_2'
        //     $where ORDER BY $sort $order LIMIT $offset, $limit");

        //     $rows = $db->loadObjectList();

        //     $db->setQuery("SELECT FOUND_ROWS() as total");
        //     $total_row = $db->loadObject();
        //     $total = $total_row->total;

        //     if ($rows){
        //         $salida = array('total' => $total, 'rows' => $rows);
        //     }else{
        //         $salida = array('total' => 0, 'rows' => array());
        //     }

        //     echo json_encode($salida);
        // break;

        // case 'filtrar_por_repartidor':
		// 	$db = DataBase::conectar();
        //     $where = "";
        //     //Parametros de ordenamiento, busqueda y paginacion
        //     $limit = $_REQUEST['limit'];
        //     $offset	= $_REQUEST['offset'];
        //     $order = $_REQUEST['order'];
        //     $sort = $_REQUEST['sort'];
        //     if (!isset($sort)) $sort = 2;

        //     $id_repartidor = $_REQUEST['id_repartidor'];
        //     $fecha_1 = $_REQUEST['desde'];
        //     $fecha_2 = $_REQUEST['hasta'];


        //     if (isset($_REQUEST['search']) && !empty($_REQUEST['search'])){
        //         $search = $_REQUEST['search'];
        //         $where = "AND CONCAT_WS(' ', lp.razon_social, lp.ruc, lp.direccion, lp.zona, lp.fecha_tope, c.razon_social, lp.estado, lp.pin, lp.correo, id_cliente) LIKE '%$search%'";
        //     }

        //     $db->setQuery("SELECT SQL_CALC_FOUND_ROWS lp.id, lp.razon_social, lp.ruc, d.direccion, d.id_direccion, z.zona, z.id_zona, DATE_FORMAT(lp.fecha_tope, '%Y/%m/%d') AS fecha_tope,  DATE_FORMAT(lp.fecha_tope, '%Y/%m/%d') AS fecha_tope2, c.razon_social AS entidad, lp.estado, lp.pin, lp.correo, lp.id_lote AS nro_lote, lp.cantidad_reprogramaciones, lp.entidad, fecha_entrega
        //     FROM lista_pedidos lp
        //     LEFT JOIN lotes l ON l.id_lote=lp.id_lote
        //     LEFT JOIN clientes c ON l.id_entidad=c.id_cliente
        //     LEFT JOIN direcciones d ON lp.direccion=d.id_direccion
        //     LEFT JOIN zonas z ON lp.zona=z.id_zona
        //     WHERE 1=1 AND lp.estado='ENTREGADO'
        //     AND l.id_repartidor = '$id_repartidor'
        //     AND lp.fecha_entrega  BETWEEN '$fecha_1' AND '$fecha_2'
        //     $where ORDER BY $sort $order LIMIT $offset, $limit");

        //     $rows = $db->loadObjectList();

        //     $db->setQuery("SELECT FOUND_ROWS() as total");
        //     $total_row = $db->loadObject();
        //     $total = $total_row->total;

        //     if ($rows){
        //         $salida = array('total' => $total, 'rows' => $rows);
        //     }else{
        //         $salida = array('total' => 0, 'rows' => array());
        //     }

        //     echo json_encode($salida);
        // break;

        // case 'filtrar_por_usuario_final':
		// 	$db = DataBase::conectar();
        //     $where = "";
        //     //Parametros de ordenamiento, busqueda y paginacion
        //     $limit = $_REQUEST['limit'];
        //     $offset	= $_REQUEST['offset'];
        //     $order = $_REQUEST['order'];
        //     $sort = $_REQUEST['sort'];
        //     if (!isset($sort)) $sort = 2;

        //     $ruc_usuario_final = $_REQUEST['ruc_usuario_final'];
        //     $fecha_1 = $_REQUEST['desde'];
        //     $fecha_2 = $_REQUEST['hasta'];


        //     if (isset($_REQUEST['search']) && !empty($_REQUEST['search'])){
        //         $search = $_REQUEST['search'];
        //         $where = "AND CONCAT_WS(' ', lp.razon_social, lp.ruc, lp.direccion, lp.zona, lp.fecha_tope, c.razon_social, lp.estado, lp.pin, lp.correo, id_cliente) LIKE '%$search%'";
        //     }

        //     $db->setQuery("SELECT SQL_CALC_FOUND_ROWS lp.id, lp.razon_social, lp.ruc, d.direccion, d.id_direccion, z.zona, z.id_zona, DATE_FORMAT(lp.fecha_tope, '%Y/%m/%d') AS fecha_tope,  DATE_FORMAT(lp.fecha_tope, '%Y/%m/%d') AS fecha_tope2, c.razon_social AS entidad, lp.estado, lp.pin, lp.correo, lp.id_lote AS nro_lote, lp.cantidad_reprogramaciones, lp.entidad, fecha_entrega
        //     FROM lista_pedidos lp
        //     LEFT JOIN lotes l ON l.id_lote=lp.id_lote
        //     LEFT JOIN clientes c ON l.id_entidad=c.id_cliente
        //     LEFT JOIN direcciones d ON lp.direccion=d.id_direccion
        //     LEFT JOIN zonas z ON lp.zona=z.id_zona
        //     WHERE 1=1 AND lp.estado='ENTREGADO'
        //     AND lp.ruc = '$ruc_usuario_final'
        //     AND lp.fecha_entrega  BETWEEN '$fecha_1' AND '$fecha_2'
        //     $where ORDER BY $sort $order LIMIT $offset, $limit");

        //     $rows = $db->loadObjectList();

        //     $db->setQuery("SELECT FOUND_ROWS() as total");
        //     $total_row = $db->loadObject();
        //     $total = $total_row->total;

        //     if ($rows){
        //         $salida = array('total' => $total, 'rows' => $rows);
        //     }else{
        //         $salida = array('total' => 0, 'rows' => array());
        //     }

        //     echo json_encode($salida);
        // break;

        // case 'filtrar_fecha':
		// 	$db = DataBase::conectar();
        //     $where = "";
        //     //Parametros de ordenamiento, busqueda y paginacion
        //     $limit = $_REQUEST['limit'];
        //     $offset	= $_REQUEST['offset'];
        //     $order = $_REQUEST['order'];
        //     $sort = $_REQUEST['sort'];
        //     if (!isset($sort)) $sort = 2;

        //     $ruc_usuario_final = $_REQUEST['ruc_usuario_final'];
        //     $fecha_1 = $_REQUEST['desde'];
        //     $fecha_2 = $_REQUEST['hasta'];


        //     if (isset($_REQUEST['search']) && !empty($_REQUEST['search'])){
        //         $search = $_REQUEST['search'];
        //         $where = "AND CONCAT_WS(' ', lp.razon_social, lp.ruc, lp.direccion, lp.zona, lp.fecha_tope, c.razon_social, lp.estado, lp.pin, lp.correo, id_cliente) LIKE '%$search%'";
        //     }

        //     $db->setQuery("SELECT SQL_CALC_FOUND_ROWS lp.id, lp.razon_social, lp.ruc, d.direccion, d.id_direccion, z.zona, z.id_zona, DATE_FORMAT(lp.fecha_tope, '%Y/%m/%d') AS fecha_tope,  DATE_FORMAT(lp.fecha_tope, '%Y/%m/%d') AS fecha_tope2, c.razon_social AS entidad, lp.estado, lp.pin, lp.correo, lp.id_lote AS nro_lote, lp.cantidad_reprogramaciones, lp.entidad, fecha_entrega
        //     FROM lista_pedidos lp
        //     LEFT JOIN lotes l ON l.id_lote=lp.id_lote
        //     LEFT JOIN clientes c ON l.id_entidad=c.id_cliente
        //     LEFT JOIN direcciones d ON lp.direccion=d.id_direccion
        //     LEFT JOIN zonas z ON lp.zona=z.id_zona
        //     WHERE 1=1 AND lp.estado='ENTREGADO'
        //     AND lp.fecha_entrega  BETWEEN '$fecha_1' AND '$fecha_2'
        //     $where ORDER BY $sort $order LIMIT $offset, $limit");

        //     $rows = $db->loadObjectList();

        //     $db->setQuery("SELECT FOUND_ROWS() as total");
        //     $total_row = $db->loadObject();
        //     $total = $total_row->total;

        //     if ($rows){
        //         $salida = array('total' => $total, 'rows' => $rows);
        //     }else{
        //         $salida = array('total' => 0, 'rows' => array());
        //     }

        //     echo json_encode($salida);
		// break;

    }

?>
