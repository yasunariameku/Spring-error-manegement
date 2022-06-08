<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品詳細</title>
<link href="/css/commons.css" rel="stylesheet">
</head>
<body>

  <div class="header">
    <h1 class="site_logo"><a href="menu.jsp">エラー管理アプリ</a></h1>
    <div class="user">
      <p class="user_name">${name}さん、 こんにちは</p>
      <form class="logout_form" action="logout" method="get">
        <button class="logout_btn" type="submit">
          <img src="images/ドアアイコン.png">ログアウト</button>
      </form>
    </div>
  </div>

  <hr>

  <div class="update">
    <div class="form_body">
      <div class="img_block">
        <img src="images/マッキー.png" class="product_img"><br>
      </div>
      <form:form action="detail" method="post" modelAttribute="detail">
      <form:input path="id" type="hidden" name="id" value="${errorList.getId()}" readonly="readonly" class="base-text" />
      
        <fieldset class="label-130 product_block">
          <p class="error">エラーメッセージ</p>
          <div>
            <label>カテゴリ</label>
            <form:select path="category_Id" items="${categoryList}" itemValue="id" itemLabel="name"  class="base-text"></form:select>
          </div>
          <div>
            <label>出てきたエラー</label>
            <form:input path="errorList" type="text" name="product_id" value="${errorList.getErrorList()}" readonly="readonly" class="base-text" />
          </div>
          <div>
            <label>原因</label>
            <form:input path="cause" type="text" name="name" value="${errorList.getCause()}" readonly="readonly" class="base-text" />
          </div>
          <div>
            <label>解決策</label>
            <form:input path="solution" type="text" name="price" value="${errorList.getSolution()}" readonly="readonly" class="base-text" />
          </div>
        </fieldset>
        <div>
          <div class="btns">
            <input type="button" onclick="openModal()" value="削除" class="basic_btn">
            <input type="button" onclick="location.href='update?id=${errorList.getId()}'" value="編集" class="basic_btn">
            <input type="button" onclick="location.href='menu'" value="戻る" class="cancel_btn">
          </div>
          <div id="modal">
            <p class="modal_message">削除しますか？</p>
            <div class="btns">
              <button type="submit" name="delete" class="basic_btn">削除</button>
              <button type="button" onclick="closeModal()" class="cancel_btn">キャンセル</button>
            </div>
          </div>
        </div>
      </form:form>
    </div>
  </div>
  <div id="fadeLayer"></div>
</body>
</html>
<script src="./js/commons.js"></script>