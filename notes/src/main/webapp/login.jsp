<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>login</title>
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css">
<link rel="stylesheet" href="css/login.css">
<style>
	body{
		animation: fadeIn 0.5s ease-in-out;
	}
	@keyframes fadeIn {
    	0% { opacity: 0; }
    	100% { opacity: 1; }
	}
</style>
</head>

<body>
	<input type="hidden" id="status" value="<%= request.getAttribute("status") %>"></input>

	 <div class="warpper">
        <form method="post" action="login">
            <h1 class="title">เข้าสู่ระบบ</h1>
    
            <div class="input-box">
                <span class="span-text">ชื่อผู้ใช้:</span>
                <input type="text" name="username" id="username" placeholder="ชื่อผู้ใช้">
                <i class="bx bxs-user"></i>
            </div>

            <div class="input-box">
                <span class="span-text">รหัสผ่าน:</span>
                <input type="password" name="password" id="password" placeholder="รหัสผ่าน">
                <i class="bx bx-hide" id="showPassword" onclick="togglePassword('password')"></i>
            </div>
            <input type="submit" name="signin" id="signin" class="btn" value="เข้าสู่ระบบ" />
            <div class="register">
                <p>คุณยังไม่มีบัญชีใช่หรือไม่
                    <a href="register.jsp">สมัครสมาชิกเลย!</a>
                </p>
            </div>
    	</form>            
    </div>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

	<script type="text/javascript">
    window.onload = function() {
        var status = document.getElementById("status").value;
        if(status === "failed"){
            swal("เข้าสู่ระบบไม่สำเร็จ");
        }
        else if(status === "invaliName"){
            swal("กรุณากรอกชื่อผู้ใช้");
        }
        else if(status === "invaliPassword"){
            swal("กรุณากรอกรหัสผ่าน");
        }
    };
    
    function togglePassword(inputId) {
        var x = document.getElementById(inputId);
        var icon = document.getElementById('show' + inputId.charAt(0).toUpperCase() + inputId.slice(1));
        if (x.type === "password") {
            x.type = "text";
            icon.className = "bx bxs-lock-open-alt";
        } else {
            x.type = "password";
            icon.className = "bx bx-hide";
        }
    };
	</script>
</body>
</html>