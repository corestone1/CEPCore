function showModalPop(id, url, data, button, title, args) {
	var w;
	var h;
	var resizable = "no";
	var scroll = "no";
	var status = "no";

	modal_layer_add(id);

	$.ajax ({
		type: "GET",
		url: url,
		data: data,
		success: function(response) {
			$('#'+id).html(response);
		}
	});

	var resizable = false;

	var mdattrs = args.split(";");

	for(i = 0; i < mdattrs.length; i++) {
		var mdattr = mdattrs[i].split(":");

		var n = mdattr[0];
		var v = mdattr[1];
		
		if(n) {
			n = n.trim().toLowerCase();
		}
		if(v) {
			v = v.trim().toLowerCase();
		}
		if(n == "height") {
			h = v.replace("px","");
		} else if(n == "width") {
			w = v.replace("px","");
		} else if(n == "resizable") {
			resizable = v;
		} else if(n == "scroll") {
			scroll = v;
		} else if(n == "status") {
			status = v;
		} else {

		}
	}


	$('#'+id).dialog({
		resizable: resizable,
		modal: true,
		title: title,
		open: function() {
			$('.ui-widget-overlay').addClass('custom-overlay');
		},
		close: function() {
			$('.ui-widget-overlay').removeClass('custom-overlay');
			$('#'+id).remove();
		},
		buttons: button
	});

	var left = window.screenX + (window.outerWidth / 2) - (w / 2);
	var top = window.screenY + (window.outerHeight / 2) - (h / 2);

	$('#'+id).dialog({
		width: w,
		height: h,
		top: top,
		left: left
	});
}

function modal_layer_add(div_id) {
	if(div_id == "") {
		var modal_defaults_pop = "<div id='modal_defaults_pop'></div>";
		if($("#modal_defaults_pop").length < 1) {
			$("body").prepend(modal_defaults_pop);
		}
	} else {
		var modal_pop = "<div id='" + div_id + "'><div>";
		if($("#"+div_id).length < 1) {
			$("body").prepend(modal_pop);
		}
	}
}