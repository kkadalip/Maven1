package controller;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.LoggerFactory;

/**
 * Servlet implementation class Projects
 */
@WebServlet("/Projects")
public class Projects extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private final static org.slf4j.Logger logger = LoggerFactory.getLogger(Projects.class);

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Projects() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		request.setAttribute("message", "Welcome");
		
		request.getRequestDispatcher("projects.jsp").forward(request, response); // jsp/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
