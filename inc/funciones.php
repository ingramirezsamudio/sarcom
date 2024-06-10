<?php
// require __DIR__.'/auth/autoload.php';
// $auth = new \Delight\Auth\Auth($db_auth);

include("mysql.php");

function url(){
	$host=$_SERVER['HTTP_HOST'];
	return "http://$host/";
}

// function verificaLogin(){
// 	require __DIR__.'/auth/autoload.php';
// 	$auth = new \Delight\Auth\Auth($db_auth);
// 	if (!$auth->isLoggedIn()){
// 		header("Location: ".url());
// 		exit;
// 	}else if ($auth->isLoggedIn() && !$auth->isNormal()){
// 		header("Location: ".url());
// 		exit;
// 	}else{
// 		return true;
// 	}
// }
//Encripta los campos que le pases
class Password {
    const SALT = 'freelancerpy';
    public static function hash($password) {
        return hash('sha512', self::SALT . $password);
    }
    public static function verify($password, $hash) {
        return ($hash == self::hash($password));
    }
}

function datosUsuario($username){
	$db = DataBase::conectar();
	$db->setQuery("SELECT * from users where username='$username'");
	$u = $db->loadObject();
	return $u;
}

function verRol($auth){
	// ROLES_MASK 1 = ADMIN
	// ROLES_MASK 2 = VENTAS
	// ROLES_MASK 4 = INVENTARIO
	// SUMAR ROLES PARA TENER EL ROLES_MASK
	// $auth->admin()->getRolesForUserById($id_usuario); POR ID DE USUARIO
	return $auth->getRoles(); //DEL USUARIO LOGUEADO
}


function datosEmpresa($username){
	$db = DataBase::conectar();
	//s.id_sucursal, s.nombre_empresa, s.sucursal, s.logo, s.logo_texto, s.logo_icono, s.favicon, s.colores, s.nombre_sistema, s.subtitulo_sistema, s.direccion, s.ciudad, s.pais, s.telefono, s.email, s.moneda, s.estado, u.username, u.nombre_apellido, u.departamento, u.cargo, u.ci, u.telefono, u.fecha_registro, u.id_sucursal, u.foto
	$db->setQuery("SELECT * FROM sucursales s INNER JOIN users u ON u.id_sucursal=s.id_sucursal AND u.username='$username'");
	$u = $db->loadObject();
	return $u;
}

function datosSucursal($id_sucursal){
	$db = DataBase::conectar();
	//$db->setQuery("SELECT * FROM sucursales s WHERE id_sucursal=$id_sucursal");
	$db->setQuery("SELECT t.ruc, s.razon_social, s.id_sucursal, concat(s.nombre_empresa,' - ',s.sucursal) as sucursal, s.logo, s.direccion, s.ciudad, s.departamento FROM sucursales s INNER JOIN timbrados t ON t.id_sucursal=s.id_sucursal WHERE s.estado=1 AND t.estado='Activo' AND t.tipo='Factura' AND s.id_sucursal=$id_sucursal ORDER BY s.sucursal");
	$u = $db->loadObject();
	return $u;
}

function fechaLatina($fecha){
    $fecha = substr($fecha,0,10);
	/*$date = new DateTime($fecha);
	return $date->format('d/m/Y');*/
    list($anio,$mes,$dia)=explode("-",$fecha);
	if (!$anio){
		return "";
	}else{
		return $dia."/".$mes."/".$anio;
	}
}

function fechaLatinaHora($fecha){
	/*$date = new DateTime($fecha);
	return $date->format('d/m/Y H:i');*/
    list($anio,$mes,$dia)=explode("-",$fecha);
	$hora = substr($fecha,11,5);
	if (!$anio){
		return "";
	}else{
		return substr($dia,0,2)."/".$mes."/".$anio." ".$hora;
	}
}

