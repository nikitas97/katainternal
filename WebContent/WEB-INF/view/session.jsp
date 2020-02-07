<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.List,org.hibernate.Session,org.hibernate.SessionFactory,org.hibernate.query.Query,
				gr.hua.dit.springmvc1.entity.Form,gr.hua.dit.springmvc1.dao.FormDAO,org.hibernate.cfg.Configuration
				" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sorted Student Forms</title>
</head>
<body>
<%
String id=request.getParameter("id"); 
int idn = Integer.parseInt(id);
session.setAttribute("sessname",idn);
SessionFactory sessionFactory=new Configuration().configure("hibernate.cfg.xml")
	.addAnnotatedClass(Form.class)
	.buildSessionFactory();
Session sessionFact = sessionFactory.getCurrentSession();
sessionFact.beginTransaction();
Form form = sessionFact.get(Form.class, idn);
if (form.isVerified()){
	out.print("The student with the ID you gave is already Verified.Here is the List with the verified Students.");
} else {
	out.print("Verified student with ID: "+ idn + "Here is the list of all the verified Students");
}
int rating=0;
if (form.getStudIncome()==0 && form.isWorkingParents()==false) {
	rating=999;
} else {
	int totalInc=form.getFamilyInc()+form.getStudIncome();
	if (totalInc<10000) {
		rating=rating+100;
	} else if (totalInc>10000 && totalInc<15000) {
		rating=rating+30;
	}
	if (form.getStudyingSibs()>0) {
		rating=rating + (form.getStudyingSibs()*20);
	}
	if (!(form.getStudCity().equals(form.getCity()))) {
		rating=rating+50;
	}
}

//int rating = calcRating(form.getCity(),form.getStudIncome(),form.isWorkingParents(),form.getFamilyInc(),form.getStudyingSibs(),form.getStudCity());
sessionFact.createQuery("update Form set isVerified=true where id="+id+"").executeUpdate();
sessionFact.createQuery("update Form set rating="+rating+" where id="+id+"").executeUpdate();
sessionFact.getTransaction().commit();
sessionFactory.close();

%>
        <div id="wrapper">
                <div id="header">
                        <h2>Sorted Forms</h2>
                </div>
        </div>

        <div id="container">
                <div id="content">
                        <!--  add our html table here -->
                        <table>
                                <tr>
                                		<th>Id|</th>
                                        <th>First Name|</th>
                                        <th>Last Name|</th>
                                        <th>City|</th>
                                        <th>Student Income|</th>
                                        <th>Working Parents|</th>
                                        <th>Family Income|</th>
                                        <th>Siblings that Study|</th>
                                        <th>Studying City|</th>
                                        <th>Department|</th>
                                        <th>Rating</th>
                                </tr>
                                <!-- loop over and print our students -->
                                <c:forEach var="tempForm" items="${forms}">

                                        <tr>
                                        		<td>${tempForm.id}</td>
                                                <td>${tempForm.firstName}</td>
                                                <td>${tempForm.lastName}</td>
                                                <td>${tempForm.city}</td>
                                                <td>${tempForm.studIncome}</td>
                                                <td>${tempForm.workingParents}</td>
                                                <td>${tempForm.familyInc}</td>
                                                <td>${tempForm.studyingSibs}</td>
                                                <td>${tempForm.studCity}</td>
                                                <td>${tempForm.department}</td>
                                                <td>${tempForm.rating}</td>
                                        </tr>
                                </c:forEach>
                        </table>
                </div>
        </div>
View the Student that are currently entitled for CTC:  
<form action="sorted-forms">
<input type="submit" value="View">
</body>
</html>