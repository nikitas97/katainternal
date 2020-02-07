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
                        <h2>CRM - Employee Relationship Manager</h2>
                </div>
        </div>

        <div id="container">
                <div id="content">
                        <!--  add our html table here -->
                        <table>
                                <tr>
                                        <th>First Name</th>
                                        <th>Last Name</th>
                                        <th>Email</th>
                                </tr>
                                <!-- loop over and print our customers -->
                                <c:forEach var="tempEmployee" items="${employees}">

                                        <tr>
                                                <td>${tempEmployee.firstName}</td>
                                                <td>${tempEmployee.lastName}</td>
                                                <td>${tempEmployee.email}</td>
                                        </tr>
                                </c:forEach>
                        </table>
                </div>
        </div>


</body>
</html>