package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userName = request.getParameter("username");
		String userEmail = request.getParameter("email");
		String userPass = request.getParameter("password");
		String confirmPassword = request.getParameter("re_password");
		RequestDispatcher dispatcher = null;
		Connection con = null;
		
		try {
			// เช็ครหัสผ่านว่า 8 ตัวไหม
            if (userPass.length() < 4) {
                dispatcher = request.getRequestDispatcher("register.jsp");
                request.setAttribute("status", "pass-failed");
                dispatcher.forward(request, response);
                return;
            }
            // เช็คยืนยันรหัสผ่านว่าเหมือนกันไหม
            if (!userPass.equals(confirmPassword)) {
                dispatcher = request.getRequestDispatcher("register.jsp");
                request.setAttribute("status", "conpass-failed");
                dispatcher.forward(request, response);
                return;
            }
            
            // เชื่อม databased
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost/notesProject?characterEncoding=utf-8&useSSL=false", "root", "");
			PreparedStatement pst = con.prepareStatement("insert into user(userName,userEmail,userPass) values(?,?,?)" );
			pst.setString(1, userName);
			pst.setString(2, userEmail);
			pst.setString(3, userPass);
			
			int rowCount = pst.executeUpdate();
			dispatcher = request.getRequestDispatcher("register.jsp");
			if(rowCount > 0) {
				request.setAttribute("status", "success");
				HttpSession session = request.getSession();
                session.setAttribute("name", userName);            
                response.sendRedirect("index.jsp");
			} else {
				dispatcher = request.getRequestDispatcher("register.jsp");
                request.setAttribute("status", "failed");
                dispatcher.forward(request, response);
			}
		}
		catch (Exception e){
			e.printStackTrace();
		} 
		finally {
			try {
				if (con != null) {
                    con.close();
                }
			} catch (Exception e){
				e.printStackTrace();
			}
		}
	}
}