function fechaMYSQL($fecha){
    $fecha = substr($fecha,0,10);
    list($dia,$mes,$anio)=explode("/",$fecha);
    return $anio."-".$mes."-".$dia;
}
function fechaMYSQLHora($fecha){
    $fecha_sola = substr($fecha,0,10);
	$fecha_hora = substr($fecha,11,16);
    list($dia,$mes,$anio)=explode("/",$fecha_sola);
	list($hora,$min) = explode(":",$fecha_hora);
    return $anio."-".$mes."-".$dia." ".$hora.":".$min;
}

function getAutoincrement($table){
	$db = DataBase::conectar();
	$db->setQuery("SELECT LPAD(`AUTO_INCREMENT`,9,'0') as auto FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = '$table'");
	$r = $db->loadObject()->auto;
	return $r;
}

function redondearGs($gs){
	if (strlen($gs) >= 4){
	   $a = (int)$gs / 100;
	   $b = round($a);
	   $c = $b * 100;
	   return $c;
	}else if (strlen($gs) <= 3)	{
		$a = (int)$gs / 100;
		$b = round($a);
	    $c = $b * 100;
		return $c;
	}
}
function separadorMiles($number){
	if (is_numeric($number)){
		$nro=number_format($number,0, ".", ".");
		return $nro;
	}
}

function separadorMilesDecimales($number){
	if (is_numeric($number)){
		$nro=number_format($number,2, ",", ".");
		return $nro;
	}
}

function quitaSeparadorMiles($x){
	if($x) {
		return str_replace('.','',$x);
	}else{
		return 0;
	}
}

function fechaEspanol($x){
	$dias = array("Domingo","Lunes","Martes","Miércoles","Jueves","Viernes","Sábado");
	$meses = array("Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre");
	if ($x == "dia"){
		return $dias[date('w')];
	}else{
		return $dias[date('w')].", ".date('d')." de ".$meses[date('n')-1]. " del ".date('Y') ;
	}
}


