package controller;


import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.LoggerFactory;

import dao.AbstractDao;
import dao.PersonDao;
import dao.ProjectDao;
import dao.ProjectGroupDao;
import model.Person;
import model.Project;
import model.ProjectGroup;

/**
 * Servlet implementation class Projects
 */
@WebServlet("/Projects")
public class Projects extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private final static org.slf4j.Logger log = LoggerFactory.getLogger(Projects.class);

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
		
		//request.setAttribute("message", "Welcome"); // in JSP use ${message}
		
		PersonDao personDao = new PersonDao();
		List<Person> persons = personDao.getAll(); //.getAllPersons();
		log.debug("persons size: " + persons.size());
		request.setAttribute("persons", persons);
		
		ProjectDao projectDao = new ProjectDao();
		@SuppressWarnings("unchecked")
		List<Project> projects = projectDao.getAll(); //getAllProjects();
		log.debug("projects size: " + projects.size());
		request.setAttribute("projects", projects);
		
		ProjectGroupDao projectGroupDao = new ProjectGroupDao();
		@SuppressWarnings("unchecked")
		List<ProjectGroup> projectGroups = projectGroupDao.getAll(); //getAllProjects();
		log.debug("projectGroups size: " + projectGroups.size());
		request.setAttribute("projectGroups", projectGroups);
		
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
