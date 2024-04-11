<%-- 
    Document   : SendMail
    Created on : Feb 6, 2014, 10:08:21 PM
    Author     : Vishal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">       
        <link rel="stylesheet" type="text/css" href="AllStyle.css"/>
        <title>Send Mail</title>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
		<link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Kode+Mono:wght@400..700&display=swap" rel="stylesheet">

        <style>
            .card{
                box-shadow: 0px 15px 15px #000;
                width:120%;
                display: flex;
                align-items: center;
            }
            .submit-btn{
                display: flex;
                justify-content: center;
            }
        </style>
    </head>
    <body class="bgbody">
        <%
            String username = null;
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("company")) {
                        username = cookie.getValue();
                    }
                }
            }
            if (username == null) {
                out.println("Please Log in with your username...");;
                response.sendRedirect("EmployerLogin.jsp");
            }
        %>
        <div class="mb-4" id="header"> 
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
              <a class="navbar-brand"><span class="kode-mono-font display-5 fw-bold mb-0 " style="color:#9A616D;">HireMe<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-mortarboard-fill" viewBox="0 0 16 16">
                <path d="M8.211 2.047a.5.5 0 0 0-.422 0l-7.5 3.5a.5.5 0 0 0 .025.917l7.5 3a.5.5 0 0 0 .372 0L14 7.14V13a1 1 0 0 0-1 1v2h3v-2a1 1 0 0 0-1-1V6.739l.686-.275a.5.5 0 0 0 .025-.917z"/>
                <path d="M4.176 9.032a.5.5 0 0 0-.656.327l-.5 1.7a.5.5 0 0 0 .294.605l4.5 1.8a.5.5 0 0 0 .372 0l4.5-1.8a.5.5 0 0 0 .294-.605l-.5-1.7a.5.5 0 0 0-.656-.327L8 10.466z"/></svg></span></a></a>
              <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
              </button>
              <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                  <li class="nav-item ">
                    <a class="nav-link" href="ApplicantHome.jsp">Home <span class="sr-only">(current)</span></a>
                  </li>
                  <li class="nav-item active ">
                    <a class="nav-link" href="SearchCandidate.jsp">Search Candidate</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="ViewApplied.jsp">View Applied Candidate <span class="sr-only">(current)</span></a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="<%=request.getContextPath()%>/CompanyLogOut">Logout</a>
                  </li>
                </ul>
              </div>
            </nav>
          </div>

        <div class="d-flex justify-content-center align-items-center" style="max-width: 150%;">
            <form action="SendMail" method="POST">
                <table class="table table-hover table-borderless card">
                    <thead>
                        <tr>

                            <th>Send Mail To Selected User</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Company REG ID</td>
                            <%
                                if (cookies != null) {
                                    for (Cookie cookie : cookies) {
                                        if (cookie.getName().equals("company")) {
                                            username = cookie.getValue();
                                        }
                                    }
                                }
                                out.println("<td>");
                                out.println("<input name=\"cmp_reg\" type=\"text\" value=\"" + username + "\">");
                                out.println("</td>");
                            %>

                        </tr>
                        <tr>
                            <td>To candidate</td>
                            <td><input type="text" name="user_id" id="id" size="20" value='<%=request.getParameter("UID")%>'></td>
                        </tr>
                        <tr>
                            <td>Content</td>
                            <td><textarea name="content" rows="10" cols="25">
Dear candidate you are selected in our company for the _____ interview 

The Date :___
Venue:___
                                </textarea></td>
                        </tr>
                        
                            <tr colspan="2" class="submit-btn">
                                <td><input type="submit" value="Send Mail" class="btn btn-outline-info" /></td>

                            </tr>
                            
                        </tbody>
                    </table>
            </form>



        </div>
    </body>
</html>
