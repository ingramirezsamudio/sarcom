<?php
header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");
header('Access-Control-Allow-Methods: POST');
include 'funciones.php';
$db = DataBase::conectar();

$hoy = date('Y-m-d');
$db->setQuery("SELECT * from cupos where repetir_hasta>='$hoy'");
$rows = $db->loadObjectList();

foreach ($rows as $key => $value) {
	$repetir_hasta = $value->repetir_hasta;
	$repetir = $value->repetir;
	$id_cupo = $value->id_cupo;

	// analizamos cada cupo para ver extraer datos
	$db->setQuery("SELECT * from cupos where id_cupo='$id_cupo'");
	$row = $db->loadObject();
	$cantidad = $row->cantidad_original;
	$id_cliente = $row->id_cliente;
	$id_usuario = $row->id_usuario;
	$id_puerto = $row->id_puerto;
	$fecha = $hoy;
	$fecha_fin = $row->fecha_fin;

		$db->setQuery("INSERT INTO cupos (id_cliente, id_puerto, fecha, fecha_fin, cantidad, cantidad_original, estado, id_usuario)
						VALUES ('$id_cliente','$id_puerto','$fecha','$fecha_fin','$cantidad','$cantidad','DISPONIBLE','$id_usuario')");
		if(!$db->alter()){
			echo "Error. ".$db->getError();
		}else{
			echo "Cupo registrado correctamente<br>";
		}
	}
?>
