package dao;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import model.Person;

import java.util.List;

import javax.persistence.Query;

public abstract class AbstractDao {
	Logger log = LoggerFactory.getLogger(getClass());

	private Session session;
	private Transaction tx;

	public AbstractDao() {
		//HibernateFactory.buildIfNeeded();
	}

	protected void saveOrUpdate(Object obj) {
		//        try {
		//            startOperation();
		//            session.saveOrUpdate(obj);
		//            tx.commit();
		//        } catch (HibernateException e) {
		//            handleException(e);
		//        } finally {
		//            HibernateFactory.close(session);
		//        }
	}

	protected void delete(Object obj) {
		//        try {
		//            startOperation();
		//            session.delete(obj);
		//            tx.commit();
		//        } catch (HibernateException e) {
		//            handleException(e);
		//        } finally {
		//            HibernateFactory.close(session);
		//        }
	}

	protected Object find(Class clazz, Long id) {
		Object obj = null;
		//        try {
		//            startOperation();
		//            obj = session.load(clazz, id);
		//            tx.commit();
		//        } catch (HibernateException e) {
		//            handleException(e);
		//        } finally {
		////            HibernateFactory.close(session);
		//        }
		return obj;
	}

	protected List getAll(Class clazz) {
		log.info("[getAll " + clazz.getSimpleName() +"]");
		//Session session = HibernateUtil.getSessionFactory().openSession();
		List objects = null;
		try {
			startOperation();
			Query query = session.createQuery("from " + clazz.getName());
			objects = query.getResultList(); //session.createCriteria(Person.class).list(); // .addOrder(Order.asc("name")).list(); 
			tx.commit();
		} catch (HibernateException e) {
			log.error("[getAll] getting all of class: " + clazz.getSimpleName() + " failed!", e);
			handleException(e);
			return null;
		} finally {
			session.close();
			// HibernateFactory.close(session);
		}
		return objects;
	}

	protected void handleException(HibernateException e) throws DataAccessLayerException {
		HibernateUtil.rollback(tx); //HibernateFactory.rollback(tx);
		throw new DataAccessLayerException(e);
	}

	protected void startOperation() throws HibernateException {
		session = HibernateUtil.openSession(); // HibernateUtil.getSessionFactory().openSession();
		tx = session.beginTransaction();
	}

	/////////////////////////////////////////////////////////////////////////
	/**
	 * Represents Exceptions thrown by the Data Access Layer.
	 */
	public class DataAccessLayerException extends RuntimeException {
		public DataAccessLayerException() {
		}

		public DataAccessLayerException(String message) {
			super(message);
		}

		public DataAccessLayerException(Throwable cause) {
			super(cause);
		}

		public DataAccessLayerException(String message, Throwable cause) {
			super(message, cause);
		}
	}
}
