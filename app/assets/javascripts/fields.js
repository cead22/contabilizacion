function remove_fields(link) {
  $(link).prev("input[type=hidden]").val("1");
  $(link).closest(".fields").hide();
}

function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g")
  $(link).parent().before(content.replace(regexp, new_id));
}



function agregar_incidencia_form () {
	var descripcion = $('.descripcion_incidencia');
	for (var i = descripcion.length - 1; i >= 0; i--){
		if (descripcion[i].value == '') {
			descripcion[i].parentNode.parentNode.parentNode.parentNode.style.display = "block";
			return false;
		}
	}
	$('#link_add a').trigger('click');
	return true;
}

function guardar_y_esconder (elem) {
	$(elem).fadeOut(500);
}

function slide_up(elem) {
	$(elem).slideUp(200);
}