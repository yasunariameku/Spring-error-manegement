<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ログイン</title>
<link href="css/commons.css" rel="stylesheet">
</head>
<body class="login_body">
  <div class="header">
    <h1 class="site_logo">自分の出したエラー記録</h1>
  </div>

  <div class="login_form">
    <img src="./images/logo.png" class="login_logo">
    <p class="error">
    <c:if test="${not empty errorMsg}">
  	<p class="error">${errorMsg}</p>
    </c:if>
    </p>

    <form:form action="login" modelAttribute="login">
      <fieldset>
        <div class="cp_iptxt">
          <form:input path="loginId" class="base_input" type="text" placeholder="ID" />
          <form:errors path="loginId" cssStyle="color: red"/>
          <i class="fa fa-user fa-lg fa-fw" aria-hidden="true"></i>
        </div>

        <div>
          <form:input path="password" class="base_input" type="password" placeholder="PASS" />
          <form:errors path="password" cssStyle="color: red"/>
        </div>
      </fieldset>
      <form:button class="logout_btn" type="submit">ログイン</form:button>
    </form:form>
  </div>
</body>
</html>