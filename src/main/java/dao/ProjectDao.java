package dao;

//import java.util.Iterator;
import java.util.List;
//import java.util.ArrayList;
//import java.sql.SQLException;

//import org.hibernate.FetchMode;
import org.hibernate.HibernateException;
//import org.hibernate.Query;
//import org.hibernate.HibernateException;
import org.hibernate.Session;
//import org.hibernate.SessionFactory;
//import org.hibernate.Transaction;
//import org.hibernate.criterion.Restrictions;
//import org.hibernate.cfg.Configuration;
//import org.springframework.transaction.annotation.Transactional;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

//import model.Person;
import model.Project; // bean
//import model.User;

public class ProjectDao extends AbstractDao {
	Logger log = LoggerFactory.getLogger(ProjectDao.class); // info trace debug warn error

	public ProjectDao(){
		super();
	}
	
	public Project getProjectByID (Long id){
		log.info("[getProjectByID] ID: {}", id);
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			session.beginTransaction();
			Project result = session.get(Project.class, new Long(id));
			log.debug("[getProjectByID] FOUND RESULT SECTOR (can be null if not found): {}", result);
			return result;
		} catch (HibernateException e) {
			log.error("[getProjectByID] getting sector by ID failed!", e);
			return null;
		} finally {
			session.close();
		}
	}
	
//	public List<Project> getAllProjects(){
//		Session session = HibernateUtil.getSessionFactory().openSession();
//		try {
//			session.beginTransaction();
//			@SuppressWarnings("unchecked")
//			List<Project> result = session.createQuery("from Project").getResultList();
//			log.debug("[getAllProjects] FOUND RESULTS (can be null if not found): {}", result);
//			return result;
//		} catch (HibernateException e) {
//			log.error("[getAllProjects] failed", e);
//			return null;
//		} finally {
//			session.close();
//		}
//	}
	
	/**
     * Finds all Projects in the database.
     * @return
     */
    public List<?> getAll() { // throws DataAccessLayerException
    	log.debug("GET ALL PROJECTS IN PROJECTDAO");
        return super.getAll(Project.class);
    }

