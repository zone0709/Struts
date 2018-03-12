<%-- 
    Document   : search
    Created on : Mar 12, 2018, 3:25:46 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Page</title>
    </head>
    <body>
        <font color="red">Welcome,${sessionScope.LoginStrutsActionForm.username}</font>
        <h1>Search Page</h1>
        <form action="search.do">
            Search Value <input type="text" name="searchValue" value="${param.searchValue}" /><br>
            <input type="submit" value="Search" />
        </form><br/>
        <c:set var="searchValue" 
               value="${requestScope.SearchStrutsActionForm.searchValue}"/>
        <c:if test="${not empty searchValue}">
            <c:set var="result" value="${requestScope.SearchStrutsActionForm.accounts}"/>
            <c:if test="${not empty result}">
                <table border="1">
                    <thead>
                        <tr>
                            <th>No.</th>
                            <th>Username</th>
                            <th>Password</th>
                            <th>Last name</th>
                            <th>Role</th>
                            <th>Delete</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="dto" items="${result}" varStatus="counter">
                            <tr>
                                <td>
                                    ${counter.count}
                                </td>
                                <td>
                                    ${dto.username}
                                </td>
                                <td>
                                    ${dto.password}
                                </td>
                                <td>
                                    ${dto.lastname}
                                </td>
                                <td>
                                    ${dto.role}
                                </td>
                                <td>
                                    <c:url var="delLink" value="delete.do">
                                        <c:param name="pk" value="${dto.username}"/>
                                        <c:param name="searchValue" value="${searchValue}"/>
                                    </c:url>
                                    <a href="${delLink}">Delete</a>
                                </td>
                            </tr>
                        </c:forEach>

                    </tbody>
                </table>

            </c:if>
            <c:if test="${empty result}">
                <h2>No recored is matched!!!!</h2>
            </c:if>
        </c:if>    
    </body>
</html>
