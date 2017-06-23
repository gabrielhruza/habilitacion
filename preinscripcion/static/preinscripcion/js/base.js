//Para vive_con

$(document).ready(function()
{
    $("input[name=inlineRadioOptions]").click(function () {    

        opcion = $(this).val();

        switch(opcion) {
    	
    	case 'option1':
        	//vive con padre
        	apellido 	= $('#id_padre-apellido').val();
        	nombre 		= $('#id_padre-nombre').val();
			dni 		= $('#id_padre-dni').val();
			email 		= $('#id_padre-email').val();
			telefonoPersonal = $('#id_padre-telefonoPersonal').val();
			domicilio 	= $('#id_padre-domicilio').val();
			nacionalidad = $('#id_padre-nacionalidad').val();

        break;
    	case 'option2':
        	//vive con madre
        	apellido 	= $('#id_madre-apellido').val();
        	nombre 		= $('#id_madre-nombre').val();
			dni 		= $('#id_madre-dni').val();
			email 		= $('#id_madre-email').val();
			telefonoPersonal = $('#id_madre-telefonoPersonal').val();
			domicilio 	= $('#id_madre-domicilio').val();
			nacionalidad = $('#id_madre-nacionalidad').val();
        break;
    	default:
    		//vive con tutor
    		apellido 	= $('#id_tutor-apellido').val();
        	nombre 		= $('#id_tutor-nombre').val();
			dni 		= $('#id_tutor-dni').val();
			email 		= $('#id_tutor-email').val();
			telefonoPersonal = $('#id_tutor-telefonoPersonal').val();
			domicilio 	= $('#id_tutor-domicilio').val();
			nacionalidad = $('#id_tutor-nacionalidad').val();
        	
		}

		$('#id_vivecon-apellido').val(apellido);
		$('#id_vivecon-nombre').val(nombre);
		$('#id_vivecon-dni').val(dni);
		$('#id_vivecon-email').val(email);
		$('#id_vivecon-telefonoPersonal').val(telefonoPersonal);
		$('#id_vivecon-domicilio').val(domicilio);
		$('#id_vivecon-nacionalidad').val(nacionalidad);

    });
});