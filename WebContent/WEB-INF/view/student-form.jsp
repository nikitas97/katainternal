<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<body>
  <form action="submit-student">
  ID:<br>
  <input type="number" name="id" >
  <br><br>
  First name:<br>
  <input type="text" name="firstname" >
  <br><br>
  Last Name:<br>
  <input type="text" name="lastname" >
  <br><br>
  Username:<br>
  <input type="text" name="username" >
  <br><br>
  Password:<br>
  <input type="text" name="userpass" >
  <br><br>
  Email:<br>
  <input type="text" name="email" >
  <br><br>
  Telephone Number:<br>
  <input type="number" name="telnum" >
  <br><br>
  <select name="department">
    <option >DIT</option>
    <option >NUT</option>
    <option >GD</option>
  </select>
  <br><br>

  <input type="submit">

</body>
</html>