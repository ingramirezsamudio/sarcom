<?php
header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Headers: Origin, X-Requested-With, cache-control, Content-Type, Accept");
header('Access-Control-Allow-Methods: GET, POST');include 'funciones.php';
$db = DataBase::conectar();
$q = $db->clearText($_REQUEST['q']);
//if (empty($q)) header('Location: '.url());
switch ($q)
{

	case 'superadmin':
		echo "
		<li><a href='inicio.html'>Inicio<i class='fas fa-home'></i></a></li>
		<li><a href='puertos.html'>Puertos<i class='fas fa-ship'></i></a></li>
		<li><a href='clientes.html'>Clientes<i class='fas fa-user'></i></a></li>
		<li><a href='proveedores.html'>Proveedores<i class='fas fa-building'></i></a></li>
		<li><a href='cupos.html'>Cupos<i class='fas fa-sticky-note'></i></a></li>
		<li><a href='choferes.html'>Choferes<i class='fas fa-truck-moving'></i></a></li>
			<li><a class='has-arrow waves-effect waves-dark' href='javascript:void(0)' aria-expanded='false'><i class='fas fa-user'></i><span class='hide-menu'>Sistema</span></a>
				<ul aria-expanded='false' class='collapse'>
				<li><a href='usuarios.html'>Usuarios<i class='fas fa-users'></i></a></li>
				</ul>
			</li>
			<li><a class='has-arrow waves-effect waves-dark' href='javascript:void(0)' aria-expanded='false'><i class='fas fa-clipboard-list'></i><span class='hide-menu'>Reportes</span></a>
				<ul aria-expanded='false' class='collapse'>
				<li><a href='reporte-asignacion.html'>Reporte de Asignacion<i class='fas fa-ticket-alt'></i></a></li>
				<li><a href='reporte-cupos.html'>Reporte de Cupos<i class='fas fa-ticket-alt'></i></a></li>
				<li><a href='reporte-tickets.html'>Reporte de Tickets<i class='fas fa-ticket-alt'></i></a></li>
				<li><a href='reporte-movimientos.html'>Reporte de Movimientos<i class='fas fa-running'></i></a></li>

				</ul>
			</li>
		";
	break;

case 'admin':
	echo "

			<li><a href='inicio.html'>Inicio<i class='fas fa-home'></i></a></li>
			<li><a href='puertos.html'>Puertos<i class='fas fa-ship'></i></a></li>
			<li><a href='clientes.html'>Clientes<i class='fas fa-user'></i></a></li>
			<li><a href='proveedores.html'>Proveedores<i class='fas fa-building'></i></a></li>
			<li><a href='cupos.html'>Cupos<i class='fas fa-sticky-note'></i></a></li>
			<li><a href='choferes.html'>Choferes<i class='fas fa-truck-moving'></i></a></li>
				<li><a class='has-arrow waves-effect waves-dark' href='javascript:void(0)' aria-expanded='false'><i class='fas fa-user'></i><span class='hide-menu'>Sistema</span></a>
					<ul aria-expanded='false' class='collapse'>
					<li><a href='usuarios.html'>Usuarios<i class='fas fa-users'></i></a></li>
					</ul>
				</li>
				<li><a class='has-arrow waves-effect waves-dark' href='javascript:void(0)' aria-expanded='false'><i class='fas fa-clipboard-list'></i><span class='hide-menu'>Reportes</span></a>
					<ul aria-expanded='false' class='collapse'>
					<li><a href='reporte-asignacion.html'>Reporte de Asignacion<i class='fas fa-ticket-alt'></i></a></li>
					<li><a href='reporte-cupos.html'>Reporte de Cupos<i class='fas fa-ticket-alt'></i></a></li>
					<li><a href='reporte-tickets.html'>Reporte de Tickets<i class='fas fa-ticket-alt'></i></a></li>
					<li><a href='reporte-movimientos.html'>Reporte de Movimientos<i class='fas fa-running'></i></a></li>

					</ul>
				</li>
	";
break;




case 'cliente':
	echo "
			<li><a href='inicio.html'>Inicio<i class='fas fa-home'></i></a></li>
			<li><a href='proveedores.html'>Proveedores<i class='fas fa-building'></i></a></li>
			<li><a href='choferes.html'>Choferes<i class='fas fa-truck-moving'></i></a></li>
			<li><a href='cupos-proveedores.html'>Cupos para Prov.<i class='fas fa-sticky-note'></i></a></li>

	";
break;

case 'proveedor':
	echo "
			<li><a href='inicio.html'>Inicio<i class='fas fa-home'></i></a></li>
			<li><a href='choferes.html'>Choferes<i class='fas fa-truck-moving'></i></a></li>
			<li><a href='tickets.html'>Tickets<i class='fas fa-ticket-alt'></i></a></li>

	";
break;

case 'portero':
	echo "
    <li><a href='inicio.html'>Inicio<i class='fas fa-home'></i></a></li>
    <!-- <li><a href='consulta.html'>Consulta<i class='fas fa-search'></i></a></li> -->
    <li><a href='escanear.html'>Escanear<i class='fas fa-qrcode'></i></a></li>
";

break;
}


?>
