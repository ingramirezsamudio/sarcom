<?php 
require 'gateway_namandu/api_namandu.php';

try {
    // Obtenemos los datos del mensaje mediante esta funcion y le pasamos la id
    $msg = getMessageByID("12");
    print_r($msg);

    $estado_gateway = $msg['status'];
			
	if ($estado_gateway=="Sent"){
		$estado_gateway = "Enviado";
	}

	echo $estado_gateway;

} catch (Exception $e) {
    echo $e->getMessage();
}
?>