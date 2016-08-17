package dao;

import org.hibernate.HibernateException;
import org.hibernate.Session;
//import org.hibernate.Session;
import org.hibernate.SessionFactory;
//import org.hibernate.Transaction;
//import org.hibernate.boot.Metadata;
//import org.hibernate.boot.MetadataSources;
//import org.hibernate.boot.registry.StandardServiceRegistry;
//import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
//import org.hibernate.service.ServiceRegistry;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

// rename to HibernateFactory if needed for clarification
public class HibernateUtil {
	// http://stackoverflow.com/questions/32405031/hibernate-5-org-hibernate-mappingexception-unknown-entity
	private static final Logger log = LoggerFactory.getLogger(HibernateUtil.class); // info trace debug warn error
	private static final SessionFactory sessionFactory = buildSessionFactory();

	private static SessionFactory buildSessionFactory() {
		log.info("[buildSessionFactory]");
		try {
			// 1. Configure hibernate
			// https://docs.jboss.org/hibernate/orm/3.3/reference/en-US/html/session-configuration.html
			// http://stackoverflow.com/questions/25684785/how-to-read-database-configuration-parameter-using-properties-file-in-hibernate
			Configuration configuration = new Configuration().configure();
			// 2.  Create SessionFactory (from hibernate.cfg.xml)
			SessionFactory sessionFactory = configuration.buildSessionFactory();
			return sessionFactory;
		} 
		catch (HibernateException e) { //catch (Throwable ex) { // Make sure you log the exception, as it might be swallowed
			log.error("[buildSessionFactory] Initial SessionFactory creation failed",e);
			throw new HibernateException(e);
		}
	}

	public static SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public static Session openSession() {
		Session session = sessionFactory.openSession();
		return session;
	}
	
	public static void rollback(Transaction tx) {
		// TODO Auto-generated method stub
		tx.rollback();
	}

}










//StandardServiceRegistry standardRegistry = new StandardServiceRegistryBuilder() .configure("hibernate.cfg.xml").build();
//Metadata metadata = new MetadataSources(standardRegistry).getMetadataBuilder().build();
//return metadata.getSessionFactoryBuilder().build();

//Configuration conf = new Configuration();  
//conf.configure(); // conf.configure("/resources/hibernate.cfg.xml");
//ServiceRegistry sr = new StandardServiceRegistryBuilder().applySettings(conf.getProperties()).build();
//SessionFactory sf = conf.buildSessionFactory(sr);  
//
//User user1 = new User();  
//user1.setName("Alala");  
////user1.setUserMessage("Hello world");  
//
//User user2 = new User();  
//user2.setName("Ololo");  
////user2.setUserMessage("Hello world2");  
//
//Session session = sf.openSession();  
//session.beginTransaction();  
//
////saving objects to session  
//session.save(user1);  
//session.save(user2);  
//session.getTransaction().commit();  
//session.close();  
