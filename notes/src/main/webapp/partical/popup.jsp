<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>popup</title>
</head>
<body>
	<div class="popup">
        <div class="popup-content">
            <form action="/createSubject" method="POST">
                <h1>เพิ่มโน็ตใหม่</h1>

                <div class="input-box">
                    <span class="span-text">หัวข้อ: </span>
                    <input type="text" name="SubName" id="SubName" placeholder="ใส่หัวข้อเลย..." required>
                </div>

                <div class="input-box">
                    <span class="span-text">เนื้อหา:</span>
                    <textarea name="SubDescription" id="SubDescription" placeholder="คำอธิบาย"></textarea>
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