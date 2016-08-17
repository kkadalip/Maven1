package listener;

//import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dao.HibernateUtil;
import dao.ProjectDao;
import dao.SetupDao;

public class InitDatabaseListener implements ServletContextListener { // class not found?? TODO
	Logger log = LoggerFactory.getLogger(ProjectDao.class);
	
	@Override
	public void contextInitialized(ServletContextEvent sce) {
		// params from web.xml
		//ServletContext sc = sce.getServletContext();
	    //String name = sc.getInitParameter("whateverName");
	    //Something smth = new Something();
	    //smth.setSmth(name);
		
		SetupDao setupDao = new SetupDao();
		//setupDao.insertSampleDataUsers(); // WORKS! Not using anymore. Inserts sample users into database.
		setupDao.insertSampleData();
		log.info("[contextInitialized] DONE");
	}

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		HibernateUtil.getSessionFactory().close(); // closing factory
		log.info("[contextDestroyed] DONE");
	}

}



















// setupDao.destroy();
// setupDao.createSchema();
//setupDaoHibernate.initFactory();