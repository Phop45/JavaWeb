<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	if (session.getAttribute("name")==null){
		response.sendRedirect("login.jsp");
	}
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>login</title>
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
<link rel="stylesheet" href="css/top-nav.css">
<link rel="stylesheet" href="css/popup.css">
<link rel="stylesheet" href="css/index.css">
</head>

<body>
	<%@ include file="partical/navbar.jsp" %>
	<%@ include file="partical/top-nav.jsp" %>
	<%@ include file="partical/popup.jsp" %>
	
	<!-- content -->
    <div class="contant">
        <div class="row head">
            <div class="col">
                <h1 style="font-weight: 500; color: #707070;">โน็ตทั้งหมด</h1>
            </div>
        </div>
    </div>
    <!-- content -->
	
	 
	 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
    	<script src="js/popup.js"></script>
</body>
</html>