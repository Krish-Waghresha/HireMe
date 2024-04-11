

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.DBConnect.DBConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="AllStyle.css"/>
        <title>View Applied Candidates</title>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
		<link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Kode+Mono:wght@400..700&display=swap" rel="stylesheet">

        <style>
            .table{
                margin-top:50px;
                max-width: 95%;
            }

            footer{
                margin-top:50rem;
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
                  <li class="nav-item ">
                    <a class="nav-link" href="SearchCandidate.jsp">Search Candidate</a>
                  </li>
                  <li class="nav-item active">
                    <a class="nav-link" href="ViewApplied.jsp">View Applied Candidate <span class="sr-only">(current)</span></a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="<%=request.getContextPath()%>/CompanyLogOut">Logout</a>
                  </li>
                </ul>
              </div>
            </nav>
          </div>
            <div id="wrapper">
                <table border="1" ALIGN=CENTER VALIGN=MIDDLE class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th colspan="3">Following Candidates are interested to work in your company!</th>
                        </tr>
                    </thead>
                    <%
                        DBConnect db = new DBConnect();
                        Connection con = db.getDBconnection();
                        Statement st = con.createStatement();
                        String regid="";
                        if (cookies != null) {
                            for (Cookie cookie : cookies) {
                                if (cookie.getName().equals("company")) {
                                     regid = cookie.getValue();
                                }
                            }
                        }
                        String qry = "SELECT * FROM applicant_emails WHERE Cmny_name='"+ regid +"' and Applied='Y' ";
                        ResultSet rs = st.executeQuery(qry);
                        out.println("<tr>");
                    out.println("<th>UserName</th>");
                    out.println("<th>Your Proposal Mail</th>");
                    out.println("<th>Send Confirmation Mail</th>");
                    
                    out.println("</tr>");
                     while (rs.next()) {
                        out.println("<tr>");                      
                        out.println("<td>" + rs.getString("a_uname") + "</td>");                      
                        out.println("<td>" + rs.getString("applicantmsg") + "</td>");                      
                        out.println("<td><a class='btn btn-outline-info' href=\"SendConfirm?id=" + rs.getString("id") + "&cmpny="+rs.getString("Cmny_name") +"&user="+rs.getString("a_uname") +" \">Send </a></td>");
                        out.println("</tr>");
                    }
                    %>
                </table>
            </div>
        </div>

        <footer class="bg-light text-center text-lg-start">
            
            <!-- Copyright -->
            <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.05);">
                <p>"Welcome to our online job portal, where opportunities meet aspirations! We are dedicated to connecting talented individuals with their ideal career paths, fostering growth and success for both employers and job seekers. With a user-friendly interface and comprehensive listings, we streamline the job search process, ensuring efficiency and satisfaction. Our platform prioritizes transparency and integrity, striving to match candidates with positions that align perfectly with their skills and ambitions. Whether you're a seasoned professional or just starting your career journey, join us in shaping a brighter future together."</p>
                © 2024 Copyright:
              <a class="text-body">HireMe.com</a>
            </div>
            <!-- Copyright -->
          </footer>
    </body>
</html>
