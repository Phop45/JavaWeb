<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Navbar</title>
<link rel="stylesheet" href="css/nav.css">
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>
	<div class="sidebar close">
        <header>
            <div class="image-text">
                <span class="image">
                    <img src="images/Black White Modern Luxury Logo.png" alt="User Profile">
                </span>
    
                <div class="text header-text">
                    <span class="name">สวัสดีคุณ <%= session.getAttribute("name") %> </span>
                </div>
            </div>
        </header>
    
        <div class="menu-bar">
            <div class="menu">
                <li class="search-box">
                    <i class="bx bx-search icon"></i>
                    <form method="POST" action="/dashboard/search" role="search">
                        <input type="search" placeholder="ค้นหา">
                    </form>
                </li>
                
                <ul class="menu-link">
                    <li class="nav-links">
                        <button class="add-btn">
                            <i class='bx bx-plus'></i>
                            เพิ่มโน็ตใหม่
                        </button>
                    </li>

                    <li class="nav-links">
                        <a href="Dashboard.html">
                            <i class='bx bxs-star icon'></i>
                            <span class="text navbar-text">ติดดาว</span>
                        </a>
                    </li>
    
                    <li class="nav-links">
                        <a href="/task">
                            <i class='bx bxs-trash-alt icon'></i>
                            <span class="text navbar-text">กู้คืน</span>
                        </a>
                    </li>

                    <li class="nav-links">
                        <a href="logout">
                            <i class='bx bx-log-out icon'></i>
                            <span class="text navbar-text">ออกจากระบบ</span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</body>
</html>