function menu($id){
	$db = DataBase::conectar();
	$db->setQuery("select us.rol, rm.id_menu, um.menu, um.submenu, um.url, um.orden, us.nombre_usuario
		from usuarios us
		inner join roles_menu rm on us.rol = rm.id_rol
		inner join menus um on um.id_menu = rm.id_menu where um.estado = 1 and md5(us.id_usuario) = '$id' order by orden");
	$menus = $db->loadObjectList();

	$salida_menu = "<ul class='nav navbar-nav'>";
		//<li class='active'><a href='./index.php'>Inicio</a></li>";

	$menuActual = '';
	$usoSubmenu = 0;

	foreach($menus as $m){
		$id_menu = "menu".$m->id_menu;
		$submenu = $m->submenu;
		$menu = $m->menu;
		$url = $m->url;
		$nombre = ucfirst($m->nombre_usuario);

		if ($submenu == '-'){
			if ($usoSubmenu > 0){
				$salida_menu .= "</ul></li>";
			}
			$salida_menu .= "<li><a href='$url'>$menu</a></li>";
			$nombre_menu = $id;
		}else{
			if ($menu != $menuActual){
				if ($usoSubmenu > 0){
				$salida_menu .= "</ul></li>";
			}
				$salida_menu .= "<li class='dropdown'>
				  <a href='#' class='dropdown-toggle' data-toggle='dropdown'>$menu<b class='caret'></b></a>
				  <ul class='dropdown-menu'>";

					$salida_menu .= "<li><a href='$url'>$submenu</a></li>";

				  $menuActual = $menu;
				  $usoSubmenu++;
			}else{
				//SE CORRIGE LOGICA, HABIA PROBLEMAS CUANDO 2 MENU TENIAN UN SOLO SUBMENU CADA UNO (CASO USUARIO JUAN SUMINISTRO)
					$salida_menu .= "<li><a href='$url'>$submenu</a></li>";
				//	$usoSubmenu++;
			}

		}
	}

	##Nuevo menu de usuario
	$salida_menu .= "</ul></ul>

	<ul class='nav navbar-nav navbar-right'>
            <li class='dropdown'>
              <a href='#' class='dropdown-toggle' data-toggle='dropdown'><span class='glyphicon glyphicon-user'></span> $nombre<b class='caret'></b></a>
              <ul class='dropdown-menu'>
                <!--<li><a href='mi-cuenta.php'><span class='glyphicon glyphicon-edit'></span> Mi Cuenta</a></li>
                <li><a href='./sugerencias.php'><span class='glyphicon glyphicon glyphicon-info-sign'></span> Sugerencias</a></li>-->
                <li><a href='./logout.php'><span class='glyphicon glyphicon-log-out'></span> Salir</a></li>
              </ul>
            </li>
          </ul>
          ";
          // Si queres que se vea este form tenes que poner debajo del ul de arriba
      //     <form class='navbar-form navbar-right' method='POST' action='resultado-busqueda.php' role='search'>
		    //     <div class='form-group'>
		    //       <input type='text' class='form-control' name='codigo' placeholder='Ingrese Cod. Producto' pattern='.{1,}' title='5 caracteres como mínimo' required>
		    //     </div>
		    //     <button type='submit' class='btn btn-default' name='buscar_producto'>Buscar</button>
		    // </form>
	echo $salida_menu;
}

function nombrePagina($pagina){
	$db2 = DataBase::conectar();
	$db2->setQuery("SELECT titulo from menus where url like '%".$pagina."'");
	$pa = $db2->loadObject();
	return $pa->titulo;
}

/*function verificaLogin($pag){
	session_start([
		 'cookie_lifetime' => 86400,
	]);

	if(!isset($_SESSION['id_usuario']) && !isset($_COOKIE['3a60fbdR3c0Rd4R0ebf5'])){
		header('Location:index.php');
	}else if (isset($_COOKIE['3a60fbdR3c0Rd4R0ebf5'])){
		$_SESSION['id_usuario']=$_COOKIE['3a60fbdR3c0Rd4R0ebf5'];
		$_SESSION['usuario']=datosUsuario($_SESSION['id_usuario'])->nombre_usuario;
	}

	if($pag){
		//VERIFICAMOS SI TIENE PERMISO SOBRE LA PÁGINA
		$pag_tmp = explode("/",$pag);
		$pagina = end($pag_tmp);
		$id_usu = $_SESSION['id_usuario'];
		$db = DataBase::conectar();
		$db->setQuery("SELECT u.id_usuario FROM usuarios u INNER JOIN roles_menu rm ON rm.id_rol=u.rol INNER JOIN menus m ON rm.id_menu=m.id_menu WHERE md5(id_usuario)='$id_usu' AND m.url like '%/$pagina'");
		$row = $db->loadObject();
		if (!$row){
			echo "<p style='font:bold 16px Tahoma'>PAGINA NO ENCONTRADA<br>Si cree que se trata de un error, favor consulte con el administrador del sistema.<br><a href=".url()."/>Volver al Inicio</a></p>";
			exit;
		}
	}

}*/

function alertDismiss($msj, $tipo){

	switch ($tipo){
		case 'error':
			$salida = "<div class='alert alert-danger'> <i class='fa fa-exclamation-triangle'></i>&nbsp;&nbsp;$msj&nbsp;&nbsp;&nbsp;<button type='button' class='close' data-dismiss='alert' aria-label='Close'>
					 <span aria-hidden='true'>&times;</span></button></div>";
		break;

		case 'error_span':
			$salida = "<span class='alert alert-danger alert-dismissable'><button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
			<span class='glyphicon glyphicon-exclamation-sign'>&nbsp;</span>$msj</span>";
		break;

		case 'ok':
			$salida = "<div class='alert alert-success'> <i class='fa fa-check-circle'></i>&nbsp;&nbsp;$msj&nbsp;&nbsp;&nbsp;<button type='button' class='close' data-dismiss='alert' aria-label='Close'>
						<span aria-hidden='true'>&times;</span></button></div>";
		break;

		case 'ok_span':
			$salida = "<span class='alert alert-success alert-dismissable'><button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
			<span class='glyphicon glyphicon-ok'>&nbsp;</span>$msj</span>";
		break;

		case 'yellow':
			$salida = "<div class='alert alert-warning alert-dismissable'><button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
			<span class='glyphicon glyphicon-ok'>&nbsp;</span>$msj</div>";
		break;

	}
	return $salida;
}

function sweetAlert($msj, $tipo){
	return ["msj"=>$msj, "tipo"=>"error"];
}

function piePagina(){
	$pie = "<div id='footer'>
		  		<div class='container'>
					<p class='text-muted'>".datosConfig('nombre_sistema')." - Desarrollado por <a href='http://www.freelancer.com.py' target='blank'>Freelancers del Paraguay</a>
					</p>
				</div>
			</div>";
	return $pie;
}

function exportarExcel($datos, $titulo){

	$hoy=date('d-m-Y');
	$nombre='xls/Exportado_'.$titulo.'_'.$hoy.".xls";


	$xml = simplexml_load_string($datos);
	$salida = "<table border='1'>";
	foreach ($xml->Worksheet->Table->Row as $row) {
	   $celda = $row->Cell;
	   $salida .= "<tr>".$celda;
	   //echo "\t";
	   foreach ($celda as $cell) {
			$salida .= "<td>".$cell->Data."</td>";
			//echo "\t";
		}
		$salida .= "</tr>";
	}
	$salida .= "</table>";
	//print $salida;

	file_put_contents($nombre, utf8_decode($salida));

	echo $nombre;
}

function ceiling($number=NULL, $significance=1)
{
	return ( is_numeric($number) && is_numeric($significance) ) ? (ceil($number/$significance)*$significance) : false;
}

function limpia_archivo($url_tmp) {

	$url_utf8 = mb_strtolower($url_tmp, 'UTF-8');

	$find = array(' ', '&', '\r\n', '\n', '+');
	$url_utf8 = str_replace ($find, '_', $url_utf8);


	$url_utf8 = strtr(utf8_decode($url_utf8),
			utf8_decode('_àáâãäåæçèéêëìíîïðñòóôõöøùúûüýÿ'),
							'-aaaaaaaceeeeiiiionoooooouuuuyy');

	//Ya que usamos TRANSLIT en el comando iconv, tenemos que limpiar los simbolos que quedaron
	$find = array('/[^a-z0-9.\-<>]/', '/[\-]+/', '/<[^>]*>/');
	$repl = array('', '_', '');
	$url = preg_replace ($find, $repl, $url_utf8);

	return $url;
}

function resizeImage($sourceImage, $targetImage, $maxWidth, $maxHeight, $quality=85, $extension='jpg'){
	// Obtain image from given source file.

	if ($extension=="jpg"){
		$ext = "jpeg";
		if (!$image = @imagecreatefromjpeg($sourceImage))	{
			return false;
		}
	}else if ($extension=="png"){
		$ext = "png";
		if (!$image = @imagecreatefrompng($sourceImage))	{
			return false;
		}
	}else{
		return false;
	}

	// Get dimensions of source image.
	list($origWidth, $origHeight) = getimagesize($sourceImage);
	if ($maxWidth == 0)	{
		$maxWidth  = $origWidth;
	}
	if ($maxHeight == 0)	{
		$maxHeight = $origHeight;
	}
	// Calculate ratio of desired maximum sizes and original sizes.
	$widthRatio = $maxWidth / $origWidth;
	$heightRatio = $maxHeight / $origHeight;

	// Ratio used for calculating new image dimensions.
	$ratio = min($widthRatio, $heightRatio);

	// Calculate new image dimensions.
	$newWidth  = (int)$origWidth  * $ratio;
	$newHeight = (int)$origHeight * $ratio;

	// Create final image with new dimensions.
	$newImage = imagecreatetruecolor($newWidth, $newHeight);
	imagecopyresampled($newImage, $image, 0, 0, 0, 0, $newWidth, $newHeight, $origWidth, $origHeight);

	if ($extension=="jpg"){
		imagejpeg($newImage, $targetImage, $quality);
	}else{
		imagepng($newImage, $targetImage, $quality);
	}
	// Free up the memory.
	imagedestroy($image);
	imagedestroy($newImage);

	return true;
}



?>
