<?php
	header('Access-Control-Allow-Origin: *');
	header("Access-Control-Allow-Headers: Origin, X-Requested-With, cache-control, Content-Type, Accept");
	header('Access-Control-Allow-Methods: GET, POST');
	include ("funciones.php");
	$q = $_REQUEST['q'];
	$usuario = $auth->getUsername();
	$id_sucursal = datosUsuario($usuario)->id_sucursal;
	switch ($q){

        case 'ubicacion_repartidores':
            $db = DataBase::conectar();

            // $db->setQuery("SELECT r.id_repartidor, r.nombre, r.ubicacion_actual, lp.id, lp.razon_social
            // FROM repartidores r
            // JOIN lotes l ON r.id_repartidor=l.id_repartidor
            // JOIN lista_pedidos lp ON l.id_lote=lp.id_lote
            // WHERE lp.estado='EN TRÁNSITO'");

						$db->setQuery("SELECT 		r.id_repartidor, r.nombre, r.ubicacion_actual, p.id, p.razon_social
            FROM lista_pedidos p
            left join repartidores r on r.id_repartidor=p.id_repartidor
            WHERE p.estado='EN TRÁNSITO' or p.estado='REPROGRAMADO'");
			$rows = $db->loadObjectList();

            $row = [];
            $pedido = [];

			if ($rows) {
                $id_repartidor = 0;
                foreach ($rows as $key => $value) {
                    if ($id_repartidor != $value->id_repartidor) {

                        $id_repartidor = $value->id_repartidor;

                        if (count($row) > 0) {
                            $row['pedidos'] = $pedidos;
                            $salida[] = $row;
                            $pedidos = [];
                            $row = [];
                        }

                        $row['id_repartidor'] = $value->id_repartidor;
                        $row['nombre'] = $value->nombre;

                        $explodeUbicacion = explode(",", $value->ubicacion_actual);

                        $row['lat'] = $explodeUbicacion[0];
                        $row['lng'] = $explodeUbicacion[1];

                        $pedido['id_pedido'] = $value->id;
                        $pedido['razon_social'] = $value->razon_social;
                        $pedidos[] = $pedido;

                    } else {
                        $pedido['id_pedido'] = $value->id;
                        $pedido['razon_social'] = $value->razon_social;
                        $pedidos[] = $pedido;
                    }
                }

                if (count($row) > 0) {
                    $row['pedidos'] = $pedidos;
                    $salida[] = $row;
                }

			} else {
                $row['id_repartidor'] = '';
                $row['nombre'] = '';

                $row['lat'] = '';
                $row['lng'] = '';

                $pedidos = [];

                $pedido['id_pedido'] = '';
                $pedido['razon_social'] = '';

                $row['pedidos'] = $pedidos;

				$salida[] = $row;
            }

            echo json_encode($salida);
        break;

        case 'info_envio':
            $db = DataBase::conectar();

            $id_pedido = $db->clearText($_POST['id_pedido']);

			$db->setQuery("SELECT SQL_CALC_FOUND_ROWS l.razon_social, l.ruc, d.direccion, z.zona, DATE_FORMAT(l.fecha_tope, '%d/%m/%Y') AS fecha_tope, l.correo, l.id_lote AS nro_lote, l.cantidad_reprogramaciones, c.razon_social as entidad
											FROM lista_pedidos l
											left join direcciones d on d.id_direccion=l.direccion
											left join zonas z on z.id_zona=l.zona
											left join lotes lo on lo.id_lote=l.id_lote
											left join clientes c on c.id_cliente=lo.id_entidad
											WHERE l.id='$id_pedido'
										");
			$rows = $db->loadObject();

			if ($rows){
				$salida = $rows;
			}else{
				$salida = [];
            }

			echo json_encode($salida);
        break;

    }
?>
