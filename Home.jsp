<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>

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
            .slide{
                height: 38rem;
                width: 60rem;
                border-radius: 10%;
                box-shadow:8px 8px 8px #000 ;
            }
            .carousel slide{
                box-shadow: 5px 5px 5px #FFF;
            }
            body{
                background-color: #9A616D;
            }

            :root {
	--yellow: #FFF;
	--dark: #9A616D;
	--deg: -86deg;
	--trans: all 0.4s ease 0s;
}

.content {
	width: 90vmin;
}

.content h2 {
	text-align: center;
}

.team {
	padding: 2em 0 2em 2.5em;
	margin: 0;
  display: inline-flex;
}

.member {
  width:50rem;
	margin-top: 1.5em 0 0.5em;
  margin-bottom: 2rem;
	padding: 0.73em;
	background: linear-gradient(
		83deg,
		var(--yellow) 0 97%,
		#fff0 calc(97% + 1px) 100%
	);
	position: relative;
	list-style: none;
	display: inline-block;
	transform: scale(0.85);
	transition: var(--trans);
}

.member:nth-of-type(even) {
	text-align: right;
	background: linear-gradient(
		-83deg,
		var(--yellow) 0 97%,
		#fff0 calc(97% + 1px) 100%
	);
}

.thumb {
	width: 13vmin;
	height: 13vmin;
	float: left;
	margin-right: 1.25em;
	background: linear-gradient(
		var(--deg),
		var(--dark) 0 70%,
		var(--yellow) 0% 100%
	);
	transform: rotate(-4deg);
	transition: var(--trans);
	border-radius: 0.25em;
	overflow: hidden;
	margin-left: -3em;
	padding: 0.5em;
}

.member:nth-of-type(even) .thumb {
	--deg: 86deg;
	float: right;
	margin-left: 2em;
	margin-right: -3em;
	transform: rotate(4deg);
}

.thumb img {
	width: 100%;
	height: 100%;
	border-radius: 0.25em;
	filter: grayscale(1);
	background: var(--dark);
}

