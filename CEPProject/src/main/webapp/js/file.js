function fileValidation(element){
	var extSplit = $("#fileExtn").val().split(",");
	var extArr = new Array();
	for(var i=0; i<extSplit.length; i++){
		extArr.push(extSplit[i].toLowerCase());
	}
	
	if(!value.string.isEmpty(element.value)){
		// 확장자 체크
		var ext = element.value.split(".").pop().toLowerCase();
		var fileExtn = $("#fileExtn").val();
		if($.inArray(ext, extArr) == -1){
			alert("[" +fileExtn+"]파일만 업로드 해 주십시오.");
			element.value = "";
			return false;
		}
		
		// 용량 체크
		var fileSize = element.files[0].size;
		var maxSize = $('#maxFileSize').val();
		if(fileSize > maxSize){
			maxSize = maxSize / (1024*1024);
			alert("파일용량 "+maxSize+"MB을 초과했습니다.");
			element.value = "";
			return false;
		}
	}
	
	return true;
}