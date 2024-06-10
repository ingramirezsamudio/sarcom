<?php
	header('Access-Control-Allow-Origin: *');
	header("Access-Control-Allow-Headers: Origin, X-Requested-With, cache-control, Content-Type, Accept");
	header('Access-Control-Allow-Methods: GET, POST');
	include ("funciones.php");
	$q = $_REQUEST['q'];
	$usuario = $auth->getUsername();
	$id_sucursal = datosUsuario($usuario)->id_sucursal;
	switch ($q){

        case 'ubicacion_pedidos':
            $db = DataBase::conectar();
						$id_repartidor = $_REQUEST['id_repartidor'];


            // $db->setQuery("SELECT r.id_repartidor, r.nombre, r.ubicacion_actual, lp.id, lp.razon_social
            // FROM repartidores r
            // JOIN lotes l ON r.id_repartidor=l.id_repartidor
            // JOIN lista_pedidos lp ON l.id_lote=lp.id_lote
            // WHERE lp.estado='EN TRÁNSITO'");

						$db->setQuery("SELECT p.id, p.razon_social, p.ruc, p.direccion, p.nro_casa, p.zona, p.fecha_tope, p.id_lote, p.id_repartidor,
																	p.estado, p.correo, p.observaciones, p.cantidad_reprogramaciones, p.entidad, p.consideraciones, u.direccion,
																	u.zona, p.ubicacion,r.ubicacion_actual, u.id_usuario_final
            FROM lista_pedidos p
            left join usuarios_finales u ON u.razon_social=p.razon_social
						left join repartidores r on p.id_repartidor=r.id_repartidor
            WHERE p.estado='EN TRÁNSITO'	and p.id_repartidor=$id_repartidor
						 or p.estado='REPROGRAMADO' and p.id_repartidor=$id_repartidor
            -- group by p.ruc
						");
			$rows = $db->loadObjectList();


            $row = [];
            $pedido = [];

			if ($rows) {
                $id_usuario_final = 0;
                foreach ($rows as $key => $value) {
                    if ($id_usuario_final != $value->id_usuario_final) {

                        $id_usuario_final = $value->id_usuario_final;

                        if (count($row) > 0) {
                            $row['pedidos'] = $pedidos;
                            $salida[] = $row;
                            $pedidos = [];
                            $row = [];
                        }

                        $row['id_repartidor'] = $value->ruc;
                        $row['nombre'] = $value->razon_social;

												$explodeUbicacion = explode(",", $value->ubicacion);
												$explodeUbicacion2 = explode(",", $value->ubicacion_actual);

                        $row['lat'] = $explodeUbicacion[0];
                        $row['lng'] = $explodeUbicacion[1];

												$row['lat2'] = $explodeUbicacion2[0];
												$row['lng2'] = $explodeUbicacion2[1];

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

								$row['lat2'] = '';
								$row['lng2'] = '';

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

			$db->setQuery("SELECT SQL_CALC_FOUND_ROWS l.razon_social, l.ruc, d.direccion, z.zona, DATE_FORMAT(l.fecha_tope, '%d/%m/%Y') AS fecha_tope, l.correo, l.id_lote AS nro_lote, l.cantidad_reprogramaciones, c.razon_social as entidad, u.celular, l.consideraciones as observacion, u.ubicacion_uno as ubicacion_pedido, r.ubicacion_actual as ubicacion_repartidor
											FROM lista_pedidos l
											left join direcciones d on d.id_direccion=l.direccion
											left join zonas z on z.id_zona=l.zona
											left join lotes lo on lo.id_lote=l.id_lote
											left join clientes c on c.id_cliente=lo.id_entidad
											left join usuarios_finales u on u.razon_social=l.razon_social
											left join repartidores r on r.id_repartidor=l.id_repartidor
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


				case 'navegador':
					$db = DataBase::conectar();
					$id_pedido = $db->clearText($_POST['id_pedido']);

					echo "$id_pedido";
					exit;

					$db->setQuery("SELECT	*
													FROM lista_pedidos l
													left join usuarios_finales u on u.razon_social=l.razon_social
													left join repartidores r on r.id_repartidor=l.id_repartidor
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
