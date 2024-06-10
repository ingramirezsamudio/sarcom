<?php
header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Headers: Origin, X-Requested-With, cache-control, Content-Type, Accept");
header('Access-Control-Allow-Methods: GET, POST');
header('Access-Control-Allow-Origin: *');
include 'funciones.php';
$db = DataBase::conectar();
$q = $db->clearText($_POST['q']);
if (empty($q)) header('Location: '.url());
switch ($q)
{

	case 'usuario':
		$id_usuario = $db->clearText($_POST['_0x58c1ed']);
		$db->setQuery("SELECT nombre_apellido FROM usuarios WHERE SHA2(CONCAT('Ñ@m@ndu-2020',id_usuario), 512)='$id_usuario'");
		$row = $db->loadObject();
		echo $row->nombre_apellido;
	break;

   	case 'top_bar':
        $id_usuario = $db->clearText($_POST['_0x58c1ed']);

        $db->setQuery("SELECT foto, nombre_apellido, tipo_usuario FROM usuarios WHERE SHA2(CONCAT('Ñ@m@ndu-2020',id_usuario), 512)='$id_usuario'");
		$rows = $db->loadObject();

		if ($rows) {
			$foto = $rows->foto;
			if (empty($foto)) {
				$foto = "./dist/images/users/nobody.png";
			}
			if ($rows->tipo_usuario == "docente") {
				echo '
                <a class="nav-link dropdown-toggle text-muted waves-effect waves-dark" href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="'.url().'/'.$foto.'" alt="user" class="img-circle" width="30"></a>
                <div class="dropdown-menu dropdown-menu-right user-dd animated flipInY">
                    <span class="with-arrow"><span class="bg-primary"></span></span>
                    <div class="d-flex no-block align-items-center p-15 bg-dark text-white m-b-10">
                        <div class=""><img src="'.url().'/'.$foto.'" alt="'.$rows->nombre_apellido.'" class="img-circle" width="60"></div>
                        <div class="m-l-10">
                            <h6 class="m-b-0">'.$rows->nombre_apellido.'</h6>
                        </div>
                    </div>
                    <a class="dropdown-item mt-2" href="./perfil_docente.html"><i class="fas fa-user-cog m-r-5 m-l-5"></i> MI PERFIL</a>
                    <a class="dropdown-item mt-2" onclick="cerrarSesion()" href="javascript:void(0)"><i class="fa fa-power-off m-r-5 m-l-5 mr-2"></i> CERRAR SESIÓN</a>
                </div>';
			}else if ($rows->tipo_usuario == "alumno"){
				echo '
                <a class="nav-link dropdown-toggle text-muted waves-effect waves-dark" href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="'.url().'/'.$foto.'" alt="user" class="img-circle" width="30"></a>
                <div class="dropdown-menu dropdown-menu-right user-dd animated flipInY">
                    <span class="with-arrow"><span class="bg-primary"></span></span>
                    <div class="d-flex no-block align-items-center p-15 bg-dark text-white m-b-10">
                        <div class=""><img src="'.url().'/'.$foto.'" alt="'.$rows->nombre_apellido.'" class="img-circle" width="60"></div>
                        <div class="m-l-10">
                            <h6 class="m-b-0">'.$rows->nombre_apellido.'</h6>
                        </div>
                    </div>
                    <a class="dropdown-item mt-2" href="./perfil_alumno.html"><i class="fas fa-user-cog m-r-5 m-l-5"></i> MI PERFIL</a>
                    <a class="dropdown-item mt-2"  onclick="cerrarSesion()" href="javascript:void(0)"><i class="fa fa-power-off m-r-5 m-l-5 mr-2"></i> CERRAR SESIÓN</a>
                </div>';
			}else if ($rows->tipo_usuario == "admin"){
				echo '
                <a class="nav-link dropdown-toggle text-muted waves-effect waves-dark" href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="'.url().'/'.$foto.'" alt="user" class="img-circle" width="30"></a>
                <div class="dropdown-menu dropdown-menu-right user-dd animated flipInY">
                    <span class="with-arrow"><span class="bg-primary"></span></span>
                    <div class="d-flex no-block align-items-center p-15 bg-dark text-white m-b-10">
                        <div class=""><img src="'.url().'/'.$foto.'" alt="'.$rows->nombre_apellido.'" class="img-circle" width="60"></div>
                        <div class="m-l-10">
                            <h6 class="m-b-0">'.$rows->nombre_apellido.'</h6>
                        </div>
                    </div>
                    <a class="dropdown-item mt-2" href="./perfil_admin.html"><i class="fas fa-user-cog m-r-5 m-l-5"></i> MI PERFIL</a>
                    <a class="dropdown-item mt-2"  onclick="cerrarSesion()" href="javascript:void(0)"><i class="fa fa-power-off m-r-5 m-l-5 mr-2"></i> CERRAR SESIÓN</a>
                </div>';
			}else{
				echo '
				<a class="nav-link dropdown-toggle text-muted waves-effect waves-dark" href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="./dist/images/users/nobody.png" alt="user" class="img-circle" width="30"></a>
				<div class="dropdown-menu dropdown-menu-right user-dd animated flipInY">
					<span class="with-arrow"><span class="bg-primary"></span></span>
					<div class="d-flex no-block align-items-center p-15 bg-dark text-white m-b-10">
						<div class=""><img src="./dist/images/users/nobody.png" alt="user" class="img-circle" width="60"></div>
						<div class="m-l-10">
							<h6 class="m-b-0">Error...</h6>
						</div>
					</div>
					<a class="dropdown-item mt-2" href="#"><i class="fas fa-user-cog m-r-5 m-l-5"></i>  MI PERFIL</a>
					<a class="dropdown-item mt-2" href="#"><i class="fa fa-power-off m-r-5 m-l-5 mr-2"></i> CERRAR SESIÓN</a>
				</div>';
		}}
   	break;

    case 'left_bar':
        $id_usuario = $db->clearText($_POST['_0x58c1ed']);
        $db->setQuery("SELECT tipo_usuario FROM usuarios WHERE SHA2(CONCAT('Ñ@m@ndu-2020',id_usuario), 512)='$id_usuario'");
        $rows = $db->loadObject();

        if ($rows) {
			echo "<script>
				$(function () {
					 var url = window.location + '';
						var path = url.replace(window.location.protocol + '//' + window.location.host + '/', '');
						var element = $('ul#sidebarnav a').filter(function() {
							return this.href === url || this.href === path;// || url.href.indexOf(this.href) === 0;
						});

						element.parentsUntil('.sidebar-nav').each(function (index)
						{
							if($(this).is('li') && $(this).children('a').length !== 0)
							{
								$(this).parent('ul#sidebarnav').length === 0
									? $(this).addClass('active')
									: $(this).addClass('selected');
							}
							else if(!$(this).is('ul') && $(this).children('a').length === 0)
							{
								$(this).addClass('selected');
							}
							else if($(this).is('ul')){
								$(this).show();
							}
						});

					element.addClass('active');
					$('#sidebarnav a').on('click', function (e) {

							if (!$(this).hasClass('active')) {
								// hide any open menus and remove all other classes
								$('ul', $(this).parents('ul:first')).removeClass('in');
								$('a', $(this).parents('ul:first')).removeClass('active');
								$('ul', $(this).parents('ul:first')).css('display','');
								$('li', $(this).parents('ul:first')).removeClass('selected');

							   // open our new menu and add the open class
								$(this).next('ul').addClass('in');
								$(this).addClass('active');

							}
							else if ($(this).hasClass('active')) {
								$(this).removeClass('active');
								$(this).parents('ul:first').removeClass('active');
								$(this).next('ul').removeClass('in');
							}
					})
					$('#sidebarnav >li >a.has-arrow').on('click', function (e) {
						e.preventDefault();
					});
				});
			</script>
			";

            echo '
                <div class="d-flex no-block nav-text-box align-items-center">
                        <span><img src="dist/images/logo_horizontal.png" alt="LEBOMBO - DINAPI"></span>
                        <a style="margin-left: 14px" class="nav-toggler waves-effect waves-dark hidden-sm-up" href="javascript:void(0)"><i class="fas fa-times fa-lg"></i></a>
                    </div>
                    <div class="scroll-sidebar">
                        <nav class="sidebar-nav">
                            <ul id="sidebarnav">';

                    if ($rows->tipo_usuario == "docente") {
                        echo '
                            <li><a href="./inicio.html">Inicio<i class="fas fa-home"></i></a></li>
                            <li><a href="./clases.html">Clases<i class="fas fa-chalkboard-teacher"></i></a></li>
                            <li><a href="./calendario.html">Calendario<i class="fas fa-calendar"></i></a></li>
                            <li><a href="./materiales.html">Materiales<i class="fas fa-folder"></i></a></li>
                            <li><a href="./biblioteca_clases.html">Biblioteca de Clases<i class="fas fa-book-open"></i></a></li>

                            <li><a class="has-arrow waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false"><i class="fas fa-restroom"></i><span class="hide-menu">Alumnos</span></a>
                                <ul aria-expanded="false" class="collapse">
                                    <li><a href="./invitar_alumnos.html">Invitar Alumnos<i class="fas fa-paper-plane"></i></a></li>
                                    <li><a href="./alumnos_clases.html">Alumnos por clases<i class="fas fa-user-graduate"></i></a></li>
                                </ul>
                            </li>

							<li><a class="has-arrow waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false"><i class="fas fa-chart-bar"></i><span class="hide-menu">Reportes</span></a>
                                <ul aria-expanded="false" class="collapse">
									<li><a href="./clases-y-tareas.html">Clases y Tareas<i class="fas fa-copy"></i></a></li>
                                </ul>
                            </li>






                            ';
                    }else if ($rows->tipo_usuario == "alumno"){
                        echo '
                            <li><a href="./inicio.html">Inicio<i class="fas fa-home"></i></a></li>
                            <li><a href="./clases.html">Clases<i class="fas fa-chalkboard-teacher"></i></a></li>
                            <li><a href="./calendario.html">Calendario<i class="fas fa-calendar-alt"></i></a></li>
                        ';

                    }else if ($rows->tipo_usuario == "admin"){
                        echo '
                            <li><a href="./inicio.html">Inicio<i class="fas fa-home"></i></a></li>
                            <li><a href="./admin_docentes.html">Docentes<i class="fas fa-user-tie"></i></a></li>

                            <li><a href="./admin_clases.html">Clases<i class="fas fa-chalkboard-teacher"></i></a></li>
                            <li><a href="./admin_tareas.html">Tareas<i class="fas fa-tasks"></i></a></li>
                            <li><a href="./admin_alumnos.html">Alumnos<i class="fas fa-user-graduate"></i></a></li>
                            <li><a href="./admin_clases_matrices.html">Biblioteca de Clases<i class="fas fa-book-open"></i></a></li>
                            <!--<li><a href="./materiales.html">Materiales<i class="fas fa-folder"></i></a></li>-->

                            <li><a class="has-arrow waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false"><i class="fas fa-restroom"></i><span class="hide-menu">Alumnos</span></a>
                                <ul aria-expanded="false" class="collapse">
                                    <li><a href="./invitar_alumnos.html">Invitar Alumnos<i class="fas fa-paper-plane"></i></a></li>
                                    <li><a href="./alumnos_clases.html">Alumnos por clases<i class="fas fa-user-graduate"></i></a></li>
                                </ul>
                            </li>

							<li><a class="has-arrow waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false"><i class="fas fa-chart-bar"></i><span class="hide-menu">Reportes</span></a>
                                <ul aria-expanded="false" class="collapse">
									<li><a href="./clases-y-tareas.html">Clases y Tareas<i class="fas fa-copy"></i></a></li>
                                </ul>
                            </li>';
                    }
                echo '
                        </ul>
                    </nav>
                </div>
                ';
        }else{

        }

    break;

}
?>
