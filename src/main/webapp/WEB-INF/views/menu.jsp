<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>メニュー</title>
<link href="css/commons.css" rel="stylesheet">
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
</head>
<body>
  <div id="app">

    <div class="header">
      <h1 class="site_logo"><a href="menu.jsp">商品管理システム</a></h1>
      <div class="user">
        <p class="user_name">${name}さん、 こんにちは</p>
        <form class="logout_form" action="logout" method="get">
          <button class="logout_btn" type="submit">
            <img src="images/ドアアイコン.png">ログアウト</button>
        </form>
      </div>
    </div>

    <hr>

    <div class="btn"><a class="basic_btn regist" href="insert">新規登録</a></div>
    <c:if test="${not empty msg}"><p class="error">${msg}</p></c:if>
    
    <!-- 検索機能 -->
    <form action="/search" method="get" class="search_container">
      <input name="search" type="text" size="25" value="" placeholder="キーワード検索" />
      <button type="submit">検索</button> 
    </form>
    
	<!-- 並び替え機能 -->
     <form action="/sort" method="get">
	     <div class="order">
	       <select class="base-text"name ="sort">
	         <option value="nomal">並び替え</option>
	         <option value="id">商品ID</option>
	         <option value="category">カテゴリ</option>
	         <option value="price_asc">単価：高い順</option>
	         <option value="price_desc">単価：安い順</option>
	       </select>
	       <button type="submit">並び替え</button> 
	     </div>
     </form>
     
    <table>
        <div class="caption"><p>検索結果：${result.size()}件</p></div>
      <thead>
        <tr>
          <th>商品ID</th>
          <th>商品名</th>
          <th>単価</th>
          <th>カテゴリ</th>
          <th>詳細</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="result" items="${result}" >
          <tr>
            <td><c:out value="${result.getProduct_id()}"/></td>
            <td><c:out value="${result.getName()}"/></td>
            <td><c:out value="${result.getPrice()}"/></td>
            <td><c:out value="${result.getCategory()}"/></td>
            <td><a class="detail_btn" href="detail?id=${result.getId()}">詳細</a></td>
          </tr>
		</c:forEach>
      </tbody>
    </table>
  </div>
  <footer></footer>  

  <script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>
  <script>
    const vie = new Vue({
      el: "#app",
      data: {
    	selected:"",
        products: [
          {
            ID: "10001",
            name: "マッキー(黒)",
            price: 160,
            category: "筆記具",
          },
          {
            ID: "10002",
            name: "電卓",
            price: 935,
            category: "オフィス機器",
          },
          {
            ID: "10003",
            name: "ホッチキス芯",
            price: 220,
            category: "事務消耗品",
          },
          {
            ID: "10004",
            name: "Campus(5冊組)",
            price: 220,
            category: "紙製品",
          },
          {
            ID: "10005",
            name: "地球儀",
            price: 160,
            category: "雑貨",
          },
          {
            ID: "10006",
            name: "ロジカルノート(5冊組)",
            price: 386,
            category: "紙製品",
          },
          {
            ID: "10007",
            name: "レジスター",
            price: 130,
            category: "オフィス用品",
          },
          {
            ID: "10008",
            name: "カドケシ",
            price: 150,
            category: "筆記具",
          },
          {
            ID: "10009",
            name: "アラビックヤマト",
            price: 200,
            category: "事務用品",
          },
          {
            ID: "10010",
            name: "粘土",
            price: 160,
            category: "雑貨",
          },
        ]
      },
      methods: {
    	  selectedOrderBy() {
    		  if(this.selected === "product_id"){
    			  this.products.sort((e1, e2) => e1.ID >= e2.ID ? 1 : -1);
    		  }else if (selected === "price_asc") {
    			  this.products.sort((e1, e2) => e1.price - e2.price);
    		  }else if (selected === "price_desc"){
    			  this.products.sort((e1, e2) => e2.price - e1.price);
    		  }
    	  }
      }
    })

  </script>
</body>
</html>