<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Success Form</title>
</head>
<body>
	<font color="green"><h1>Hello ${userName}</h1></font>
	<h2></h2> You have successfully logged in.
	<font color="green"><h1>Welcome in Private Area</h1></font>

	<form method="post" action = "reserve">
		<div align="center">
				<%-- <form:errors path="*" cssClass="error" /> --%>
			<table>
				<tr>
					<td colspan="2"><input type="submit" value="Logout"/></td>
				</tr>
			</table>
		</div>
	</form>

</body>
</html>