package com.genesis.cruds;

import java.util.List;

import javax.persistence.NoResultException;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

import com.genesis.beans.Emp;
import com.genesis.util.Util;

//@Repository
public class EmployeeCRUD {
	
	SessionFactory sf;
	
	Transaction t;
	CriteriaBuilder cb;
	int id;
	public EmployeeCRUD(Util u) {
		sf=u.getSF();
		
	}
	
	public int addEmployee(Emp e) {
		Session session=sf.openSession();
		try {
			t=session.beginTransaction();
			session.save(e);
			t.commit();
			System.out.println(id);
			return e.getEno(); 
		}catch(Exception s) {
			System.out.println("Error:"+s.getMessage());
			t.rollback();
			return -1;
		}
		finally {
			session.close();
		}
		
	}
	
	public boolean updateEmployee(Emp e) {
		Session session=sf.openSession();
		try {
			t=session.beginTransaction();
			session.update(e);
			t.commit();
			return true;
		}catch(Exception s) {
			System.out.println(s.getMessage());
			t.rollback();
			return false;
		}
		finally {
			session.close();
		}
	}
	
	public Emp deleteEmployee(Emp e) {
		Session session=sf.openSession();
		try{
			Emp ex=searchEmployee(e.getEno());
			if(ex==null) {
				return null;
			}
			else {
				
				t=session.beginTransaction();
				session.delete(ex);
				t.commit();
				return ex;
			}
		}catch(Exception s) {
			System.out.println("Error:"+s.getMessage());
			t.rollback();
			return null;
		}
		finally {
			session.close();
		}
	}
	
	public List<Emp> viewAllEmployee() {
		Session session=sf.openSession();
		cb=session.getCriteriaBuilder();
		CriteriaQuery<Emp> criteriaQuery= cb.createQuery(Emp.class);
		Root<Emp> root=criteriaQuery.from(Emp.class);
        criteriaQuery.select(root);
        Query query=session.createQuery(criteriaQuery);
        @SuppressWarnings("unchecked")
		List<Emp> l=query.getResultList();
        session.close();
        return l;
	}
	
	public Emp searchEmployee(int id) {
		Session session=sf.openSession();
		cb=session.getCriteriaBuilder();
		CriteriaQuery<Emp> criteriaQuery= cb.createQuery(Emp.class);
		Root<Emp> root=criteriaQuery.from(Emp.class);
        criteriaQuery.select(root).where(cb.equal(root.get("eno"), id));
        Query query=session.createQuery(criteriaQuery);
        Emp emp;
        try{
        	emp= (Emp) query.getSingleResult();
        }
        catch(NoResultException r) {
        	emp= null;
        }
        finally {
			session.close();
		}
        return emp;
	}
	
	
}
