<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
  /**
  * @Class Name : egovSampleList.jsp
  * @Description : Sample List 화면
  * @Modification Information
  *
  *   수정일         수정자                   수정내용
  *  -------    --------    ---------------------------
  *  2009.02.01            최초 생성
  *
  * author 실행환경 개발팀
  * since 2009.02.01
  *
  * Copyright (C) 2009 by MOPAS  All right reserved.
  */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title><spring:message code="title.sample" /></title>
    <%-- <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/sample.css'/>"/> --%>
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="<c:url value='/js/popup.js'/>"></script>
	<script src="<c:url value='/js/common.js'/>"></script>
	<script src="<c:url value='/js/file.js'/>"></script>
	<script src="<c:url value='/js/jquery.fileDownload.js'/>"></script>
    <script type="text/javaScript" language="javascript" defer="defer">
        
        /* 글 수정 화면 function */
        function fn_egov_select(seq) {
        	document.listForm.selectedId.value = seq;
           	document.listForm.action = "<c:url value='/updateSampleView.do'/>";
           	document.listForm.submit();
        }
        
        /* 글 등록 화면 function */
        function fn_egov_addView() {
           /* 	document.listForm.action = "<c:url value='/addSample.do'/>";
           	document.listForm.submit(); */
           	location.href="<c:url value='/addSample.do'/>";
        }
        
        /* pagination 페이지 링크 function */
        function fn_egov_link_page(pageNo){
        	document.listForm.pageIndex.value = pageNo;
        	document.listForm.action = "<c:url value='/egovSampleList.do'/>";
           	document.listForm.submit();
        }
        
        function fn_egov_selectList() {
	        var html = '';
	        var page = '';
	        $.ajax({
	        	url: "/egovSampleList.do",
	        	type: "POST",
	        	data: JSON.stringify({searchKeyword:$('#searchKeyword').val(), searchCondition: $("#searchCondition").val()}),
	        	dataType: "json",
	        	contentType: "application/json; charset=UTF-8",
	        
	        	beforeSend: function(xhr) {
	        		xhr.setRequestHeader("AJAX", true);
	        		//xhr.setRequestHeader(header, token);
	        	},
	        	success: function(response) {
	        		if(response != null && response.resultCode == 'SUCC') {
	        			for(i = 0; i < response.resultList.length; i++) {
	        				console.log(response.paginationInfo);
							html += '<tr>'
					        				+ '<td align="center" class="listtd">'+ response.resultList[i].seq +'</td>'
				        					+ '<td align="center" class="listtd"><a href="javascript:fn_egov_select('+ response.resultList[i].seq +')">'+ response.resultList[i].title +'</a></td>'
				            				+ '<td align="left" class="listtd">'+ response.resultList[i].content +'&nbsp;</td>'
				            				+ '<td align="center" class="listtd">'+ response.resultList[i].username +'&nbsp;</td>'
				            				+ '<td align="center" class="listtd">'+ response.resultList[i].userid +'&nbsp;</td>'
				            				+ '<td align="center" class="listtd">'+ response.resultList[i].createdt +'&nbsp;</td>'
			            				+ '</tr>'
						}
						$('#table table tbody').html('');
						$('#table table tbody').append(html);
	        		}	
	        	},
	        	error: function(request, status, error) {
	        		if(request.status != '0') {
	        			alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
	        		}
	        	}
	        });
        }
        
        $(document).ready(function() {
        	
       		$("#save").click(function() {
       			/* var formData = new FormData($('#fileForm')[0]);  */
       			var existFileNum = $('#atchFileCnt').val();        
				var maxFileNum = $('#maxFileCnt').val();
				
				if(existFileNum == maxFileNum) {
					alert('첨부 가능 최대 개수를 초과했습니다.\n 최대 개수 : '+maxFileNum+'개');
				} else {
	       			var formData = new FormData($('#fileForm')[0]); 
	       			$.ajax({ 
	       				type: "POST", 
	       				enctype: 'multipart/form-data',  
	       				url: '/file/upload.do', 
	       				data: formData, // 필수 
	       				processData: false, // 필수 
	       				contentType: false, // 필수 
	       				cache: false, 
	       				success: function (response) { 
	       					if(response.successYN=='Y') {
	       						alert('저장되었습니다.');
	       					}
	       				}, 
	       				error: function(request, status, error) {
	       					if(request.status != '0') {
	       						alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
	       					}
	       				}
	       			});
				}
       		});
       		
       		$("#add").click(function() {
       			if($('input[type=file]').length) {
       				var index = $('input[type=file]').last().attr('name').replace(/[^0-9]/g,'');
       			} else {
       				var index = 0;
       			}
       			/* $(".uploadContainer").append('<br /><input type="file" name="file'+(Number(index)+1)+'" multiple="multiple" />'); */
       		});
       		
        });
        
        function fn_downFile(fileKey, fileOrgNm) {
			var form = document.viewForm;
			form.fileKey.value = fileKey;
			form.fileOrgNm.value = fileOrgNm; 
			var data = $('#viewForm').serialize();
			fileDownload("<c:url value='/file/download.do'/>", data);  
		}
        
        function fn_deleteFile(fileKey) {
			var form = document.viewForm;
			form.fileKey.value = fileKey;
			var data = JSON.stringify({"fileKey":fileKey});
			$.ajax({ 
   				url: '/file/delete.do', 
   				dataType:'json',
   				type: "POST", 
   				data: data, // 필수 
   				contentType: "application/json; charset=UTF-8", 
   				success: function (response) { 
	   				if(response.successYN=='Y') {
						alert('삭제되었습니다.');
					} else {
						alert('삭제 실패');
					}
   				},
   				error: function(request, status, error) {
   					if(request.status != '0') {
   						alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
   					}
   				}
   			});
		}
    </script>
