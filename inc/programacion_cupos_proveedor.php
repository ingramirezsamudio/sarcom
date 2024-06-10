<?php
header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");
header('Access-Control-Allow-Methods: POST');
include 'funciones.php';
$db = DataBase::conectar();

$hoy = date('Y-m-d');
$db->setQuery("SELECT * from cupos_proveedor where repetir_hasta>='$hoy'");
$rows = $db->loadObjectList();

foreach ($rows as $key => $value) {
	$repetir_hasta = $value->repetir_hasta;
	$cantidad_disponible = $value->cantidad;
	$cantidad_asignada = $value->cantidad_asignada;
	$id_cupo = $value->id_cupo;
	$id_cupos_proveedor = $value->id_cupos_proveedor;
	$id_proveedor = $value->id_proveedor;
	$estado = $value->estado;
	$id_usuario = $value->id_usuario;

	// analizamos cada cupo para ver si aun tiene disponibles para asignar
	$db->setQuery("SELECT * from cupos where id_cupo='$id_cupo'");
	$row = $db->loadObject();
	$cupos_disponibles = $row->cantidad;

	if ($cantidad_asignada<=$cupos_disponibles) {

		// SI HAY CUPOS DISPONIBLES, SE HARÁ EL INSERT...
		$db->setQuery("INSERT INTO cupos_proveedor (id_cupo, id_proveedor, cantidad_asignada, cantidad, estado, id_usuario)
						VALUES ('$id_cupo','$id_proveedor','$cantidad_asignada','$cantidad_asignada','DISPONIBLE','$id_usuario')");
		if(!$db->alter()){
			echo "Error. ".$db->getError();
		}else{
			echo "Cupo/Proveedor registrado correctamente";
		}

		//SE DEBE DESCONTAR LA CANTIDAD DE Cupos
		$db->setQuery("UPDATE cupos SET cantidad=cantidad-'$cantidad_asignada' WHERE id_cupo = '$id_cupo'");
		if(!$db->alter()){
			echo "Error. ". $db->getError();
		}else{
			echo "<br>Cantidad en cupo nro: '$id_cupo' descontada correctamente";
		}


		//si los cupos se agotan, se debe cambiar el estado a 'AGOTADO'
		$db->setQuery("SELECT * from cupos where id_cupo='$id_cupo'");
		$rowx = $db->loadObjectList();
		$cantidad_restante=$rowx->cantidad;
		if ($cantidad_restante<=0) {
			$db->setQuery("UPDATE cupos SET estado='AGOTADO' WHERE id_cupo = '$id_cupo'");
			if(!$db->alter()){
				echo "Error. ". $db->getError();
			}else{
				echo "<br>Cupo nro: '$id_cupo' AGOTADO.....FIN<br>";
			}
		}else {

			}
	}else {
		echo "<br>NO HAY CUPOS SUFICIENTES, SE NECESITAN ".$cantidad_asignada."<br>";
		}


	}



?>
