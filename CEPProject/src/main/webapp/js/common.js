function showModalPop() {
	/*id, url, data, button, title, args) {*/
	modal_layer_add(id);
	
	var resizable = false;
	// Ajax Call
	sendRequestNoForm(url, data, function(html){
		$('#'+id).html(html);
	});
	
	// get the modal specs
	var mdattrs = args.split(";");
	for (i = 0; i < mdattrs.length; i++) {
		var mdattr = mdattrs[i].split(":");

		var n = mdattr[0];
		var v = mdattr[1];
		if (n) {
			n = n.trim().toLowerCase();
		}
		if (v) {
			v = v.trim().toLowerCase();
		}

		if (n == "height") {
			h = v.replace("px", "");
		} else if (n == "width") {
			w = v.replace("px", "");
		} else if (n == "resizable") {
			resizable = v;
		} else if (n == "scroll") {
			scroll = v;
		} else if (n == "status") {
			status = v;
		} else {
			// no-op
		}
	}
	
	$('#'+id).dialog({ //모달창 기본 스크립트 선언
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
	
	$('#'+id).dialog({ //개별 모달창 띄울 시 선택자 선언 및 크기 값 설정
		width: w,
		height: h,
		top:top,
		left:left
	});
}

function modal_layer_add(div_id) {
	if(div_id=="") {//지정한 레이어가 없을때
		var modal_defaults_pop = "<div id='modal_defaults_pop'></div>";
		if($("#modal_defaults_pop").length < 1) {//modal_defaults_pop 레이어가 없을때에는 BODY에 넣어준다
			$("body").prepend(modal_defaults_pop);
		}
	} else {//지정한 레이어가 있을때
		var modal_pop = "<div id='"+div_id+"'></div>";
		if($("#"+div_id).length < 1) {//해당하는 레이어가 없을때 BODY에 넣어준다
			$("body").prepend(modal_pop);
		}
	}
}