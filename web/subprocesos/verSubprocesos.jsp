<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<option value=""></option>
<c:forEach items="${subprocesos}" var="subproceso">
    <option value="${subproceso.idsubproceso}">${subproceso.subproceso}</option>
</c:forEach>