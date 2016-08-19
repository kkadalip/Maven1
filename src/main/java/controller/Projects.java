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

		// ------------------- URI STUFF START ---------------------------------
		// http://stackoverflow.com/questions/14065257/how-to-get-only-part-of-url-from-httpservletrequest
		// http://stackoverflow.com/questions/16501478/getting-part-of-request-url-inside-servlet
		// http://stackoverflow.com/questions/16675191/get-full-url-and-query-string-in-servlet-for-both-http-and-https-requests/16675399#16675399

		// http://localhost:8080/Maven1/projects/swag
		// scheme: http
		// serverName (server host name): localhost
		// serverPort: 8080
		// contextPath: /Maven1
		// servletPath: /projects
		// pathInfo: /swag
		// host getHeader("Host"): localhost:8080
		// url: http://localhost:8080/Maven1/projects/swag
		// uri: /Maven1/projects/swag
		
		String scheme = request.getScheme();
		log.debug("scheme is: " + scheme);
		request.setAttribute("scheme", scheme);
		
		String serverName = request.getServerName();
		log.debug("serverName is: " + serverName);
		request.setAttribute("serverName", serverName);
		
		int serverPort = request.getServerPort();
		log.debug("serverPort is: " + serverPort);
		request.setAttribute("serverPort",serverPort);
		
		String contextPath = request.getContextPath();
		log.debug("contextPath is: " + contextPath);
		request.setAttribute("contextPath", contextPath);
		
		String servletPath = request.getServletPath();
		log.debug("servletPath is: " + servletPath);
		request.setAttribute("servletPath", servletPath);
		
		String pathInfo = request.getPathInfo();
		log.debug("pathInfo is: " + pathInfo);
		request.setAttribute("pathInfo", pathInfo);

		String host = request.getHeader("Host"); // includes server name and server port
		log.debug("host is: " + host);
		request.setAttribute("host", host);
		
		StringBuffer url = request.getRequestURL();
		String urlAsString = url.toString();
		log.debug("url is: " + urlAsString);
		request.setAttribute("url", urlAsString);
		
		String uri = request.getRequestURI();
		log.debug("uri is: " + uri);
		request.setAttribute("uri", uri);
		
		//String base = url.substring(0, url.length() - uri.length() + ctx.length());
		
		// request.getQueryString()
		// request.getParameter(parametername)
		// request.getParameterValues()

		// ------------------- URI STUFF END ---------------------------------
		ProjectDao projectDao = new ProjectDao();
		
		String path = request.getPathInfo();
		if(path != null){
			String importantPart = path.replace("/", "");
			log.debug("importantPart is " + importantPart);
			long projectID = 0;
			// IMPORTANT PROJECT TO DISPLAY BY ID:
			try {
				projectID = Long.parseLong(importantPart);
			} catch (NumberFormatException e) {
				log.error("cant parse projectID");
			}
			if(projectID > 0){
				Project selectedProject = projectDao.getProjectByID(projectID);
				request.setAttribute("selectedProject", selectedProject);
			}
		}
		
		PersonDao personDao = new PersonDao();
		List<Person> persons = personDao.getAll(); //.getAllPersons();
		log.debug("persons size: " + persons.size());
		request.setAttribute("persons", persons);
		

		@SuppressWarnings("unchecked")
		List<Project> projects = projectDao.getAll(); //getAllProjects();
		log.debug("projects size: " + projects.size());
		request.setAttribute("projects", projects);
		
		ProjectGroupDao projectGroupDao = new ProjectGroupDao();
		@SuppressWarnings("unchecked")
		List<ProjectGroup> projectGroups = projectGroupDao.getAll(); //getAllProjects();
		log.debug("projectGroups size: " + projectGroups.size());
		request.setAttribute("projectGroups", projectGroups);
		
		// You need to forward using an absolute path instead. Prefix it with /
		request.getRequestDispatcher("/projects.jsp").forward(request, response); // jsp/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
