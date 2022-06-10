<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>メニュー</title>
<link href="css/commons.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
</head>
<body class="body">
<div id="app">

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

  <hr class="border">
  
  <c:if test="${not empty msg}"><p class="error">${msg}</p></c:if>
  
  <div class="flex">
  
	  <div class="btn ">
	  	<a class="basic_btn regist" href="insert">新規登録</a>
	  </div>
	  
	  <!-- 検索機能 -->
	  <form action="/search" method="get" class="search_container">
	    <input name="keyword" type="text" size="25"  placeholder="キーワード検索" />
	    <input type="submit" value="&#xf002">
	  </form>
	    
	<!-- 並び替え機能 -->
	  <form action="/sort" method="get">
	   <div class="order">
	    <select name ="sort" class="form-select" aria-label="Default select example">
	       <option value="nomal">並び替え</option>
	       <option value="id">商品ID</option>
	       <option value="category">カテゴリ</option>
	       <option value="price_asc">単価：高い順</option>
	       <option value="price_desc">単価：安い順</option>
	     </select>
	   </div>
	  </form>
  
  </div>


	<div>
		<div class="caption">
			<p>検索結果：${errorList.size()}件</p>
		</div>
	
		<div class="row row-cols-1 row-cols-md-3 g-4">
			<c:forEach var="el" items="${errorList}">
				<div class="col">
					<div class="card h-100" style="width: 18rem;">
						<div class="card-body">
							<h5 class="card-title"><c:out value="${el.getCategory().getName()}" /></h5>
							<p class="card-text"><c:out value="${el.getErrorList()}" /></p>
							<a class="btn btn-primary" href="detail?id=${el.getId()}">詳細</a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
<%-- 
	<table>
      <div class="caption"><p>検索結果：${errorList.size()}件</p></div>
      <thead>
        <tr>
          <th>カテゴリ</th>
          <th>エラーリスト</th>
          <th>詳細</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="el" items="${errorList}" >
          <tr>
            <td><c:out value="${el.getCategory().getName()}"/></td>
            <td><c:out value="${el.getErrorList()}"/></td>
            <td><a class="detail_btn" href="detail?id=${el.getId()}">詳細</a></td>
          </tr>
		</c:forEach>
      </tbody>
    </table> --%>
    
	  <%-- <div class="caption"><p>検索結果：${errorList.size()}件</p></div>
	    <div class="row row-cols-1 row-cols-md-2 g-4">
   		<c:forEach var="el" items="${errorList}">
		  <div class="col">
		   <!-- <div class="card-group"> -->
		     <div class="card">
		      <div class="card-body">
		       <h5 class="card-title">Card title</h5>
		       <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
		      </div>
		     </div>
		   </div>
		  </c:forEach>
		  </div>
	    </div>
	<!-- </div> -->
  <footer></footer>   --%>

</body>
</html>