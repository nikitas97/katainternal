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
                        <h2>Student Manager</h2>
                </div>
        </div>

        <div id="container">
                <div id="content">
                        <!--  add our html table here -->
                        <table>
                                <tr>
                                		<th>Id</th>
                                        <th>First Name</th>
                                        <th>Last Name</th>
                                        <th>Department</th>
                                </tr>
                                <!-- loop over and print our students -->
                                <c:forEach var="tempStud" items="${students}">

                                        <tr>
                                        		<td>${tempStud.id}</td>
                                                <td>${tempStud.firstName}</td>
                                                <td>${tempStud.lastName}</td>
                                                <td>${tempStud.department}</td>
                                        </tr>
                                </c:forEach>
                        </table>
                </div>
        </div>


</body>
</html>