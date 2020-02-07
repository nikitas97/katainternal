package gr.hua.dit.springmvc1.dao;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import gr.hua.dit.springmvc1.entity.Form;
import gr.hua.dit.springmvc1.entity.Student;



@Service
public class FormDAOImpl implements FormDAO {

	@Autowired
    private SessionFactory sessionFactory;
	
	@Override
	@Transactional
	public List<Form> getForms() {
		// TODO Auto-generated method stub
		Session currentSession = sessionFactory.getCurrentSession();
		
		Query<Form> query = currentSession.createQuery("from Form", Form.class);
		
        List<Form> forms = query.getResultList();
		
		return forms;
	}
	
	@Override
	@Transactional
	public List<Form> verify(){
		Session session = sessionFactory.getCurrentSession();
		
		Query<Form> q = session.createQuery("from Form where isVerified=true order by rating DESC");
		List<Form> forms = q.getResultList();
		
		
		return forms;
	}
	
	
	@Override
	@Transactional
	public List<Form> sort(){
		Session session = sessionFactory.getCurrentSession();
		List<Form> allforms = new ArrayList<Form>();
		
		Query<Student> query = session.createQuery("from Student where department='GD'", Student.class);
		List<Student> s = query.getResultList();
		int sgd=(s.size()*80)/100;
		Query<Form> q1 = session.createQuery("from Form where isVerified=true and department='GD' order by rating DESC", Form.class);
		q1.setMaxResults(sgd);
		List<Form> gdsorted = q1.getResultList();
		
		allforms.addAll(gdsorted);
		
		Query<Student> q = session.createQuery("from Student where department='DIT'", Student.class);
		List<Student> s1 = q.getResultList();
		int sdit = (s1.size()*80)/100;
		Query<Form> q2 = session.createQuery("from Form where isVerified=true and department='DIT' order by rating DESC", Form.class);
		q2.setMaxResults(sdit);
		List<Form> ditsorted = q2.getResultList();
		
		allforms.addAll(ditsorted);
		
		Query<Student> q3 = session.createQuery("from Student where department='NUT'", Student.class);
		List<Student> s2 = q3.getResultList();
		int snut=(s2.size()*80)/100;
		Query<Form> q4 = session.createQuery("from Form where isVerified=true and department='NUT' order by rating DESC", Form.class);
		q4.setMaxResults(snut);
		List<Form> nutsorted = q4.getResultList();
		
		allforms.addAll(nutsorted);
		
		return allforms;
	}
	
	@Override
	@Transactional
	public String updateAvailability(){
		String result;
		
		Session session = sessionFactory.getCurrentSession();
		List<Form> allforms = new ArrayList<Form>();
		
		Query<Student> query = session.createQuery("from Student where department='GD'", Student.class);
		List<Student> s = query.getResultList();
		int sgd=(s.size()*80)/100;
		
		Query<Student> q = session.createQuery("from Student where department='DIT'", Student.class);
		List<Student> s1 = q.getResultList();
		int sdit = (s1.size()*80)/100;
		
		Query<Student> q3 = session.createQuery("from Student where department='NUT'", Student.class);
		List<Student> s2 = q3.getResultList();
		int snut=(s2.size()*80)/100;
		
		result = "Για το GD department :"+sgd+"άτομα δικαιούνται σίτιση."
				+ "Για το DIT department :"+sdit+"άτομα δικαιούνται σίτση."
			    + "Για το NUT department :"+snut+"άτομα δικαιούνται σίτιση.";
		
		return result;
	}

	
	public int calcRating(String city,int studIncome,boolean workingParents,int familyInc,int studyingSibs,String studCity) {
		int rating=0;
		
		if (studIncome==0 && workingParents==false) {
			rating=999;
		} else {
			int totalInc=familyInc+studIncome;
			if (totalInc<10000) {
				rating=rating+100;
			} else if (totalInc>10000 && totalInc<15000) {
			rating=rating+30;
			}
			if (studyingSibs>0) {
				rating=rating + (studyingSibs*20);
			}
			if (studCity!=city) {
				rating=rating+50;
			}
		}
		return rating;
	}

}
