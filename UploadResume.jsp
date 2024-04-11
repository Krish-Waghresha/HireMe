
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Upload Your Resume</title>
        <link rel="stylesheet" type="text/css" href="AllStyle.css"/>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Kode+Mono:wght@400..700&display=swap" rel="stylesheet">

        <style>
            @import url(https://fonts.googleapis.com/css?family=Open+Sans:700,300);

            .frame {
                position: absolute;
                top: 50%;
                left: 50%;
                width: 400px;
                height: 400px;
                margin-top: -200px;
                margin-left: -200px;
                border-radius: 2px;
                box-shadow: 0px 12px 30px #9A616D;
                overflow: hidden;
                background: linear-gradient(to top right,lightpink 10%, #9A616D 100% );
                color: #333;
                font-family: "Open Sans", Helvetica, sans-serif;
            }

            .center {
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                width: 300px;
                height: 260px;
                border-radius: 3px;
                box-shadow: 0px 12px 20px black;
                background: #fff;
                display: flex;
                align-items: center;
                justify-content: space-evenly;
                flex-direction: column;
            }

            .title {
                width: 100%;
                height: 50px;
                border-bottom: 1px solid #999;
                text-align: center;
            }

            h1 {
                font-size: 16px;
                font-weight: 300;
                color: #666;
            }

            .dropzone {
                width: 100px;
                height: 80px;
                border: 1px dashed #999;
                border-radius: 3px;
                text-align: center;
            }

            .upload-icon {
                margin: 25px 2px 2px 2px;
            }

            .upload-input {
                position: relative;
                top: -62px;
                left: 0;
                width: 100%;
                height: 100%;
                opacity: 0;
            }

            .btn {
                display: block;
                width: 140px;
                height: 40px;
                background: #9A616D;
                color: #fff;
                border-radius: 3px;
                border: 0;
                box-shadow: 0 3px 0 0 hotpink;
                transition: all 0.3s ease-in-out;
                font-size: 14px;
            }

            .btn:hover {
                background: white;
                box-shadow: 0 3px 0 0 deeppink;
                color:#9A616D;
                border:1px solid #9A616D;
            }

            footer {
    position: relative;
    bottom: 0;
    width: 100%;
    background-color: rgba(0, 0, 0, 0.05);
    padding: 20px;
    margin-top: 50rem;
    text-align: center;
}

        </style>
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
                    <path d="M8.211 2.047a.5.5 0 0 0-.422 0l-7.5 3.5a.5.5 0 0 0 .025.917l7

.5 3a.5.5 0 0 0 .372 0L14 7.14V13a1 1 0 0 0-1 1v2h3v-2a1 1 0 0 0-1-1V6.739l.686-.275a.5.5 0 0 0 .025-.917z"/>
                    <path d="M4.176 9.032a.5.5 0 0 0-.656.327l-.5 1.7a.5.5 0 0 0 .294.605l4.5 1.8a.5.5 0 0 0 .372 0l4.5-1.8a.5.5 0 0 0 .294-.605l-.5-1.7a.5.5 0 0 0-.656-.327L8 10.466z"/></svg></span></a></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="ApplicantHome.jsp">Home <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item ">
                            <a class="nav-link" href="ViewMails.jsp">View Mails</a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="UploadResume.jsp">Upload Resume<span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="<%=request.getContextPath()%>/UserLogOut">Logout</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>

        <form name="Upload" action="Upload" method="POST" enctype="multipart/form-data" class="d-block">
            <div class="frame">
                <div class="center">
                    <div class="title">
                        <h1>Drop your Resume Here!</h1>
                    </div>

                    <!-- Add a section to display the uploaded file information -->
                    <div class="file-info">
                        <h2>Uploaded File:</h2>
                        <span class="file-name"></span>
                        <!-- Add an icon to represent the file type -->
                        <span class="file-type"></span>
                    </div>

                    <div class="dropzone">
                        <img src="http://100dayscss.com/codepen/upload.svg" class="upload-icon" />
                        <input type="file" name="file" class="upload-input" onchange="updateFileInfo()">
                        <!-- <input type="file"> -->

                    </div>

                    <button type="submit" class="btn" name="uploadbutton">Upload file</button>

                </div>
            </div>
        </form>
    

        <footer class="bg-light text-center text-lg-start">
            
            <!-- Copyright -->
            <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.05);">
                <p>"Welcome to our online job portal, where opportunities meet aspirations! We are dedicated to connecting talented individuals with their ideal career paths, fostering growth and success for both employers and job seekers. With a user-friendly interface and comprehensive listings, we streamline the job search process, ensuring efficiency and satisfaction. Our platform prioritizes transparency and integrity, striving to match candidates with positions that align perfectly with their skills and ambitions. Whether you're a seasoned professional or just starting your career journey, join us in shaping a brighter future together."</p>
                © 2024 Copyright:
              <a class="text-body">HireMe.com</a>
            </div>
            <!-- Copyright -->
          </footer>

        <script>
            function updateFileInfo() {
                var fileInput = document.querySelector('input[type=file]');
                var fileName = document.querySelector('.file-name');
                var fileType = document.querySelector('.file-type');

                if (fileInput.files.length > 0) {
                    var file = fileInput.files[0];
                    fileName.textContent = file.name;

                    // Set the file type icon based on the file extension
                    var extension = file.name.split('.').pop().toLowerCase();
                    if (extension === 'pdf') {
                        fileType.textContent = '(PDF)';
                    } else if (extension === 'txt') {
                        fileType.textContent = '(Text)';
                    } else {
                        fileType.textContent = ''; // No specific type icon for other file types
                    }
                } else {
                    fileName.textContent = '';
                    fileType.textContent = '';
                }
            }
        </script>


    </body>
</html>

