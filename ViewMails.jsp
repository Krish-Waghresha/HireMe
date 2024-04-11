

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.DBConnect.DBConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Mails</title>
        <link rel="stylesheet" type="text/css" href="AllStyle.css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
		<link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Kode+Mono:wght@400..700&display=swap" rel="stylesheet">

        
    </head>

    <body class="bgbody">
        <%
            String username = null;
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("user")) {
                        username = cookie.getValue();
                    }
                }
            }
            if (username == null) {
                response.sendRedirect("ApplicantLogin.jsp");
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
                  <li class="nav-item">
                    <a class="nav-link" href="ApplicantHome.jsp">Home <span class="sr-only">(current)</span></a>
                  </li>
                  <li class="nav-item active">
                    <a class="nav-link" href="ViewMails.jsp">View Mails</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="UploadResume.jsp">Upload Resume<span class="sr-only">(current)</span></a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="<%=request.getContextPath()%>/UserLogOut">Logout</a>
                  </li>
                </ul>
              </div>
            </nav>
    </div>

        <div id="Wrapper">
            <!-- start page -->
            <!-- <div id="advertise" class="secondcol" style=" height:100%; width:80%; position:fixed; top:auto; left:10%; "> -->
                <table border="1" class="table table-striped table-hover table-bordered ml-10 p-5" style="max-width: 90%;" ALIGN=CENTER VALIGN=MIDDLE>
                    <thead>
                        <tr>
                            <th  scope="col" colspan="4">
                                Following Employers Are Interested in You.
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            DBConnect db = new DBConnect();
                            Connection con = db.getDBconnection();
                            Statement st = con.createStatement();
                            String uname = "";
                            if (cookies != null) {
                                for (Cookie cookie : cookies) {
                                    if (cookie.getName().equals("user")) {
                                        uname = cookie.getValue();
                                    }
                                }
                            }
                            String qry = "SELECT * FROM applicant_emails WHERE a_uname='" + uname + "'";
                            ResultSet rs = st.executeQuery(qry);
                            out.println("<tr>");
                            out.println("<td>Company Reg ID</td>");
                            out.println("<td>Mail Content</td>");
                            out.println("<td>Confirmation</td>");
                            out.println("<td>Apply</td>");
                            out.println("</tr>");
                            while (rs.next()) {
                                String Confirmation=rs.getString("ConfirmationMsg");
                                String applied=rs.getString("Applied");
                                if(applied.equalsIgnoreCase("Y") && Confirmation==null)
                                    continue;
                                    
                                out.println("<tr>");
                                out.println("<td>" + rs.getString("Cmny_name") + "</td>");
                                out.println("<td>" + rs.getString("ApplicantMsg") + "</td>");

                                if(Confirmation==null)
                                    Confirmation="Pending";
                                out.println("<td>" + Confirmation + "</td>");
                                out.println("<td><a class='btn btn-outline-primary' href=\"ApplyToMail?id=" + rs.getString("id") + "&user=" + uname + " \">Apply </a></td>");
                                out.println("</tr>");
                            }
                        %>
                    
                    <tfoot>
                        <tr>
                            <td scope="row" colspan="4" class="text-muted">Please Read Mails Carefully Before Applying!</td>
                            
                        </tr>
                    </tfoot>
                    </tbody>

                </table>


            </div>
        
        </div>
        
        <footer class="bg-light mt-5 text-center text-lg-start">
            
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
