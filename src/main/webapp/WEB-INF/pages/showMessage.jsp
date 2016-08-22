<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<body>
<h1>Point users</h1>
<style type="text/css">
  .tg {
    border-collapse: collapse;
    border-spacing: 0;
    border-color: #ccc;
  }

  .tg td {
    font-family: Arial, sans-serif;
    font-size: 14px;
    padding: 10px 5px;
    border-style: solid;
    border-width: 1px;
    overflow: hidden;
    word-break: normal;
    border-color: #ccc;
    color: #333;
    background-color: #fff;
  }

  .tg th {
    font-family: Arial, sans-serif;
    font-size: 14px;
    font-weight: normal;
    padding: 10px 5px;
    border-style: solid;
    border-width: 1px;
    overflow: hidden;
    word-break: normal;
    border-color: #a6cc86;
    color: #2b0c33;
    background-color: #f0f0f0;
  }

  .tg .tg-4eph {
    background-color: #f9f9f9
  }
</style>
<table class="tg">
  <tr>
    <th width="50">ID</th>
    <th width="120">Name</th>
    <th width="120">Age</th>
    <th width="120">Admin</th>
    <th width="120">Created Date</th>
  </tr>
<c:forEach items="${showMessage}" var="user">
  <tr>
    <td>${user.id}</td>
    <td>${user.name}</td>
    <td>${user.age}</td>
    <td>${user.admin}</td>
    <td>${user.date}</td>

  </tr>
</c:forEach>
  </table>
<br/><br/><br/>
<a href="/"> << Back to home</a>
</body>
</html>