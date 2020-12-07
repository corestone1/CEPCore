/*function showModalPop() {
	id, url, data, button, title, args) {
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
*/
$(document).on("keyup", "input:text[numberOnly]",function() {
	$(this).val($(this).val().replace(/[^0-9]/g,""));
});
/*
 * 숫자 필드 입력 function
 * 숫자만 입력 되도록 on("keyup", "input:text[amountOnly]
 * 해당 필드 클릭하면 숫자에서 컴마 제거 on("focus", "input:text[amountOnly]"
 * 해당 숫자에 3자리 마다 컴마 삽입 on("focusout", "input:text[amountOnly]"
 * input에 numberOnly 를 입력하면 해당 내용 적용.
 * ex) <input type="text" amountOnly placeholder="계약금액"  class="amount" />
 */
$(document).on("focus", "input:text[amountOnly]", function() {
	
    var x = $(this).val();
    x = removeCommas(x);
    $(this).val(x);
}).on("focusout", "input:text[amountOnly]",function() {
	
    var x = $(this).val();
    if(x && x.length > 0) {
        if(!$.isNumeric(x)) {
            x = x.replace(/[^0-9]/g,"");
        }
        x = addCommas(x);
        $(this).val(x);
    }
}).on("keyup", "input:text[amountOnly]",function() {
	
    $(this).val($(this).val().replace(/[^0-9]/g,""));
});

function addCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
 
//모든 콤마 제거
function removeCommas(x) {
    if(!x || x.length == 0) return "";
    else return x.split(",").join("");
}
/*
 * 시간분표시하기
 */
$(document).on("focus", "input:text[timeOnly]", function() {
	
    var x = $(this).val();
    x = removeColon(x);
    $(this).val(x);
}).on("focusout", "input:text[timeOnly]",function() {
	
    var x = $(this).val();
    if(x && x.length > 0) {
        if(!$.isNumeric(x)) {
            x = x.replace(/[^0-9]/g,"");
        }
        x = addColon(x);
        $(this).val(x);
    }
}).on("keyup", "input:text[timeOnly]",function() {
	$(this).val($(this).val().replace(/[^0-9]/g,"").substring(0,4));
});

//시간콜론 추가.
function addColon(x) {
    //return x.toString().substring(0,2)+":"+x.toString().substring(3,4)
	return x.toString().replace(/\B(?=(\d{2})+(?!\d))/g, ":");
}
 
//모든 콜론 제거
function removeColon(x) {
    if(!x || x.length == 0) return "";
    else return x.split(":").join("");
}

function addDateMinus(x) {
	if(!x || x.length == 0) return "";
	else x.replace(/(\d{4})(\d{2})(\d{2})/g, '$1-$2-$3');
}

function removeData(x, y) {
    if(!x || x.length == 0) return "";
    else return x.split(y).join("");
}

//날짜 하이픈(-) 자동 추가
function fn_date_format(e, oThis) {
    var num_arr = [ 
        97, 98, 99, 100, 101, 102, 103, 104, 105, 96,
        48, 49, 50, 51, 52, 53, 54, 55, 56, 57
    ]
    
    var key_code = ( e.which ) ? e.which : e.keyCode;
    if( num_arr.indexOf( Number( key_code ) ) != -1 ){
    
        var len = oThis.value.length;
        if( len == 4 ) oThis.value += "-";
        if( len == 7 ) oThis.value += "-";
    }
}

/* 추후 수정 필요
 * from날짜 이전 날짜는 to날짜에서 선택 못하도록, to날짜 이후 날짜는 from 날짜에서 선택 못하도록
 * */	
$(window).load(function() {
	
	$("body").delegate(".fromDt", "focusin", function(){
		$(this).datepicker({
			dateFormat: 'yy-mm-dd',
			changeMonth: true,
			changeYear: true,
			monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			numberOfMonths: 1,
			/*onSelect: function( selectedDate ) {
				$( ".toDt" ).datepicker( "option", "minDate", selectedDate );
				$(this).datepicker();
			}*/
		});
		$(this).attr('onkeyup','fn_date_format(event, this)');
		$(this).attr('onkeypress','fn_date_format(event, this)');
	});
	$("body").delegate(".toDt", "focusin", function(){
		$(this).datepicker({
			dateFormat: 'yy-mm-dd',
			changeMonth: true,
			changeYear: true,
			monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			numberOfMonths: 1,
			/*onSelect: function( selectedDate ) {
				$( ".fromDt" ).datepicker( "option", "maxDate", selectedDate );
				$(this).datepicker();
			}*/
	    });
		$(this).attr('onkeyup','fn_date_format(event, this)');
		$(this).attr('onkeypress','fn_date_format(event, this)');
	}); 
	
});
