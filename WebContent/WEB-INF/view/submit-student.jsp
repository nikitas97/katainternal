<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.List,org.hibernate.Session,org.hibernate.SessionFactory,org.hibernate.query.Query,
				gr.hua.dit.springmvc1.entity.Form,gr.hua.dit.springmvc1.entity.Student,
				gr.hua.dit.springmvc1.entity.Student_authorities,
				gr.hua.dit.springmvc1.dao.FormDAO,org.hibernate.cfg.Configuration,
				gr.hua.dit.springmvc1.dao.StudentDAO
				" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Submitted</title>
</head>
<body>
<%
String id=request.getParameter("id"); 
int idn = Integer.parseInt(id);
session.setAttribute("sessname",idn);
String firstname=request.getParameter("firstname");
String lastname=request.getParameter("lastname");
String username=request.getParameter("username");
String userpass=request.getParameter("userpass");
String email = request.getParameter("email");
String telnumberstr = request.getParameter("telnum");
long telnumber = Long.parseLong(telnumberstr);
String department = request.getParameter("department");

SessionFactory sessionFactory=new Configuration().configure("hibernate.cfg.xml")
.addAnnotatedClass(Student.class)
.addAnnotatedClass(Student_authorities.class)
.buildSessionFactory();
Session sessionFact = sessionFactory.getCurrentSession();

Student student = new Student(idn,firstname,lastname,username,userpass,email,telnumber,department);
Student_authorities student_authority = new Student_authorities(username,"ROLE_USER");
sessionFact.beginTransaction();

sessionFact.save(student);
sessionFact.save(student_authority);
sessionFact.getTransaction().commit();
sessionFactory.close();


%>

        <div id="wrapper">
                <div id="header">
                        <h2>Submitted Student</h2>
                </div>
        </div>
        
        
</body>
</html>