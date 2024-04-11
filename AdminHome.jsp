<%-- 
    Document   : AdminHome
    Created on : Jan 10, 2014, 10:42:33 PM
    Author     : Vishal
--%>

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

        <style>

            .kode-mono-font {
              font-family: "Kode Mono", monospace;
              font-optical-sizing: auto;
              font-weight: bold;
              font-style: normal;
            }
        </style>
    </head>
    <body class="bgbody" >
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
                <li class="nav-item active">
                  <a class="nav-link" href="AdminHome.jsp">Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
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

  
        
      <div class="carousel w-100 p-10 mt-1 mb-5 d-flex justify-content-center">
        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
              <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
              <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
              <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
              <div class="carousel-item">
                <div class="main-content">
                  <strong>Resume Hacks</strong>
        
        <ol class="alternating-colors">
          <li>
            <strong>Keep it Concise</strong>
            <p>Aim for a one-page resume, especially if you're a recent graduate or have limited work experience. Be selective about the information you include and focus on what's most important.</p>
          </li>
          <li>
            <strong>Highlight Key Skills</strong>
            <p>List your relevant skills prominently, using bullet points to make them easy to scan. Focus on skills that are most relevant to the job you're applying for.</p>
          </li>
          <li>
            <strong>Quantify Your Achievements</strong>
            <p>Whenever possible, quantify your achievements with numbers or percentages to demonstrate the impact you've had in previous roles. For example, "Increased sales by 20% within six months.</p>
          </li>
          <li>
            <strong>Use a Clean Format</strong>
            <p>Choose a clean and professional format that is easy to read. Stick to a standard font and size, and organize your information in a logical manner.</p>
          </li>
          <li>
            <strong>Proofread Carefully</strong>
            <p>Check your resume for spelling and grammar errors, as well as typos. Even minor mistakes can make a negative impression on employers. Consider asking a friend or mentor to review it as well</p>
          </li>
        </ol>
          </div>
        </div>
              <div class="carousel-item">
                <div class="main-content">
                  <strong>Job Hacks</strong>
        
        <ol class="alternating-colors">
          <li>
            <strong>Customize Your Application</strong>
            <p>Tailor your resume and cover letter for each job application to highlight your most relevant skills and experiences. This shows employers that you've taken the time to understand their needs and how you can contribute.</p>
          </li>
          <li>
            <strong>Network:</strong>
            <p>Utilize your network of friends, family, former colleagues, and alumni connections to uncover job opportunities. Networking can often lead to referrals and introductions that may not be advertised publicly.</p>
          </li>
          <li>
            <strong>Practice Interviewing</strong>
            <p>Practice common interview questions and scenarios to build confidence and improve your interview skills. Consider conducting mock interviews with friends or mentors to receive feedback and refine your responses.</p>
          </li>
          <li>
            <strong>Stay Persistent</strong>
            <p>Job searching can be challenging, so stay persistent and proactive. Set aside time each day to search for job openings, submit applications, and follow up on previous applications or interviews.</p>
          </li>
          <li>
            <strong>Continuously Learn and Improve</strong>
            <p>Invest in your professional development by acquiring new skills, certifications, or qualifications relevant to your field. Stay up-to-date with industry trends and developments to remain competitive in the job market.</p>
          </li>
        </ol>
          </div>
        </div>

        <div class="carousel-item active">
          <div class="main-content">
            <strong>Interview  Hacks</strong>
  
  <ol class="alternating-colors">
    <li>
      <strong>Research the Company</strong>
      <p>Learn about the company's background, culture, and recent achievements. This knowledge demonstrates your interest and helps tailor your responses during the interview.</p>
    </li>
    <li>
      <strong>Practice Common Questions</strong>
      <p>Prepare responses for common interview questions such as "Tell me about yourself" and "What are your strengths and weaknesses?" Practicing beforehand boosts your confidence and ensures smoother responses </p>
    </li>
    <li>
      <strong>Dress Appropriately</strong>
      <p>
        Choose professional attire that aligns with the company culture. Dressing appropriately shows respect for the interviewer and reflects your professionalism.
      </p>
    </li>
    <li>
      <strong>Arrive Early</strong>
      <p>Plan to arrive at least 10-15 minutes before the scheduled interview time. Punctuality demonstrates reliability and gives you time to relax and compose yourself before the interview..</p>
    </li>
    <li>
      <strong>Ask Questions:</strong>
      <p>Prepare insightful questions to ask the interviewer about the role, team dynamics, or company culture. Engaging in meaningful dialogue demonstrates your enthusiasm and interest in the position.</p>
    </li>
  </ol>
    </div>
  </div>

              <a class="carousel-control-prev" style=" left:-55px" href="#carouselExampleIndicators" role="button" data-slide="prev">
              <span class="carousel-control-prev-icon" style="background-color:grey; transform: scale(2);" aria-hidden="true"></span>
              <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" style=" right:-50px;" role="button" data-slide="next">
              <span class="carousel-control-next-icon" aria-hidden="true" style="background-color:grey; transform: scale(2);"></span>
              <span class="sr-only">Next</span>
            </a>
          </div>
        </div>
    

        

        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

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