//	// FIND ALL ROOT SECTORS (find all level 0 aka root)
//	public List<Sector> getAllRootSectors() {
//		log.info("[getAllRootSectors] START");
//		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
//		Session session = sessionFactory.openSession();
//		//Transaction transaction = session.beginTransaction();
//		//List<Sector> queryResult = new ArrayList<Sector>();
//		//String queryString = "";
//		// https://docs.jboss.org/hibernate/orm/3.3/reference/en/html/queryhql.html
//
//		log.debug("[getAllRootSectors] THIS HERE NOW IS VERY VERY IMPORTANT");
//		@SuppressWarnings("unchecked")
//
//		// GETS ALL SECTORS:
//		//List<Sector> queryResult = session.createQuery("FROM Sector").list();
//		// GETS ALL SECTORS, SORTS BY NAME:
//		//List queryResult = session.createQuery("FROM Sector ORDER BY name").list();
//
//		// GOOD EAGER, GETS ROOT ELEMENTS AND EAGERLY ALL CHILD SECTORS IF FetchType is EAGER in model:
//		List<Sector> queryResult = session.createQuery("FROM Sector S WHERE parentId IS NULL").list();
//
//		// BAD LAZY, GETS ALL (BAD)!
//		//List<Sector> queryResult = session.createQuery("FROM Sector S LEFT JOIN FETCH S.child_sectors").list();
//
//		//BAD LAZY - ONLY LEVEL 0 AND LEVEL1 BECAUSE OF WHERE CLAUSE:
//		//List<Sector> queryResult = session.createQuery("FROM Sector S LEFT JOIN FETCH S.child_sectors WHERE S.parentId IS NULL").list();
//		//SAME THING WITH CRITERIA:
//		//List<Sector> queryResult = session.createCriteria(Sector.class)
//		//.add(Restrictions.isNull("parentId"))
//		//.setFetchMode("child_sectors", FetchMode.JOIN)
//		//.list();
//
//		//BAD - TRYING SOME IDEAS: NOT WORKING
//		//Select d, e from Department d join d.employees e where e.address.city = 'Tallinn'
//		//List<Sector> queryResult = session.createQuery("Select a, b FROM Sector a JOIN FETCH a.child_sectors b where b.parentId IS NOT NULL").list(); //    WHERE S.parentId IS NULL").list();
//		//List<Sector> queryResult = session.createQuery("Select a, b FROM Sector a JOIN FETCH a.child_sectors b where b.parentId = a.id").list();
//		//List<Sector> queryResult = session.createQuery("Select a FROM Sector a JOIN FETCH a.child_sectors b WHERE a.parentId IS NULL").list();
//
//		//how to show table values with no refernece in other table in hibernate
//		//select a from A a where a.jobId not in (select b.jobId from B b)
//		//List<Sector> queryResult = session.createQuery("SELECT s FROM Sector s WHERE s.sector_id NOT IN ()").list();
//		//List<Sector> queryResult = session.createQuery("FROM Sector S LEFT JOIN FETCH S.child_sectors WHERE S.parentId IS NULL OR S.parentId IN (SELECT S.id FROM Sector S WHERE parentId IS NULL)").list();
//
//		//List<Sector> queryResult2 = new ArrayList<Sector>();
//		//for(Sector s : queryResult){
//		//	Query q = session.createQuery("FROM Sector S LEFT JOIN FETCH S.child_sectors WHERE S.id = :rootSectorId"); //.uniqueResult();
//		//	q.setParameter("rootSectorId", s.getId());
//		//	Sector res = (Sector) q.uniqueResult();
//		//	queryResult2.add(res);
//		//}
//
//		//List<Sector> queryResult = session.createQuery("FROM Sector S LEFT JOIN FETCH S.child_sectors cs WHERE S.parentId IS NULL").list();
//		// select a from A a left join fetch a.bs b left join fetch b.cs
//
//		//List<Sector> queryResult = session.createQuery("FROM Sector A, B LEFT JOIN FETCH A.child_sectors, B.child_sectors WHERE A.parentId IS NULL OR ").list(); //  WHERE S.parentId IS NULL
//
//		//List<Sector> queryResult = session.createCriteria(Sector.class)
//		//.setFetchMode("child_sectors", FetchMode.JOIN)
//		////.add(Restrictions.isNull("parentId"))
//		//.list();
//
//		//wtf List<Sector> queryResult = session.createQuery("SELECT S, CS FROM Sector S LEFT JOIN FETCH S.child_sectors AS CS WHERE S.parentId IS NULL OR CS.parentId IS S.id").list();
//
//		//List<Sector> queryResult = session.createCriteria(Sector.class)
//		//.setFetchMode("child_sectors", FetchMode.JOIN)
//		////.add(Restrictions.isNull("parentId"))
//		//.list();
//
//		// session.createFilter(items.getBoxes(), "order by this.name").list()
//
//		//// ONLY ROOT SECTORS:
//		//List<Sector> queryResult = session.createQuery("FROM Sector S WHERE S.parentId IS NULL").list();
//		//List<Sector> rootSectorsWithChildren = new ArrayList<Sector>();
//		//// FETCH ROOT SECTOR CHILDREN AND THEIR CHILDREN:
//		//for (Iterator<Sector> iterator = queryResult.iterator(); iterator.hasNext();){
//		//	Sector sector = (Sector) iterator.next();
//		//	log.debug("[getAllRootSectors] ID FOR QUERY: " + sector.getId());
//		//Query query = session.createQuery("FROM Sector S LEFT JOIN FETCH S.child_sectors WHERE S.id IS :rootSectorId");
//		//query.setParameter("rootSectorId", sector.getId());
//		//Sector rootWithChildren = (Sector) query.uniqueResult();
//		//rootSectorsWithChildren.add(rootWithChildren);
//		//log.debug("[getAllRootSectors] ADDING: " + rootWithChildren);
//		////log.debug("[getAllRootSectors] ADDING ITEM CHILDREN: " + rootWithChildren.getChild_sectors());
//		//}
//
//		session.close();
//
//		// TODO DELETE LATER:
//		for (Iterator<Sector> iterator = queryResult.iterator(); iterator.hasNext();){
//			Sector sector = (Sector) iterator.next();
//			log.debug("[getAllRootSectors] ADDING ROOTSECTOR " + sector);
//			log.debug("[getAllRootSectors] ROOTSECTOR CHILDREN " + sector.getChild_sectors());
//			for (Iterator<Sector> iterator2 = sector.getChild_sectors().iterator(); iterator2.hasNext();){
//				Sector childSector = (Sector) iterator2.next();
//				log.debug("[getAllRootSectors] CHILD: "+ childSector);
//				log.debug("[getAllRootSectors] CHILDS CHILDREN: " + childSector.getChild_sectors());
//				//sectors.add(childSector);
//				for (Iterator<Sector> iterator3 = childSector.getChild_sectors().iterator(); iterator3.hasNext();){
//					Sector childSector2 = (Sector) iterator3.next();
//					log.debug("[getAllRootSectors] CHILD CHILD: "+ childSector2);
//					log.debug("[getAllRootSectors] CHILDS CHILDRENS CHILDREN: " + childSector2.getChild_sectors());
//					//sectors.add(childSector);
//				}
//			}
//			//transaction.commit(); // nothing to commit here
//			//return sectors;
//		}
//
//		log.info("[getAllRootSectors] END");
//		return queryResult;
//		//return rootSectorsWithChildren;
//	}
}





//private Node fetchChildren(Node parent) {
//    Hibernate.initialize(parent.getChildren());
//    for (Node child : parent.getChildren()) {
//        fetchChildren(child);
//    }
//    return parent;
//} 

//public List<Sector> getAllSectors() {
//System.out.print("[SectorDao][findAll] START");
//SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
//Session session = sessionFactory.openSession();
////@SuppressWarnings("unchecked")
////List<Sector> sectors = session.createCriteria(Sector.class).list();
//
////Transaction transaction = session.beginTransaction();
//List<Sector> sectors = new ArrayList<Sector>();
//@SuppressWarnings("unchecked")
//List<Sector> queryResult = session.createQuery("FROM Sector").list(); 
////List queryResult = session.createQuery("FROM Sector ORDER BY name").list(); // SORTS BY NAME
//for (Iterator<Sector> iterator = queryResult.iterator(); iterator.hasNext();){
//	Sector sector = (Sector) iterator.next(); 
//	//System.out.print("[SectorDao][findAll] Sector ID: " + sector.getId() + " Sector Name: " + sector.getName() + " Sector parent sector: " + sector.getParentSector().getName());
//	System.out.print("[SectorDao][findAll] Sector: " + sector.toString() ); //+ " Parent sector: " + sector.getParentSector().toString());
//	sectors.add(sector);
//}
////transaction.commit(); // nothing to commit here
//session.close();
//return sectors;
//}

//SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
//Session session = sessionFactory.openSession();

//Sector resultSector = new Sector();
//List queryResult = session.createQuery("FROM Sector S WHERE S.id IS "+id).list(); 
//if(!queryResult.isEmpty()){
//	resultSector = (Sector) queryResult.get(0);
//	System.out.println("[SectorDao][findSectorById] FOUND SECTOR, returning: " + resultSector.toString());
//}