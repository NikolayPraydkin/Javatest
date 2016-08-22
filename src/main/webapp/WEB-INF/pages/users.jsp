<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<html>
<head>
  <title>Users Page</title>

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
</head>
<body>
<a href="../../index.jsp">Back to main menu</a>

<br/>
<br/>

<h1>User List</h1>


<form method="post" action="/showMessage">
<label for="text">User search:</label>

<input type="text" id="text" name="text"  placeholder="People are looking for?"/>
<br/>
<br/>
</form>




<div id="pagination">

  <c:if test="${!empty users}">
    <table class="tg">
      <tr>
        <th width="50">ID</th>
        <th width="120">Name</th>
        <th width="120">Age</th>
        <th width="120">Admin</th>
        <th width="120">Created Date</th>
        <th width="80">Edit</th>
        <th width="80">Delete</th>

      </tr>

      <c:forEach items="${users}" var="user">
        <tr>
          <td>${user.id}</td>
          <td><a href="/usersdata/${user.id}" target="_blank">${user.name}</a></td>
          <td>${user.age}</td>
          <td>${user.admin}</td>
          <td>${user.date}</td>
          <td><a href="<c:url value='/edit/${user.id}'/>">Edit</a></td>
          <td><a href="<c:url value='/delete/${user.id}'/>">Delete</a></td>
        </tr>
      </c:forEach>
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
  </c:if>

  <c:url value="/users" var="prev">
    <c:param name="page" value="${page-1}"/>
  </c:url>
  <c:if test="${page > 1}">
    <a href="<c:out value="${prev}" />" class="pn prev">Prev</a>
  </c:if>

  <c:forEach begin="1" end="${maxPages}" step="1" varStatus="i">
    <c:choose>
      <c:when test="${page == i.index}">
        <span>${i.index}</span>
      </c:when>
      <c:otherwise>
        <c:url value="/users" var="url">
          <c:param name="page" value="${i.index}"/>
        </c:url>
        <a href='<c:out value="${url}" />'>${i.index}</a>
      </c:otherwise>
    </c:choose>
  </c:forEach>
  <c:url value="/users" var="next">
    <c:param name="page" value="${page + 1}"/>
  </c:url>
  <c:if test="${page + 1 <= maxPages}">
    <a href='<c:out value="${next}" />' class="pn next">Next</a>
  </c:if>
</div>



<h1>Add a User</h1>

<c:url var="addAction" value="/users/add"/>

<form:form action="${addAction}" commandName="user">
  <table>
    <c:if test="${!empty user.name}">
      <tr>
        <td>
          <form:label path="id">
            <spring:message text="ID"/>
          </form:label>
        </td>
        <td>
          <form:input path="id" readonly="true" size="8" disabled="true"/>
          <form:hidden path="id"/>
        </td>
      </tr>
    </c:if>
    <tr>
      <td>
        <form:label path="name">
          <spring:message text="Name"/>
        </form:label>
      </td>
      <td>
        <form:input path="name"/>
      </td>
    </tr>
    <tr>
      <td>
        <form:label path="admin">
          <spring:message text="Admin"/>
        </form:label>
      </td>
      <td>
        <form:checkbox  path="admin"/>
      </td>
    </tr>
    <tr>
      <td>
        <form:label path="age">
          <spring:message text="Age"/>
        </form:label>
      </td>
      <td>
        <form:input path="age"/>
      </td>
    </tr>

      <td colspan="2">
        <c:if test="${!empty user.name}">
          <input type="submit"
                 value="<spring:message text="Edit User"/>"/>
        </c:if>
        <c:if test="${empty user.name}">
          <input type="submit"
                 value="<spring:message text="Add User"/>"/>
        </c:if>
      </td>
    </tr>
  </table>
</form:form>
</body>
</html>