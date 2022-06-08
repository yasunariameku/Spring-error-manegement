<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品登録</title>
<link href="css/commons.css" rel="stylesheet">
</head>
<body>

  <div class="header">
    <h1 class="site_logo"><a href="menu.html">エラー登録</a></h1>
    <div class="user">
      <p class="user_name">${name}さん、こんにちは</p>
      <form class="logout_form" action="logout.html" method="get">
        <button class="logout_btn" type="submit">
          <img src="images/ドアアイコン.png">ログアウト</button>
      </form>
    </div>
  </div>

  <hr>
  
  <div class="insert">
    <div class="discription">
      <p>
        登録情報を入力してください（<span class="required"></span>は必須です）
      </p>
    </div>
  
    <div class="form_body">
    
      <c:if test="${not empty msg}"><p class="error">${msg}</p></c:if>
      
      <form:form action="insert" method="post" modelAttribute="errorListForm">
        <fieldset class="label-130">
          <div>
          <div class="select_block">
            <label class="required">カテゴリ</label>
            <form:select path="category_Id" items="${categoryList}" itemValue="id" itemLabel="name"  class="base-text"></form:select>
          </div>
            <label class="required">出たきたエラー</label>
            <form:input path="errorList" type="text" class="base-text" />
            <form:errors path="errorList" cssStyle="color: red"/>
          </div>
          <div>
            <label class="required">原因</label>
            <form:input path="cause" type="text" class="base-text" />
            <form:errors path="cause" cssStyle="color: red"/>
          </div>
          <div>
            <label class="required">解決策</label>
            <form:input path="solution" type="text" class="base-text" />
            <form:errors path="solution" cssStyle="color: red"/>            
          </div>
          <div>
            <label>画像</label>
            <input  type="file" name="file" />
            <!-- <span class="error">エラーメッセージ</span> -->
          </div>
        </fieldset>
        <div class="btns">
          <form:button type="button" onclick="openModal()" class="basic_btn">登録</form:button>
          <input type="button" onclick="location.href='menu'" value="戻る" class="cancel_btn">
        </div>
        <div id="modal">
          <p class="modal_message">登録しますか？</p>
          <div class="btns">
            <form:button type="submit" class="basic_btn">登録</form:button>
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