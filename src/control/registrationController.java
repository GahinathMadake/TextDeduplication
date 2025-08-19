/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "registrationController", urlPatterns = { "/registrationController" })
public class registrationController extends HttpServlet 
{

	protected void processRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
	}

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
		exeute(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
		exeute(request, response);
	}

	@Override
	public String getServletInfo() {
		return "Short description";
	}// </editor-fold>

	public void exeute(HttpServletRequest request, HttpServletResponse response) {
		try {

			System.out.println("in registration servlet");
			String firstname = request.getParameter("fname");

			String lastname = request.getParameter("lname");
			String email = request.getParameter("emid");
			String uid = request.getParameter("uid");
			String password1 = request.getParameter("pwd");
			String dob = request.getParameter("dob");
			String contactString = request.getParameter("pno");
			String address = request.getParameter("address");
			String privilege = request.getParameter("tag1");
			
			System.out.println("privilege is : " + privilege);
			if (firstname != null && lastname != null && email != null
					&& uid != null && password1 != null && dob != null
					&& contactString != null && address != null
					&& privilege != null) {

				ConnectionManager cm = new ConnectionManager();
				Statement st = cm.statement();

				Statement stmt = cm.statement();
				String query = "insert into reg (fname,lname,emailid,userid,pass,dob,phone,address,privilege,status) "
						+ "values('"
						+ firstname
						+ "','"
						+ lastname
						+ "','"
						+ email
						+ "','"
						+ uid
						+ "','"
						+ password1
						+ "','"
						+ dob
						+ "','"
						+ contactString
						+ "','"
						+ address
						+ "','"
						+ privilege + "','Waitting')";
				// +
				// "'"+rd.getCity()+"','"+rd.getState()+"','"+rd.getCategory()+"')";
				System.out.println("Query: " + query);
				stmt.execute(query);

				if (!response.isCommitted()) {
					response.sendRedirect("index.jsp?reg=done");
					
				} else 
				{
				
					
					response.sendRedirect("index.jsp??reg=fail");
					
				}
			} else {
				
				System.out.println("fail");
				response.sendRedirect("index.jsp??reg=fail");
				}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
