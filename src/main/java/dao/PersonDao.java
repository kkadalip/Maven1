package dao;

import java.util.ArrayList;
import java.util.HashSet;
//import java.sql.SQLException;
//import java.util.ArrayList;
//import java.util.Iterator;
import java.util.List;
import java.util.Set;

//import javax.persistence.Query;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
//import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
//import org.hibernate.cfg.Configuration;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


//import controller.Default;
//import model.Sector;
//import dao.AbstractDao;
import model.Project;
import model.Person; // bean

public class PersonDao { // extends AbstractDao {
	Logger log = LoggerFactory.getLogger(PersonDao.class); // info trace debug warn error
	
	// READ THIS http://www.coderanch.com/t/434465/Servlets/java/request-Response-object-web-application
	public Long addPerson(Person person) { // TODO FIX?
		// (1. configuring hibernate & 2. create sessionfactory) 3. Get Session object
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = null;
		log.info("[addUser]");
		try {
			// 4. Starting Transaction
			transaction = session.beginTransaction();
			session.save(person); // TODO FIX UserDao][addUser] error 1 A different object with the same identifier value was already associated with the session : [model.Sector#39]
			transaction.commit(); // session.getTransaction().commit();
			log.debug("[addUser] NEW USER DETAILS ADDED SUCCESSFULLY!");
			//return true;
			return person.getId();
		} catch (HibernateException e) {
			log.error("[addUser] adding user failed", e); //e.printStackTrace(); // System.out.println("[UserDao][addUser] error 1 " + e.getMessage());
			transaction.rollback();
			//return false;
			return null;
		} finally {
            session.close();
        }
	}
	
	public Person getPersonById(Long id){
		log.info("[getUserById] ID: {}", id);
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			session.beginTransaction();
			Person resultUser = session.get(Person.class, new Long(id)); // http://www.mkyong.com/hibernate/different-between-session-get-and-session-load/
			log.debug("[getUserById] FOUND RESULT USER (can be null if not found): {}", resultUser);
			return resultUser;
		} catch (HibernateException e) {
			log.error("[getUserById] getting user by ID failed!", e);
			return null;
		} finally {
			session.close();
		}
	}
	
	public List<Person> getAllPersons(){
		log.info("[getAllPersons]");
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			@SuppressWarnings("unchecked")			
			List<Person> users = session.createQuery("FROM Person").getResultList(); //session.createCriteria(Person.class).list(); // .addOrder(Order.asc("name")).list(); 
			//List queryResult = session.createQuery("FROM User").list(); 
			//for (Iterator iterator = queryResult.iterator(); iterator.hasNext();){
			//	User user = (User) iterator.next(); 
			//	System.out.print("[UserDao][findAll] " + user.toString() ); // User ID: + user.getId() + " Name: " + user.getName());
			//	users.add(user);
			//}
			//users = session.createCriteria(User.class).list();
			return users;
		} catch (HibernateException e) {
			log.error("[getAllPersons] getting all users failed!", e);
			return null;
		} finally {
			session.close();
		}
	}

	public boolean addOrUpdatePerson(Person person) { //, String password, String email, String phone, String city) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			// http://www.stevideter.com/2008/12/07/saveorupdate-versus-merge-in-hibernate/
			// saveupdate org.hibernate.NonUniqueObjectException: A different object with the same identifier value was already associated with the session : [model.Sector#39]
			// merge java.lang.IllegalStateException: Multiple representations of the same entity [model.Sector#40] are being merged. Detached: [ ID: 40 Name: Beverages]; Detached: [ ID: 40 Name: Beverages]
			session.saveOrUpdate(person); //.update(user); //.saveOrUpdate(user); 
			transaction.commit(); // session.getTransaction().commit();
			return true;
		} catch (HibernateException e) {
			log.error("[updateUser] updating user failed!", e);
			return false;
		} finally {
			session.close();
		}	
	}
	
	public Long addOrUpdateUser2(Long oldPersonID, Person person) { //, String password, String email, String phone, String city) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			Person result = session.get(Person.class, new Long(oldPersonID));
			// http://www.stevideter.com/2008/12/07/saveorupdate-versus-merge-in-hibernate/
			// saveupdate org.hibernate.NonUniqueObjectException: A different object with the same identifier value was already associated with the session : [model.Sector#39]
			// merge java.lang.IllegalStateException: Multiple representations of the same entity [model.Sector#40] are being merged. Detached: [ ID: 40 Name: Beverages]; Detached: [ ID: 40 Name: Beverages]
			Long returnID = null;
			if(result == null){
				// DID NOT FIND ANY EXISTING BY ID (ID must have only existed in session but the item had been deleted from db)
				log.error("[updateUser] resultUser == null, session.save(user)");
				session.save(person);
				returnID = person.getId();
			}else{
				log.error("[updateUser] resultUser != null, session.update(user)"); // TODO update?? saveOrUpdate??
				result = person;
				session.save(result); // saveOrUpdate
				returnID = result.getId();
			}
			//session.saveOrUpdate(user); //.update(user); //.saveOrUpdate(user); 
			transaction.commit(); // session.getTransaction().commit();
			//return true;
			return returnID;
		} catch (HibernateException e) {
			log.error("[updateUser] updating user failed!", e);
			//return false;
			return null;
		} finally {
			session.close();
		}	
	}

