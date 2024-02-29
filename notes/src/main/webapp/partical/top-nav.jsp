<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Top Nav</title>
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
<link rel="stylesheet" href="css/top-nav.css">
</head>
<body>
	<div class="top">
        <!-- searchBox start -->
        <div class="searchBox">
            <h2>Kare Notes</h2>
            <div class="inputBox">
              <form action="/note/search" role="search" method="POST">
                  <i class='bx bx-search'></i>
                  <input type="search" name="searchTerm" placeholder="ค้นหา...">
              </form>
            </div>
        </div>
        <!-- searchBox end -->
      
        <!-- user start -->
        <div class="user">
            <a href="logout" type="button" class="btn-logout"><i class='bx bx-log-out'></i></a>
        </div>
        <!-- user end -->
    </div>
</body>
</html>