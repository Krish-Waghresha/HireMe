<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="AllStyle.css"/>
        <title>Delete User</title>

        <link rel="stylesheet" type="text/css" href="AllStyle.css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
		<link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Kode+Mono:wght@400..700&display=swap" rel="stylesheet">


        

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

            #result{
                width:100%;
                margin:3rem 5rem 5rem 10rem;
                /* display: flex; */
                /* justify-content: center; */
                /* align-items: center; */
            }
        </style>

        <script>
            function getUsers(){
                
                textsearch=Search.txtsearch.value;
                ob=new XMLHttpRequest();

                ob.open("GET","SearchUser?txtsearch="+textsearch,false);
           
            ob.send();
            document.querySelector("#result").innerHTML=ob.responseText;
            }
        </script>

        
    </head>
    <body class="bgbody" onload="getUsers()">
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
                  <li class="nav-item ">
                    <a class="nav-link" href="AdminApproveCmpny.jsp">Approve Company</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="AdminDeleteCmpny.jsp">Delete Company<span class="sr-only">(current)</span></a>
                  </li>
                  <li class="nav-item active">
                    <a class="nav-link" href="AdminDeleteUser.jsp">Delete User<span class="sr-only">(current)</span></a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="<%=request.getContextPath()%>/AdminLogOut">Logout</a>
                  </li>
                </ul>
              </div>
            </nav>
    </div>
               <div>
            <form name="Search" name="Search" action="SearchUser" method="GET">

                <table ALIGN=CENTER VALIGN=MIDDLE>
                    <thead>
                        <tr>

                            <th colspan="2">Search Panel</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            
                            <td colspan="2">Enter First name or last name or middle name</td>
                        </tr>
                        <tr>
                            <td><input type="text" name="txtsearch" value=""/></td>
                            <td><input type="button" value="Search" class="btn btn-info" onclick="getUsers()"/></td>
                        </tr>

                    </tbody>
                </table>
            </form>
           
            <div id="result" style="max-width: 50%;">

            </div>
        </div>

        <footer class="bg-light  text-center text-lg-start">
            
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
