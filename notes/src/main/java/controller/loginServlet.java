package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userNameOrEmail = request.getParameter("username");
		String userPass = request.getParameter("password");
		HttpSession session = request.getSession();
		RequestDispatcher dispatcher = null;
		
		// เช็คชื่อกับรหัสผ่าน
		if(userNameOrEmail == null || userNameOrEmail.equals("")) {
			request.setAttribute("status", "invaliName");
			dispatcher = request.getRequestDispatcher("login.jsp");
			dispatcher.forward(request, response);
		}
		if(userPass == null || userPass.equals("")) {
			request.setAttribute("status", "invaliPassword");
			dispatcher = request.getRequestDispatcher("login.jsp");
			dispatcher.forward(request, response);
		}
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/notesProject?characterEncoding=utf-8&useSSL=false", "root", "");
			PreparedStatement pst = con.prepareStatement("select * from user where (userName = ? or userEmail = ?) and userPass = ?");
            pst.setString(1, userNameOrEmail);
            pst.setString(2, userNameOrEmail);
            pst.setString(3, userPass);
			
			ResultSet rs = pst.executeQuery();
			if(rs.next()) {
				session.setAttribute("name", rs.getString("userName"));
				session.setAttribute("id", rs.getString("userID"));
				dispatcher = request.getRequestDispatcher("index.jsp");
			} else {
				request.setAttribute("status", "failed");
				dispatcher = request.getRequestDispatcher("login.jsp");
			}
			dispatcher.forward(request, response);
		}
		catch (Exception e){
			e.printStackTrace();
		} 
	}

}
