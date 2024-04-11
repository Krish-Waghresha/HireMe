<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="AllStyle.css"/>
        <title>Search For Candidates</title>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
		<link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Kode+Mono:wght@400..700&display=swap" rel="stylesheet">

        <style>

            .kode-mono-font {
              font-family: "Kode Mono", monospace;
              font-optical-sizing: auto;
              font-weight: bold;
              font-style: normal;
            }
            #result{
                max-width: 80%;
                margin-left: 3rem;
            }

            footer{
                margin-top:50rem;
            }
        </style>

        <script>
        function fun()
        {
            ob=new XMLHttpRequest();
            edu_level= Candidate.edu_level.value
            marks= Candidate.marks.value;

            ob.open("GET","SearchCandidate?edu_level="+edu_level+"&marks="+marks,false);
           
            ob.send();
            document.querySelector("#result").innerHTML=ob.responseText;
           
        }
        </script>
    </head>
    <body>
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
                  <li class="nav-item active">
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
                    <form action="SearchCandidate" method="POST" name="Candidate">
                <table class="m-5">
                    <thead>
                        <tr>
                            <th>
                                Enter your Criteria For Candidates
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Education Level</td> 
                            <td>Marks Obtained</td>
                        </tr>
                        <tr>

                            <td class="m-2"><select name="edu_level" onchange="fun()">
                                    <option>Some High School Coursework</option>
                                    <option>High School</option>
                                    <option>Certification</option>
                                    <option>Vocational</option>
                                    <option>Associate Degree</option>
                                    <option>Bachelor Degree</option>
                                    <option>Master Degree</option>
                                    <option>Doctorate</option>
                                    <option>Professional</option>
                                </select></td>
                            
                                <td>
                                    <input type="text" name="marks" value="0" onchange="fun()" />
                                </td>
                        </tr>
                        <tr>
                            
                            
                        </tr>

                    </tbody>

                </table>

                <div  id="result">
                    The Result Will Appear here!
                </div>
            </form>




        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
  
    </div>
    <footer class=" footer bg-light  text-center text-lg-start">
            
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
