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
	var returnValue;
	if(!x || x.length == 0) {
		returnValue =  x;
	} else {
		returnValue = x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	return returnValue;
}
 
//모든 콤마 제거
function removeCommas(x) {
	var returnValue;
    if(!x || x.length == 0) {
    	returnValue= "";
    } else {
    	returnValue = x.split(",").join("");
    }
	return returnValue;
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
	var returnValue;
	if(!x || x.length == 0) {
		returnValue =  x;
	} else {
		returnValue = x.toString().replace(/\B(?=(\d{2})+(?!\d))/g, ":");
	}
	return returnValue;
}
 
//모든 콜론 제거
function removeColon(x) {
	var returnValue;
    if(!x || x.length == 0) {
    	returnValue= x;
    } else {
    	returnValue = x.split(":").join("");
    }
	return returnValue;
}

function addDateMinus(x) {	
	var returnValue;
	if(!x || x.length == 0) {
		returnValue =  x;
	} else {
		returnValue = x.toString().replace(/(\d{4})(\d{2})(\d{2})/g, '$1-$2-$3');
	}
	return returnValue;
}

function removeData(x, y) {
	var returnValue;
    if(!x || x.length == 0) {
    	returnValue = x;
    }
    else {
    	returnValue = x.split(y).join("");
    }
    return returnValue;
}

//접기
function fn_viewSummaryUpAll(){
	$(".dpTbRow").attr('class','dpNone');
	$(".down").attr('class','up');
	//$(".up").attr('src','<c:url value="/images/arrow_down.png"/>');
	$(".up").attr('src','/images/arrow_down.png');
}

// 펴기
function fn_viewSummaryDownAll(){
	$(".dpNone").attr('class','dpTbRow');
	$(".up").attr('class','down');
	//$(".down").attr('src','<c:url value="/images/arrow_up.png"/>');
	$(".down").attr('src','/images/arrow_up.png');
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

//자바 스크립트로 파라미터 받기
function getParameter(name) {
	var params = location.search.substr(location.search.indexOf("?") + 1);
	var newVal = "";
	
	params = params.split("&");
	for(var i = 0; i < params.length; i++) {
		temp = params[i].split("=");
		if([temp[0]] == name) { 
			newVal = temp[1];
		}
	}
	
	return newVal;
}

/*
 * hidden값 또는 readonly필드에서 값이 변경하면 이벤트 발생 시키는 function
 * ex) mtLinkCtKey필드의 값이 변경되면 아래 function호출됨.
 * survey('#mtLinkCtKey', function(){
 * 	console.log('changed');
 *  이벤트 발생시 원하는 로직 구현
 * });
 */
/*function survey(selector, callback) {
	var input = $(selector);
	var oldvalue = input.val();
	setInterval(function(){
		if (input.val()!=oldvalue){
			console.log("00000000000000000======================");
			oldvalue = input.val();
			callback();
		}
		console.log("111111======================");
	}, 400);
}*/	
	
/* 추후 수정 필요
 * from날짜 이전 날짜는 to날짜에서 선택 못하도록, to날짜 이후 날짜는 from 날짜에서 선택 못하도록
 * */	
$(window).load(function() {
	
	/*$("body").delegate(".fromDt", "focusin", function(){
		$(this).datepicker({
			dateFormat: 'yy-mm-dd',
			changeMonth: true,
			changeYear: true,
			monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			numberOfMonths: 1,
			onSelect: function( selectedDate ) {
				$( ".toDt" ).datepicker( "option", "minDate", selectedDate );
				$(this).datepicker();
			}
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
			onSelect: function( selectedDate ) {
				$( ".fromDt" ).datepicker( "option", "maxDate", selectedDate );
				$(this).datepicker();
			}
	    });
		$(this).attr('onkeyup','fn_date_format(event, this)');
		$(this).attr('onkeypress','fn_date_format(event, this)');
	}); */
	
   $("body").delegate(".calendar", "focusin", function() {
      $(this).removeClass('hasDatepicker').datepicker({
         dateFormat: 'yy-mm-dd',
         changeMonth: true,
         changeYear: true,
         monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
         numberOfMonths: 1,
         onSelect: function( selectedDate ) {
            //$( ".fromDt" ).datepicker( "option", "maxDate", selectedDate );
            $(this).datepicker();
         }
       });
      $(this).attr('onkeyup','fn_date_format(event, this)');
      $(this).attr('onkeypress','fn_date_format(event, this)');
	      
   	});
	
	/* 리스트 클릭하면 색깔 칠하기.*/
	$('.middle table tbody tr').children().click(function() {
		//alert(111);
		//해당 tbody의 tr의 class값 제거.
		$(".middle table tbody tr").removeClass("trcheckcolor");
		//$(".middle table tbody tr").parent().css("background", "red");
		//$(this).css("background", "red");
		//$(".middle table tbody").children().children().css("background", "red");
		  //선택된 tr의 배경색을 변경
		//$(".middle table tbody tr").addClass("truncheckcolor");
		
		$(this).parent().addClass("trcheckcolor");
	});
	
	$('.submiddle table tbody tr').children().click(function() {
		
		//해당 tbody의 tr의 class값 제거.
		$(".submiddle table tbody tr").removeClass("trcheckcolor");
		
		$(this).parent().addClass("trcheckcolor");
	});
	

	/* 두줄 색칠하기 */
	$('.middle2 table tbody tr').children().click(function() {
		//해당 tbody의 tr의 class값 제거.
		$(".middle2 table tbody tr").removeClass("trcheckcolor");
		
		$(this).parent().addClass("trcheckcolor");
		$(this).parent().prev().addClass("trcheckcolor");
		$(this).parent().next().addClass("trcheckcolor");
	});
	
	$("#excelExport").click(function() {
		exportExcel($(document).find("title").text());
	});
});

function itoStr($num) {
	$num < 10 ? $num = '0'+$num : $num;
	return $num.toString();
}

// Excel export
function exportExcel(pageTitle) { 
	var dt = new Date();
	var year =	itoStr( dt.getFullYear() );
	var month = itoStr( dt.getMonth() + 1 );
	var day =	itoStr( dt.getDate() );
	var hour =	itoStr( dt.getHours() );
	var mins =	itoStr( dt.getMinutes() );

	var postfix = year + month + day + "_" + hour + mins;
	var fileName = pageTitle+"_"+ postfix;

	var excelHandler = {
	    getExcelFileName : function(){
	        return fileName + '.xlsx';	//파일명
	    },
	    getSheetName : function(){
	        return pageTitle;	//시트명
	    },
	    getExcelData : function(){
	        return document.getElementsByClassName('excelSheet')[0]; 	//TABLE id
	    },
	    getWorksheet : function(){
	        return XLSX.utils.table_to_sheet(this.getExcelData());
	    }
	}
	
	var wb = XLSX.utils.book_new();
	var newWorksheet = excelHandler.getWorksheet();
	
	XLSX.utils.book_append_sheet(wb, newWorksheet, excelHandler.getSheetName());
	
	var wbout = XLSX.write(wb, {bookType:'xlsx',  type: 'binary'});
	saveAs(new Blob([s2ab(wbout)],{type:"application/octet-stream"}), excelHandler.getExcelFileName());
}


function s2ab(s) { 
  var buf = new ArrayBuffer(s.length); 
  var view = new Uint8Array(buf);  
  for (var i=0; i<s.length; i++) view[i] = s.charCodeAt(i) & 0xFF;
  return buf;    
}
