<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>YEEEEEEEEEEEEEEEET</title>
</head>
<body>
        <div id="wrapper">
                <div id="header">
                        <h2>Form Manager</h2>
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
                                        <th>Department</th>
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
                                        </tr>
                                </c:forEach>
                        </table>
                </div>
        </div>
Write here the id of the student whose form you want to verify:
<form action="session"> 
<input type="text" name="id"> 
<input type="submit" value="Verify!!">


</body>
</html>