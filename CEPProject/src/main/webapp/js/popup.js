function showModalPop(id, url, data, button, title, args) {
   var w;
   var h;
   var resizable = "no";
   var scroll = "no";
   var status = "no";
   var ifram = false;
   var iframId ="";
   var reload = true;
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
      } else if(n == "ifram") {
         ifram = v;
      } else if(n == "iframid") {
         iframId = v;
      } else if(n == "reload") {
         reload = v;
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
      close: function(event) {
         //alert(id+"/args==>"+args+"/ifram==>"+ifram+"/iframId==>"+iframId+"/reload==>"+reload);
         if(confirm('나가시겠습니까? 변경사항이 저장되지 않을 수 있습니다.')) {
            $('.ui-widget-overlay').removeClass('custom-overlay');
            $('#'+id).remove();
            if(reload) {
               if(ifram) {
                  document.getElementById(iframId).contentDocument.location.reload(true);
               } else {
                  location.reload();
               }
               
            }
            
         } else {
             $(this).dialog("open");
         }
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