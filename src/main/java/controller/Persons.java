package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.LoggerFactory;

import dao.PersonDao;
//import dao.ProjectGroupDao;
import model.Person;
//import model.Project;
//import model.ProjectGroup;

/**
 * Servlet implementation class People
 */
@WebServlet("/People")
public class Persons extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private final static org.slf4j.Logger log = LoggerFactory.getLogger(Persons.class);
   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Persons() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		PersonDao personDao = new PersonDao();
		
		String path = request.getPathInfo();
		if(path != null){
			String importantPart = path.replace("/", "");
			log.debug("importantPart is " + importantPart);
			long personID = 0;
			// IMPORTANT PROJECT TO DISPLAY BY ID:
			try {
				personID = Long.parseLong(importantPart);
			} catch (NumberFormatException e) {
				log.error("cant parse personID");
			}
			if(personID > 0){
				Person selectedPerson = personDao.getPersonById(personID);
				request.setAttribute("person", selectedPerson);
			}
			request.getRequestDispatcher("/personSingle.jsp").forward(request, response); // jsp/
		}else{
			List<Person> persons = personDao.getAll(); //.getAllPersons();
			log.debug("persons size: " + persons.size());
			request.setAttribute("persons", persons);

			request.getRequestDispatcher("/persons.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