.member:hover {
	transform: scale(1);
	transition: var(--trans);
	filter: drop-shadow(0px 20px 10px #0008);
}

.member:hover .thumb {
	padding: 0.1em;
	transition: var(--trans);
	transform: rotate(-1deg);
	--deg: -89deg;
}

.member:nth-of-type(even):hover .thumb {
	--deg: 91deg;
}

.member:hover .thumb img {
	filter: none;
	transition: var(--trans);
}

.description {
	padding-top: 1vmin;
}

.description p {
	padding: 0 2em;
	margin-bottom: 1em;
}

.content h3 {
	background: linear-gradient(182deg, #fff0 60%, var(--dark) 0 100%);
	display: inline;
	transform: rotate(-2deg);
	position: absolute;
	margin: 0;
	margin-top: -2.25em;
	left: 9vmin;
	padding: 0.5em 0.75em;
	color: var(--yellow);
	border-radius: 0.25em;
	font-size: 1.35em;
	transform-origin: left bottom;
}

.member:nth-of-type(even) h3 {
	left: inherit;
	right: 9vmin;
	transform: rotate(2deg);
	transform-origin: right bottom;
	background: linear-gradient(-182deg, #fff0 60%, var(--dark) 0 100%);
}

.member:hover h3 {
	transition: var(--trans);
	transform: rotate(0deg);
	background: linear-gradient(180deg, #fff0 59%, var(--dark) 0 100%);
}

.co-funder:after {
	content: "CO-FUNDER";
	font-size: 0.75em;
	position: absolute;
	top: -1.5em;
	background: var(--yellow);
	right: 4em;
	transform: rotate(3deg);
	padding: 0.35em 0.75em 0.5em;
	border-radius: 0.25em;
	color: var(--dark);
	font-weight: bold;
}

.co-funder:nth-of-type(even):after {
	right: inherit;
	left: 4em;
	transform: rotate(-3deg);
}

.description p a {
	display: inline-block;
	margin: 0.5em 0 0 0;
	background: var(--dark);
	color: var(--yellow);
	padding: 0.1em 0.5em 0.35em;
	border-radius: 0.5em;
	text-decoration: none;
	transition: var(--trans);
}
.description p a:hover {
	transition: var(--trans);
	color: var(--dark);
	background: var(--yellow);
	font-weight: bold;
}

.description p a img {
	float: left;
	width: 22px;
	filter: invert(1);
	border-radius: 0.15em;
	padding: 2px;
	background: #fff;
	margin-right: 2px;
}

            </style>
    </head>
    <body>

        <!-- start header -->
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
                      <li class="nav-item ml-4 mr-4 active">
                        <a class="nav-link" href="Home.jsp">Home <span class="sr-only">(current)</span></a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="AboutUS.html">AboutUS</a>
                      </li>
                    </ul>
                  </div>
                </nav>
        </div>

        


</div>
        <div class="carousel w-100 p-10 mt-1 mb-5 d-flex justify-content-center">
        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
              <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
              <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
              <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
              <div class="carousel-item active">
                <img class="d-block w-100 slide" src="assets/slide1.jpg" alt="First slide">
                <div class="carousel-caption d-none d-md-block">
                    <h5 class="display-4" style=" font-weight: 700; color: black;">HireMe</h5>
                    <p class="display-5" style="color: black;">OneStop Platform for Companies And Job Seekers <br>Where Talent Meets Opportunity</p>
                  </div>
              </div>
              <div class="carousel-item">
                <img class="d-block w-100 slide" src="assets/slide2.jpg" alt="Second slide">
                <div class="carousel-caption d-none d-md-block" >
                    <h3 style="border-radius: 8%;  font-weight: 700; color: black; background-color: rgba(200,200,255,0.4);">Great Talent For Recruiters </h3>
                    <a href="EmployerLogin.jsp" class="btn btn-info">Employer Login</a>
                  </div>
              </div>
              <div class="carousel-item">
                <img class="d-block w-100 slide" src="assets/slide3.jpg" alt="Third slide">
                <div class="carousel-caption d-none d-md-block" >
                    <h3 style="border-radius: 8%;  font-weight: 700; color: black; background-color: rgba(200,200,255,0.4);">Great Opportunity For Job Seekers </h3>
                    <a href="ApplicantLogin.jsp" class="btn btn-success">Applicant Login</a>
                  </div>
            </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
              <span class="carousel-control-prev-icon" aria-hidden="true"></span>
              <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
              <span class="carousel-control-next-icon" aria-hidden="true"></span>
              <span class="sr-only">Next</span>
            </a>
          </div>
        </div>
    
        <br>
        <div class="testimonials">
          <h3 class="mt-5 ml-5 display-4">Our Testimonials</h3>
          <div class="content container ml-0 w-100">

            <ul class="team row w-100">
              <li class="member col-6">
                <div class="thumb"><img src="https://assets.codepen.io/3/internal/avatars/users/default.png?fit=crop&format=auto&height=120&width=120"></div>
                <div class="description">
                  <h3>Chris Coyier</h3>
                  <p>"HireMe is a user-friendly job portal with a sleek interface and comprehensive job listings. The search functionality is robust, and I appreciated the personalized job recommendations based on my profile."<br><a href="#">@chriscoyier</a></p>
                </div>
              </li>
              <li class="member col-6">
                <div class="thumb"><img src="https://assets.codepen.io/2/internal/avatars/users/default.png?height=120&width=120"></div>
                <div class="description">
                  <h3>Alex Vazquez</h3>
                  <p>I had a great experience with HireMe. The platform's intuitive design made it easy to navigate, and I appreciated the timely notifications for new job openings. I secured multiple interviews within days of creating my profile.<br><a href="#">@quezo</a></p>
                </div>
              </li>
              <li class="member col-6">
                <div class="thumb"><img src="https://assets.codepen.io/652/internal/avatars/users/default.png?height=120&width=120"></div>
                <div class="description">
                  <h3>Marie Mosley</h3>
                  <p>HireMe exceeded my expectations with its extensive database of job opportunities. While the application process was straightforward, I found the job matching algorithm to be highly effective in connecting me with relevant positions in my desired field.<br><a href="#">@mariemosley</a></p>
                </div>
              </li>
              <li class="member col-6">
                <div class="thumb"><img src="https://assets.codepen.io/39255/internal/avatars/users/default.png?height=120&width=120"></div>
                <div class="description">
                  <h3>Stephen Shaw</h3>
                  <p>Navigating HireMe was a smooth experience, thanks to its user-friendly design and extensive job listings. I appreciated the prompt notifications for relevant openings, which helped me stay ahead in my job search."<br><a href="#">@shshaw</a></p>
                </div>
              </li>
              <li class="member col-6">
                <div class="thumb"><img src="https://cpwebassets.codepen.io/assets/packs/about-rachelsmith-6878ca76a1d9200e6c296e810050b8cb.jpg?height=120&width=120"></div>
                <div class="description">
                  <h3>Rachel Smith</h3>
                  <p>HireMe offers a comprehensive range of job postings, but its search filters could be more refined. Nonetheless, the platform's streamlined application process and responsive customer support made my job hunt much more manageable<br><a href="#">@rachsmith</a></p>
                </div>
              </li>
              <li class="member col-6">
                <div class="thumb"><img src="https://cpwebassets.codepen.io/assets/packs/about-robertkieffer-77c28f3a6efe082fd1903affae540b8a.jpg?height=120"></div>
                <div class="description">
                  <h3>Robert Kieffer</h3>
                  <p>HireMe provided an intuitive platform with a sleek interface, making job searching a breeze. The personalized job recommendations matched my preferences perfectly, leading me to my ideal job opportunity.<br><a href="#">@broofa</a></p>
                </div>
              </li>
            </ul>
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




        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    </body>
</html>