</head>

<body style="text-align:center; margin:0 auto; display:inline; padding-top:100px;">
    <%-- <form:form commandName="searchVO" id="listForm" name="listForm" method="post">
        <input type="hidden" name="selectedId" />
        <div id="content_pop">
        	<!-- 타이틀 -->
        	<div id="title">
        		<ul>
        			<li><img src="<c:url value='/images/egovframework/example/title_dot.gif'/>" alt=""/><spring:message code="list.sample" /></li>
        		</ul>
        	</div>
        	<!-- // 타이틀 -->
        	<div id="search">
        		<ul>
        			<li>
        			    <label for="searchCondition" style="visibility:hidden;"><spring:message code="search.choose" /></label>
        				<select id="searchCondition"  name="searchCondition">
        					<option value="1" label="제목" />
        					<option value="0" label="사용자이름" />
        				</select>
        			</li>
        			<li>
        				<label for="searchKeyword" style="visibility:hidden;display:none;"><spring:message code="search.keyword" /></label>
                        <input type="text" id="searchKeyword" name="searchKeyword"/>
                    </li>
        			<li>
        	            <span class="btn_blue_l">
        	                <a href="javascript:fn_egov_selectList();"><spring:message code="button.search" /></a>
        	                <img src="<c:url value='/images/egovframework/example/btn_bg_r.gif'/>" style="margin-left:6px;" alt=""/>
        	            </span>
        	        </li> 
                </ul>
        	</div>
        	<!-- List -->
        	<div id="table">
        		<table width="100%" border="0" cellpadding="0" cellspacing="0" >
        			<caption style="visibility:hidden"></caption>
        			<colgroup>
        				<col width="40"/>
        				<col width="100"/>
        				<col width="250"/>
        				<col width="60"/>
        				<col width="?"/>
        				<col width="100"/>
        			</colgroup>
        			<thead>
	        			<tr>
	        				<th align="center">No</th>
	        				<th align="center">제목</th>
	        				<th align="center">내용</th>
	        				<th align="center">사용자이름</th>
	        				<th align="center">사용자IDdd</th>
	        				<th align="center">작성일자</th>
	        			</tr>
	        		</thead>
	        		<tbody></tbody>
        			
        			<c:forEach var="result" items="${resultList}" varStatus="status">
            			<tr>
            				<td align="center" class="listtd">
            					<c:out value="${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageSize + status.count)}"/>
            					<c:out value="${result.seq}"/>
            				</td>
            				<td align="center" class="listtd"><a href="javascript:fn_egov_select('<c:out value="${result.seq}"/>')"><c:out value="${result.title}"/></a></td>
            				<td align="left" class="listtd"><c:out value="${result.content}"/>&nbsp;</td>
            				<td align="center" class="listtd"><c:out value="${result.username}"/>&nbsp;</td>
            				<td align="center" class="listtd"><c:out value="${result.userid}"/>&nbsp;</td>
            				<td align="center" class="listtd"><c:out value="${result.createdt}"/>&nbsp;</td>
            			</tr>
        			</c:forEach>
        		</table> 
        	</div>
        	<!-- /List -->
        	<div id="paging">
				<c:if test="${paginationInfo.prev}">
					<a href="${paginationInfo.startPage - 1 }">이전</a>
				</c:if>
				<c:forEach var="num" begin="${paginationInfo.firstPageNo}" end="${paginationInfo.lastPageNo }">
					&nbsp;<a href="${paginationInfo.firstPageNo }">${paginationInfo.firstPageNo }</a>&nbsp;
				</c:forEach>
				<p><c:out value="${paginationInfo.firstPageNo}">${paginationInfo.firstPageNo}</c:out></p>
				<c:if test="${paginationInfo.next}">
					<a id="next" href="${paginationInfo.endPage + 1 }">다음</a>
				</c:if>
			</div>
			<form id="pagingFrm" name="pagingForm" action="getBoardList.do" method="get">
				<input type="hidden" id="pageNum" name="pageNum" value="${paginationInfo.cri.pageNum }"/>
				<input type="hidden" id="amount" name="amount" value="${paginationInfo.cri.amount }"/>
			</form> 
			<div id="paging">
        		<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_egov_link_page" />
        		<form:hidden path="pageIndex" />
        	</div>
        	<div id="sysbtn">
        	  <ul>
        	      <li>
        	          <span class="btn_blue_l">
        	              <a href="javascript:fn_egov_addView();"><spring:message code="button.create" /></a>
                          <img src="<c:url value='/images/egovframework/example/btn_bg_r.gif'/>" style="margin-left:6px;" alt=""/>
                      </span>
                  </li>
              </ul> 
        	</div>
        </div>
    </form:form> --%>
    <form id="fileForm" method="post" enctype="multipart/form-data" style="position: absolute; top: 200px;"> 
    	<button type="button" id="add" style="border: 1px solid #000; padding: 5px 10px; ">추가</button><br />
		<input type="hidden" name="docTypeNm" value="${projectVO.workClass}" />
		<input type="hidden" name="fileCtKey" value="${projectVO.pjKey}" />
		<input type="hidden" name="pjNm" value="${resultList.pjNm }"/>
		<input type="hidden" name="atchFileCnt" id="atchFileCnt" title="첨부된갯수" value="${fn:length(fileList)}" />
		<input type="hidden" name="maxFileCnt" id="maxFileCnt" title="첨부가능최대갯수" value="<c:out value='${maxFileCnt}'/>" />
		<input type="hidden" name="maxFileSize" id="maxFileSize" title="파일사이즈" value="<c:out value='${maxFileSize}'/>" />
		<c:forEach var="result" items="${fileList }" varStatus="status">
			<input class="upload-name" value="<c:out value="${result.fileOrgNm}"/>" onclick="fn_downFile('<c:out value="${result.fileKey}"/>', '<c:out value="${result.fileOrgNm}"/>')" readonly/>
			<a class="close" onclick="fn_deleteFile('<c:out value="${result.fileKey}"/>')">x</a>
			<c:if test="${status.last eq false}"><br /></c:if>
		</c:forEach>
		<div class="uploadContainer"><input type="file" name="file" multiple="multiple" /></div>
		<button type="button" id="save" style="border: 1px solid #000; padding: 5px 10px;">저장</button>
	</form>
	<form:form id="viewForm" name="viewForm" method="POST">
		<input type="hidden" name="fileKey" value=""/>
		<input type="hidden" name="fileOrgNm" value=""/>
	</form:form>
</body>
</html>
