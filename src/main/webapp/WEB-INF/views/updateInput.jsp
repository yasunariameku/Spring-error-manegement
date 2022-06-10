<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>更新</title>
<link href="css/commons.css" rel="stylesheet">
</head>
<body>
  <div class="header">
    <h1 class="site_logo"><a href="menu.jsp">エラー管理アプリ</a></h1>
    <div class="user">
      <p class="user_name">${name}さん、 こんにちは</p>
      <form class="logout_form" action="logout.html" method="get">
        <button class="logout_btn" type="submit">
          <img src="images/ドアアイコン.png">ログアウト</button>
      </form>
    </div>
  </div>

  <hr>

  <div class="insert">
    <div class="form_body">
    <span class="error"><c:if test="${not empty msg}"><p class="error">${msg}</p></c:if></span>
      <form:form action="update" method="post" modelAttribute="update">
      <form:input path="id" type="hidden" name="id" value="${errorList.getId()}" readonly="readonly" class="base-text" />
      
        <fieldset class="label-130">
          <div>
            <label>カテゴリ</label>
            <form:select path="category_Id" items="${categoryList}" itemValue="id" itemLabel="name"  class="base-text"></form:select>
          </div>
          <div>
            <label>出てきたエラー</label>
            <form:input path="errorList" type="text" name="errorList" value="${errorList.getErrorList()}" class="base-text" />
            <form:errors path="errorList" cssStyle="color: red"/>            
          </div>
          <div>
            <label>原因</label>
            <form:input path="cause" type="text" name="cause" value="${errorList.getCause()}" class="base-text" />
            <form:errors path="cause" cssStyle="color: red"/>  
          </div>
          <div>
            <label>解決策</label>
            <form:input path="solution" type="text" name="solution" value="${errorList.getSolution()}" class="base-text" />
            <form:errors path="solution" cssStyle="color: red"/>
          </div>
          <div>
            <label>画像</label>
            <input type="file" name="file">
            <c:if test="${not empty msg}"><p class="error">${msg}</p></c:if>
          </div>
        </fieldset>
          <div class="btns">
            <button type="button" onclick="openModal()" class="basic_btn">更新</button>
            <input type="button" onclick="location.href='menu'" value="メニューに戻る" class="cancel_btn">
          </div>
          <div id="modal">
            <p class="modal_message">更新しますか？</p>
            <div class="btns">
              <form:button type="submit" name="update" class="basic_btn">更新</form:button>
              <button type="button" onclick="closeModal()" class="cancel_btn">キャンセル</button>
            </div>
          </div>
      </form:form>
    </div>
  </div>
  <div id="fadeLayer"></div>
</body>
</html>
<script src="./js/commons.js"></script>