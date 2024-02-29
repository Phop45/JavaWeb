package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/addnotes")
public class AddNotes extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userID = request.getParameter("UID");
		String title = request.getParameter("title");
        String content = request.getParameter("content");
        
        try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/notesProject?characterEncoding=utf-8&useSSL=false", "root", "");
			PreparedStatement pst = con.prepareStatement("INSERT INTO notes (userID, title, content) VALUES (?, ?, ?)");
			pst.setString(1, userID);
			pst.setString(2, title);
            pst.setString(3, content);
            
            int rowCount = pst.executeUpdate();
            
            // Close connections
            pst.close();
            pst.close();	
            
            if (rowCount > 0) {
                response.sendRedirect("index.jsp"); // Redirect to success page
            } else {
                response.sendRedirect("index.jsp"); // Redirect to register page with failure status
            }
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}	
	}
}

