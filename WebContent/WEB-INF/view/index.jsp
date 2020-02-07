<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<style>

ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  width: 18%;
  background-color: #333;
  position: fixed;
  height: 100%;
  overflow: auto;
}

li a {
  display: block;
  color: white;
  padding: 20px 16px;
  text-decoration: none;
}

li a:hover{
  background-color: #111;
  color: white;
}
</style>
</head>
<body>
<ul>
  <li><a href="<c:url value="/about"></c:url>">About</a></li>
  <li><a href="<c:url value="/student/list"></c:url>">Λίστα Φοιτητών</a></li>
  <li><a href="<c:url value="/form/list"></c:url>">Λίστα Αιτήσεων Σίτισης</a></li>
  <li><a href="<c:url value="/form/sorted-forms"></c:url>">Λίστα Εγκεκριμένων Αιτήσεων</a></li>
  <li><a href="<c:url value="/student-form"></c:url>">Εγγραφή Νέου Φοιτητή</a></li>
  <li><a href="<c:url value="/employee/list"></c:url>">Λίστα Employees</a></li>
  <sec:authorize access="hasRole('ADMIN')">
  <li><a href="<c:url value="/form/availability"></c:url>">Ενημέρωση Διαθέσιμων Θέσεων Σίτισης</a></li>
  </sec:authorize>
  <li><a href="<c:url value="/login"></c:url>">Αποσύνδεση</a></li>
</ul>

<div style="margin-left:20%;padding:1px 16px;height:1000px;">

</div>

</body>
</html>