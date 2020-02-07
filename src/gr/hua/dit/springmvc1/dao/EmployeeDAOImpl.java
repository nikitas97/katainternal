package gr.hua.dit.springmvc1.dao;

import java.util.List;

import gr.hua.dit.springmvc1.entity.Employee;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

@Service
public class EmployeeDAOImpl implements EmployeeDAO {
	
	@Autowired
    private SessionFactory sessionFactory;
    
    @Override
    @Transactional
    public List<Employee> getEmployees() {
            // get current hibernate session
            Session currentSession = sessionFactory.getCurrentSession();
            
            // create a query
            Query<Employee> query = currentSession.createQuery("from Employee", Employee.class);
            
            
            // execute the query and get the results list
            List<Employee> employees = query.getResultList();
                            
            //return the results
            return employees;
    }

    
}
