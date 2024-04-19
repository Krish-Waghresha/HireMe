
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="AllStyle.css"/>
        <title>Latest Update</title>
    </head>
    <body class="bgbody">
        <%
            String username = null;
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("admin")) {
                        username = cookie.getValue();
                    }
                }
            }
            if (username == null) {

                response.sendRedirect("AdminLogin.jsp");
            }
        %>
        <div id="header">
            <div id="logo">

                <img src='img/url.jpg' alt='INFOSYS,HP,COGNIZANT,TRAVISCA,DEOLITE and ALSO GET MANY MORE' height=200 width="100%" />	
            </div>
            <div id="menu" class="bgbody">
                <ul id="navigation">
                    <li>
                        <a href="AdminHome.jsp">Home</a>  
                    </li>
                    <li class="sub">
                        <a href="#">Admin Task</a>   
                        <ul>
                            <li><a href="AdminApproveCmpny.jsp">Approve New Companies</a></li>
                            <li><a href="#">Delete Company Data</a></li>
                            <li><a href="#">Delete User</a></li>

                        </ul>
                    </li>
                    <li class="sub">
                        <a href="#">Update Task</a>   
                        <ul>
                            <li><a href="AdminAddLatestUpdate.jsp">Add Latest Update</a></li>


                        </ul>
                    </li>

                    <li>
                        <a href="<%=request.getContextPath()%>/AdminLogOut">LogOut</a>
                    </li> 
                </ul>

            </div>

        </div>
        <div id="Wrapper" class="bgbody">
            <form name="update" action="SubmitUpdate" method="POST">
                <table ALIGN=CENTER VALIGN=MIDDLE>
                    <thead>
                        <tr>
                            
                            <th colspan="2"></th>
                        </tr>
                        <tr>
                            
                            <th colspan="2"></th>
                        </tr>
                         <tr>
                            
                            <th colspan="2">ADD LATEST UPDATE HIGHLIGHT</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Set Title to News</td>
                            <td><input type="text" name="title" value=""/></td>
                        </tr>
                        <tr>
                            <td>Add News Content</td>
                            <td><textarea name="content" rows="10" cols="25" >
                                </textarea></td>
                        </tr>
                        <tr>
                            <td ALIGN=CENTER VALIGN=MIDDLE colspan="2">
                                <input type="submit" value="Submit" />
                            </td>
                        </tr>
                    </tbody>
                </table>

            </form>
        </div>
    </body>
</html>
