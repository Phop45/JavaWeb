<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>popup</title>
<!-- <link rel="stylesheet" href="css/popup.css"> -->
</head>
<body>
	<div class="popup">
        <div class="popup-content">
            <form action="addnotes" method="POST">
                <h1>เพิ่มโน็ตใหม่</h1>

				<input type="hidden" name="UID" id="UID" value=" <%= session.getAttribute("id") %> ">
                
                <div class="input-box">
                    <span class="span-text">หัวข้อ: </span>
                    <input type="text" name="title" id="title" placeholder="ใส่หัวข้อเลย..." required>
                </div>

                <div class="input-box">
                    <span class="span-text">เนื้อหา:</span>
                    <textarea name="content" id="content" placeholder="เนื้อหาโน็ต..."></textarea>
                </div>

                <div class="form-btn">
                    <a class="close-btn">ยกเลิก</a>
                    <button type="submit" class="btn">สร้าง</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>