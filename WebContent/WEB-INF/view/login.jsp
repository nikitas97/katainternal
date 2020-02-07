<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<style>
* {
  box-sizing: border-box;
}

input[type=text], select, textarea {
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  resize: vertical;
}

input[type=password], select, textarea {
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  resize: vertical;
}

label {
  padding: 12px 12px 12px 0;
  display: inline-block;
}

input[type=submit] {
  background-color: blue;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  float: right;
}

input[type=submit]:hover {
  background-color: blue; color: white;
}

.container {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}

.col-25 {
  float: left;
  width: 25%;
  margin-top: 6px;
}

.col-75 {
  float: left;
  width: 75%;
  margin-top: 6px;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {
  .col-25, .col-75, input[type=submit] {
    width: 100%;
    margin-top: 0;
  }
}
</style>
</head>
<body>
<div class="ui segment">

        <h3>Login</h3>
        

        <form:form action="${pageContext.request.contextPath}/authUser" method="POST">
        <c:if test="${param.error != null}">
        </c:if>
        <div class="container">
        	<div class="row">
            	<div class="col-25">
        		        <label for="username">User Name</label>
        		</div>
        		<div class="col-75">        
                        <input type="text" name="username" placeholder="Username"/>
                </div>
            </div>
            <div class="row">
            	    <div class="col-25">
                        <label for="password">Password</label>
                    </div>
                    <div class="col-75">    
                        <input type="password" name="password" placeholder="Password"/>
                    </div>
            </div>
            <div class="row">
                        <input type="submit" value="Login" />
            </div>
        </div>    
        </form:form>
        
</div>
</body>
</html>
