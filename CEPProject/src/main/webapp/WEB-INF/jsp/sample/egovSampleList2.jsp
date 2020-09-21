<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/sample.css'/>"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
        	fn_egov_selectList();
        });
    </script>
</head>

<body style="text-align:center; margin:0 auto; display:inline; padding-top:100px;">
    <form:form commandName="searchVO" id="listForm" name="listForm" method="post">
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
	        				<th align="center">사용자ID</th>
	        				<th align="center">작성일자</th>
	        			</tr>
	        		</thead>
	        		<tbody></tbody>
        			<%-- 
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
        			</c:forEach> --%>
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
			<%-- <div id="paging">
        		<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_egov_link_page" />
        		<form:hidden path="pageIndex" />
        	</div> --%>
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
    </form:form>
</body>
</html>