//	public String[] getUserProjectsAsStringArray(Long personID) { // User user
//		log.info("[getUser_sectors_stringArray] START");
//		Session session = HibernateUtil.getSessionFactory().openSession();
//		try {
//			session.beginTransaction();
//			
//			//Long userID = user.getId();
//			
//			//List<Sector> userSectors = session.createQuery("FROM User U LEFT JOIN FETCH U.user_sectors WHERE U.id IS " + user_id).list();
//			//String hql = "FROM Employee E WHERE E.id = :employee_id";
//			String hql = "FROM User U LEFT JOIN FETCH U.user_sectors WHERE U.id IS :user_id"; 
//			Query query = session.createQuery(hql);
//			query.setParameter("user_id",personID);
//			@SuppressWarnings("unchecked")
//			List<Person> queryResult = query.list();
//			Set<Project> userSectors = new HashSet<Project>();
//			if(!queryResult.isEmpty()){
//				Person result = (Person) queryResult.get(0);
//				userSectors = result.getPersonProjects(); // TODO
//			}
////				resultSector = (Sector) queryResult.get(0);
////				System.out.println("[SectorDao][findSectorById] FOUND SECTOR, returning: " + resultSector.toString());
////			}
//			
//			
//			List<String> selectedSectors = new ArrayList<String>();
//			for(Project project : personProjects){
//				selectedSectors.add(sector.getId().toString());
//			}
//			String[] selectedSectors_stringArray = new String[selectedSectors.size()];
//			selectedSectors.toArray(selectedSectors_stringArray);
//			log.info("[getUser_sectors_stringArray] SUCCESSFUL?");
//			return selectedSectors_stringArray;
//		} catch (HibernateException e) {
//			log.error("[getUser_sectors_stringArray] FAILED!", e);
//			return null;
//		} finally {
//			session.close();
//		}
//	}
	
}















//sessionFactory.getCurrentSession();

//(1. configuring hibernate &) 2. create sessionfactory
//SessionFactory sessionFactory = HibernateUtil.getSessionFactory();

// List<User> list = sessionFactory.getCurrentSession().createQuery("from User where id = 1").list();
// return (list.isEmpty() ? null : list.get(0));
/*
	public User getUserByIdOld(Long id){
		System.out.print("[UserDao][findUserById] ID: " + id);
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		List<User> list = session.createQuery("from User where id = "+id).list();
		//User queryResult = (User) session.createQuery("FROM User U WHERE U.id IS "+id).uniqueResult();
		session.close();
		return (list.isEmpty() ? null : list.get(0));
//		if(list.isEmpty()){
//			return null;
//		}else{
//			return list.get(0);
//		}
		// Query query = this.session.createQuery("select p from Person as p where p.address=:address")
        //query.setParameter("address",address); 
	}
*/

// NON HIBERNATE STUFF:
/*
public List<User> findAll2() throws SQLException{
	List<User> users = new ArrayList<User>();
	try {
		st = getConnection().createStatement();
		rs = st.executeQuery("SELECT * FROM user");
		while(rs.next()){
			User user = new User();
			user.setId(rs.getInt(1)); // id
			user.setName(rs.getString(2)); // name
			//user.setCode(rs.getString(3)); // code
			users.add(user);
		}
	} finally {
		closeResources();
	}
	return users;
}

public void addUnit(User user) throws SQLException{
	//int unitId = unit.getId();
	String unitName = user.getName();
	//String unitCode = unit.getCode();
	String query = "INSERT INTO user VALUES(NEXT VALUE FOR seq1,'"+unitName+"');"; //+"','"+unitCode+"');";
	try {
		st = getConnection().createStatement();
		rs = st.executeQuery(query);
	} finally {
		closeResources();
	}
}

public List<User> searchUnitsByName(String searchName) throws SQLException{
	List<User> users = new ArrayList<User>();
	try {
		pst = getConnection().prepareStatement("SELECT * FROM user WHERE LOWER(name) LIKE ?");
		pst.setString(1, "%" + searchName.toLowerCase() + "%");
		rs = pst.executeQuery();
		while(rs.next()){
			User user = new User();
			user.setId(rs.getInt(1));
			user.setName(rs.getString(2));
			//unit.setCode(rs.getString(3));
			users.add(user);
		}
	} finally {
		closeResources();
	}
	return users;
}

public void deleteAll() throws SQLException{
	try {
		st = getConnection().createStatement();
		rs = st.executeQuery("TRUNCATE TABLE user;");
	} finally {
		closeResources();
	}
}

public void deleteByID(int id) throws SQLException{
	try {
		pst = getConnection().prepareStatement("DELETE FROM user WHERE id = ?;");
		pst.setInt(1, id);
		pst.execute();
	} finally {
		closeResources();
	}
}
 */