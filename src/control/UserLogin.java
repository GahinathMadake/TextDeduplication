package control;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/UserLogin")
public class UserLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	Connection con = null;

	public void init(ServletConfig config) throws ServletException {
		try {
			con = DbConnection.getConnection();
		} catch (Exception e) {
			System.out.println("Exception is " + e);
		}

	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String uid = request.getParameter("uid");
		String pwd = request.getParameter("pwd");

		System.out.println("username is " + uid);
		System.out.println("PWD is " + pwd);

		HttpSession session = request.getSession();

		try 
		{
			System.out.println("Connection established");
			Statement st = con.createStatement();
			System.out.println("1");
			
			PreparedStatement ps = con .prepareStatement("select * from reg where userid='"+ uid + "'");
			ResultSet rs = ps.executeQuery();
			String sts="";
			
			if (rs.next()) 
			{
				sts=rs.getString("status");
				
				System.out.println("sts "+sts);
				System.out.println("uid "+uid);
				System.out.println("pwd "+pwd);
				
				if(sts.equals("Accept"))
				{
					PreparedStatement ps2=con.prepareStatement("select * from reg where userid='"+ uid + "' AND pass='"+pwd+"'");
					ResultSet rs2=ps2.executeQuery();
					
					if(rs2.next())
					{
						System.out.println("Login Done");
						session.setAttribute("username", uid);
						
						
						response.sendRedirect("home.jsp?login=done");
					}
					else
					{
						System.out.println("Login Fail");
						System.out.println("Login Fail 2");
						response.sendRedirect("index.jsp?login=fail");
					}
				}
				else
				{
					System.out.println("Login Fail 3");
					response.sendRedirect("index.jsp?waitting=req");
				}
			}
			else if(uid.equals("admin") && pwd.equals("admin"))
			{
				System.out.println("Login Done Admin ");
				response.sendRedirect("admin.jsp");
			}
			else
			{
				System.out.println("Incorrect Login Details ");
				response.sendRedirect("index.jsp?incorrect=details");
			}
			
			
			
			
			
		} catch (Exception e) {
			System.out.println("Exception caught" + e.getMessage());
		}	
			
			
			
				}
}
