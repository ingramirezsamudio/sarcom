<?php
header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Headers: Origin, X-Requested-With, cache-control, Content-Type, Accept");
header('Access-Control-Allow-Methods: GET, POST');
	include ("funciones.php");
	$q = $_REQUEST['q'];
	switch ($q){

		case 'grafico_cupos':
			$db = DataBase::conectar();

			$db->setQuery("SELECT c.id_cupo, c.fecha, c.fecha_fin, c.cantidad as cantidad_cupo, c.estado as estado_cupo,
										cli.id_cliente, cli.razon_social,
										pu.id_puerto, pu.puerto,
										cu.id_cupos_proveedor, cu.cantidad_asignada, SUM(cu.cantidad) as cantidad_cupo_proveedor, cu.estado as estado_cupo_proveedor,
										t.id_ticket, t.fecha_de_creacion, t.estado, t.fecha_de_ingreso,
										pr.id_proveedor, pr.nombre
										from cupos c
										left join clientes cli on cli.id_cliente=c.id_cliente
										left join puertos pu on pu.id_puerto=c.id_puerto
										left join cupos_proveedor cu on cu.id_cupo=c.id_cupo
										left join tickets t on cu.id_cupos_proveedor=t.id_cupos_proveedor
										left join proveedores pr on pr.id_proveedor=cu.id_proveedor

										group by c.id_cupo

										");
			$rows = $db->loadObjectList();
			echo json_encode($rows);
		break;
	}


?>
