<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<% Throwable ex = (Throwable)request.getAttribute("exception");%>
<script type="text/javascript">
function fn_goAfterErrorPage(){
    history.back(-2);
}
</script>
<div class="content_header">
	<h3 class="floatL">알 수 없는 오류가 발생했습니다. EgovError Page</h3>
	<div class="btn_wrap">
	</div>
</div>
<div>
	에러 스택 추적 정보<br/>
	<% ex.printStackTrace(new java.io.PrintWriter(out)); %>
</div>
<div><a href="#LINK" onclick="javascript:fn_goAfterErrorPage(); return false;">이전화면 이동</a></div>
            
