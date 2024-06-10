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
            $where = "";
            //Parametros de ordenamiento, busqueda y paginacion
            $limit = $_REQUEST['limit'];
            $offset	= $_REQUEST['offset'];
            $order = $_REQUEST['order'];
            $sort = $_REQUEST['sort'];
            if (!isset($sort)) $sort = 2;

            $fecha_entrega = $_REQUEST['fecha'];


            if (isset($_REQUEST['search']) && !empty($_REQUEST['search'])){
                $search = $_REQUEST['search'];
                $where = "AND CONCAT_WS(' ', lp.razon_social, lp.ruc, lp.direccion, lp.zona, lp.fecha_tope, c.razon_social, lp.estado, lp.pin, lp.correo, fecha_entrega) LIKE '%$search%'";
            }

            $db->setQuery("SELECT SQL_CALC_FOUND_ROWS lp.id, lp.razon_social, lp.ruc, d.direccion, d.id_direccion, z.zona, z.id_zona, 
                        DATE_FORMAT(lp.fecha_tope, '%Y/%m/%d') AS fecha_tope,  DATE_FORMAT(lp.fecha_tope, '%Y/%m/%d') AS fecha_tope2, c.razon_social AS entidad, 
                        lp.estado, lp.pin, lp.correo, lp.id_lote AS nro_lote, lp.cantidad_reprogramaciones, lp.entidad, fecha_entrega
            FROM lista_pedidos lp 
            LEFT JOIN lotes l ON l.id_lote=lp.id_lote 
            LEFT JOIN clientes c ON l.id_entidad=c.id_cliente
            LEFT JOIN direcciones d ON lp.direccion=d.id_direccion
            LEFT JOIN zonas z ON lp.zona=z.id_zona
            WHERE 1=1 AND lp.estado='ENTREGADO' 
            -- AND lp.fecha_entrega='$fecha_entrega'
            -- AND MONTH(lp.fecha_entrega) = MONTH(CURRENT_DATE())
            AND YEAR(lp.fecha_entrega) = YEAR(CURRENT_DATE())
            $where ORDER BY $sort $order LIMIT $offset, $limit");

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


        case 'filtrar_fecha':

            $db = DataBase::conectar();
            $where = "";
            //Parametros de ordenamiento, busqueda y paginacion
            $limit = $_REQUEST['limit'];
            $offset	= $_REQUEST['offset'];
            $order = $_REQUEST['order'];
            $sort = $_REQUEST['sort'];
            if (!isset($sort)) $sort = 2;

            $fecha_1 = $_REQUEST['desde'];
            $fecha_2 = $_REQUEST['hasta'];


            if (isset($_REQUEST['search']) && !empty($_REQUEST['search'])){
                $search = $_REQUEST['search'];
                $where = "AND CONCAT_WS(' ', lp.razon_social, lp.ruc, lp.direccion, lp.zona, lp.fecha_tope, c.razon_social, lp.estado, lp.pin, lp.correo, fecha_entrega) LIKE '%$search%'";
            }

            $db->setQuery("SELECT SQL_CALC_FOUND_ROWS lp.id, lp.razon_social, lp.ruc, d.direccion, d.id_direccion, z.zona, z.id_zona, DATE_FORMAT(lp.fecha_tope, '%Y/%m/%d') AS fecha_tope,  DATE_FORMAT(lp.fecha_tope, '%Y/%m/%d') AS fecha_tope2, c.razon_social AS entidad, lp.estado, lp.pin, lp.correo, lp.id_lote AS nro_lote, lp.cantidad_reprogramaciones, lp.entidad, fecha_entrega
            FROM lista_pedidos lp 
            LEFT JOIN lotes l ON l.id_lote=lp.id_lote 
            LEFT JOIN clientes c ON l.id_entidad=c.id_cliente
            LEFT JOIN direcciones d ON lp.direccion=d.id_direccion
            LEFT JOIN zonas z ON lp.zona=z.id_zona
            WHERE 1=1 AND lp.estado='ENTREGADO' 
            AND lp.fecha_entrega  BETWEEN '$fecha_1' AND '$fecha_2'
            $where ORDER BY $sort $order LIMIT $offset, $limit");
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