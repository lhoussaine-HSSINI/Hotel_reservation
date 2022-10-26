<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Jsalam lhoussaine</title>
</head>
<body>
<h1><%= "hhhhhhhhhhhhhh" %>
</h1>
<br/>
<a href="Dashboard.jsp">dkhl hnaya</a>

<form enctype="multipart/form-data" name="form1"  method="post" action="${ pageContext.request.contextPath}/uploadImage" >
    <h1>Insert an Image into MySQL Database!</h1>
    <input type="file" name="image" required="required"/><br/><br/>
    <input type="submit" name="submit" value="Submit">
</form>

<br>
<form action="FileUploadServlet" method="post" enctype="multipart/form-data">
    <table width="400px" align="center" border=2>
        <tr>
            <td align="center" colspan="2">Form Details</td>
        </tr>
        <tr>
            <td>Id </td>
            <td><input type="number" name="id" /></td>
        </tr>
        <tr>
            <td>First Name </td>
            <td>
                <input type="text" name="firstname">
            </td>
        </tr>
        <tr>
            <td>Last Name </td>
            <td>
                <input type="text" name="lastname">
            </td>
        </tr>
        <tr>
            <td>Image Link: </td>
            <td>
                <input type="file" name="file_1">
            </td>
            <td>
                <input type="file" name="file_2">
            </td>
            <td>
                <input type="file" name="file_3">
            </td>
            <td>
                <input type="file" name="file_4">
            </td>
            <td>
                <input type="file" name="file_5">
            </td>
            <td>
                <input type="file" name="file_6">
            </td>
        </tr>
        <tr>
            <td></td>
            <td><input type="submit" value="Submit"></td>
        </tr>
    </table>

</form><br>
</body>
</html>