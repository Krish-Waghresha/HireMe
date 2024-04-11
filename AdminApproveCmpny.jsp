
<%@page import="java.sql.DriverManager"%>
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
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
		<link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Kode+Mono:wght@400..700&display=swap" rel="stylesheet">

        <title>Approve Company</title>

        

        <style>
            .card{
                max-width: 100%;
                display: flex;
                justify-content: center;
            }
            .card table{
                max-width: 70%;
            }

            footer{
              margin-top:50rem;
            }
        </style>

        <script>
          function approve()
          {
            cmpname=document.querySelector("#app_btn").value;
            ob=new XMLHttpRequest();
            ob.open("GET","ApproveC?REGUID=" + cmpname,false);
            ob.send();

            if(ob.responseText!=null){
              
              alert("Approved Successfully");
              location.reload();
            }else
            alert("Company Was Not Approved!");


          }
        </script>
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
                    <a class="nav-link" href="AdminHome.jsp">Home <span class="sr-only">(current)</span></a>
                  </li>
                  <li class="nav-item active">
                    <a class="nav-link" href="AdminApproveCmpny.jsp">Approve Company</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="AdminDeleteCmpny.jsp">Delete Company<span class="sr-only">(current)</span></a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="AdminDeleteUser.jsp">Delete User<span class="sr-only">(current)</span></a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="<%=request.getContextPath()%>/AdminLogOut">Logout</a>
                  </li>
                </ul>
              </div>
            </nav>
    </div>
        <div class="card">
            <table  ALIGN=CENTER VALIGN=MIDDLE class="table table-striped table-bordered table-hover">
                <%


                  DBConnect db=new DBConnect();
                  Connection con=db.getDBconnection();
                  Statement st=con.createStatement();
                    String qry = "SELECT C_reg,C_Name,C_Approve,C_Address  FROM company_list WHERE C_Approve='N' ";
                    ResultSet rs = st.executeQuery(qry);
                    
                        

                    String action1 = "Approve";

                    out.println("<tr>");
                    out.println("<td>Company Reg ID</td>");
                    out.println("<td>Company Name</td>");
                    out.println("<td>Company Address</td>");
                    out.println("<td>Action</td>");
                    out.println("<td>View Details</td>");
                    out.println("</tr>");

                    if(!rs.isBeforeFirst())
                    {
                        %>
                        <tr  >
                            <td style="text-align: center;" colspan=5>Nothing to Approve</td>
                        </tr>
                        <% 
                    }
                    while (rs.next()) {
                        out.println("<tr>");
                        
                        out.println("<td>" + rs.getString("C_reg") + "</td>");
                        out.println("<td>" + rs.getString("C_Name") + "</td>");
                        out.println("<td>" + rs.getString("C_Address") + "</td>");
                        %>
                        <input type="text" id="app_btn" value="<%= rs.getString(1) %>" style="display: none;">
                        <td><button class='btn btn-success' onclick='approve()'> Approve </button></td>
                        <%
                        out.println("<td><a class='btn btn-info' href=\"ShowDetails?REGUID=" + rs.getString("C_reg") + "\">Details </a></td>");
                        out.println("</tr>");
                    }
                %>
            </table>



            <footer class="bg-light  text-center text-lg-start">
            
              <!-- Copyright -->
              <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.05);">
                  <p>"Welcome to our online job portal, where opportunities meet aspirations! We are dedicated to connecting talented individuals with their ideal career paths, fostering growth and success for both employers and job seekers. With a user-friendly interface and comprehensive listings, we streamline the job search process, ensuring efficiency and satisfaction. Our platform prioritizes transparency and integrity, striving to match candidates with positions that align perfectly with their skills and ambitions. Whether you're a seasoned professional or just starting your career journey, join us in shaping a brighter future together."</p>
                  © 2024 Copyright:
                <a class="text-body">HireMe.com</a>
              </div>
              <!-- Copyright -->
            </footer>
        </div>
    </body>
</html>
