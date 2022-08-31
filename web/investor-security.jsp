<%-- 
    Document   : history
    Created on : Jul 4, 2022, 2:33:06 PM
    Author     : ABRAHAM
--%>

<%@page import="imageloader.Loader"%>
<%@page import="model.*"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
  
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Settings</title>
 
<link rel="stylesheet" href="https://cdn.jsdelivr.net/chartist.js/latest/chartist.min.css">
  	  
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css">
   
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/js/bootstrap.min.js"></script>
 <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/chart.js@3.8.0/dist/chart.min.js"></script> 
 <link rel="stylesheet" href="fontawesome-free-6.1.1-web/css/all.css" />
  
  <style>
  
.sidebar {
  position: fixed;
  top: 0;
  bottom: 0;
  left: 0;
  z-index: 100;
  padding: 90px 0 0;
  box-shadow: inset -1px 0 0 rgba(0, 0, 0, .1);
  z-index: 99;
}

@media (max-width: 767.98px) {
  .sidebar {
    top: 11.5rem;
    padding: 0;
  }
}

.navbar {
  box-shadow: inset 0 -1px 0 rgba(0, 0, 0, .1);
}

@media (min-width: 767.98px) {
  .navbar {
    top: 0;
    position: sticky;
    z-index: 999;
  }
}

.sidebar .nav-link {
  color: #333;
}

.sidebar .nav-link.active {
  color: #0d6efd;
}

i{
  font-size: 1.3rem;
  text-align: left;
}

.nav-item a{
  transition: .5s ease;
  text-align: left;
}

.nav-item a:hover{
  color: #0d6efd;
}

iframe{
    width: 100%;
    height: 120vh;
}

    main .model-container{
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100vh;
            pointer-events: none;
            opacity: 0;
            //background-color:rgba(0, 0, 0, 0.3);
            transition: opacity 0.3s ease-in;
        }
        
        main .model-container.show{
            opacity: 1;
            pointer-events: auto;
        }
        main .model-container .model{
            background-color: #fff;
            padding: 30px 50px;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.2);            
        }
        
        .model p{
            opacity: 0.7;
            font-size: 18px;
        }
        
        .form-container.blu{
            filter: blur(5px);
        }
        
        
  
  
  </style>
  

</head>
<body>
    <script type = "text/javascript" >
          history.pushState(null, null, 'investor-security.jsp');
          window.addEventListener('popstate', function (event) {
              history.pushState(null, null, 'investor-security.jsp');
      });

     </script>
     
    <%
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache"); 
response.setHeader ("Expires", "0"); //prevents caching at the proxy server
%>
<%!String name="", position="",email="", pic="",pic2="", id="", transid="", phone="", verificationid="", date = "", loanamount="", total = "", interest="", firstname="", lastname="", applicantemail="", email2="";%>
    
    <%
    
    
       AdminUser s = (AdminUser)session.getAttribute("staff");
      name=s.getFirstname() + " " + s.getLastname();
      position=s.getPosition();
      email=s.getEmail();
      session.setAttribute("agentname", name);
      session.setAttribute("agentemail", email);
    
    if((position.equals("Investor") || position.equals("Admin")) &&  email!=null){
        
    }else{
    response.sendRedirect("index.jsp");
    } 
    %>

<nav class="navbar navbar-light bg-light p-3">
  <div class="d-flex col-12 col-md-3 col-lg-2 mb-2 mb-lg-0 flex-wrap flex-md-nowrap justify-content-between">
      <a class="navbar-brand" href="InvestorDashboard.jsp">
          <img src="photos/users/<%=pic%>" width="40px" class="rounded-pill">&nbsp; <%=s.getPosition() %>
		  
      </a>
      <button class="navbar-toggler d-md-none collapsed mb-3" type="button" data-toggle="collapse" data-target="#sidebar" aria-controls="sidebar" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
      </button>
  </div>
  <div class="col-12 col-md-4 col-lg-2">
  <form action="kambok.jsp">
      <div class="input-group">
  <input type="text" class="form-control" placeholder="Search">
  <button class="btn btn-dark" type="submit">Search</button>
  </div>
  </form>

  </div>
  <div class="col-12 col-md-5 col-lg-8 d-flex align-items-center justify-content-md-end mt-3 mt-md-0">
      <div class="mr-3 mt-1">

      </div>
      <div class="dropdown">
          <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-expanded="false">
            Hello, <%=s.getFirstname()+" "+s.getLastname()%>
          </button>
          <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
            <li><a class="dropdown-item" href="logout"><i class="fa-solid fa-right-from-bracket mx-2 sicon"></i><span class="txt">Sign out</span></a></li>
          </ul>
        </div>
  </div>
</nav>
    
<div class="container-fluid">
<nav id="sidebar" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
  <div class="row">
        
<div class="position-sticky pt-md-5">
  <ul class="nav flex-column mx-3" id="navbar">
      <li class="nav-item  active">
        <a class="nav-link" aria-current="page" href="investor-bio.jsp">
          <i class="fa-solid fa-id-card"></i>
          <span class="ml-2">Profile</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" aria-current="page" href="bio.jsp">
          <i class="fa-solid fa-building-columns"></i>
          <span class="ml-2">Account Info</span>
        </a>
      </li>
      <li class="nav-item">
          <a class="nav-link active" href="investor-security.jsp">
          <i class="fas fa-lock"></i>
          <span class="ml-2">Password</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="uploadpassport.jsp">
          <i class="fas fa-upload"></i>
          <span class="ml-2">Upload Passport</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="tpin">
          <i class="fa-solid fa-key"></i>
          <span class="ml-2">Transaction Pin</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="deleteaccount.jsp">
          <i class="fas fa-trash-alt"></i>
          <span class="ml-2">Delete Account</span>
        </a>
      </li>
    </ul>
</div>
   
      <!--CONTROLLING THE ACTIVE LINK-->
<!--      <script>
         var navbar = document.getElementById("navbar");
         var link = document.getElementsByClassName("nav-link");
         for(var i = 0; i < link.length; i++){
             link[i].addEventListener("click", function(){
                 var currentLink = document.getElementsByClassName("active");
                 currentLink[0].className = currentLink[0].className.replace(" active", "");
                 this.className += " active";
             });
         }
      </script>-->
</nav>
<main class="col-md-9 ml-sm-auto col-lg-10 px-md-4 py-4">
      <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="dashboard.jsp">Home</a></li>
          <li class="breadcrumb-item active" aria-current="page">Change password</li>
        </ol>
       </nav>     
<div class="row form-container" id="formDiv">
    <div class="col-12 col-xl-1"></div>
    <div class="col-12 col-xl-10 mb-4 mb-lg-0">
        <section>
            <div class="container py-5 h-100">
              <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col-12 col-md-8">
                    <h2 class="h2 text-center text-info">Reset password</h2>
                <br><br>
                <form action="settings.jsp" method="" id="myform">                                            
                        <!-- Password input -->
                        <div class="form-outline mb-4">
                            <div class="form-group">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text p-3">
                                            <span class="fa fa-lock"></span>
                                        </span>                    
                                    </div>
                                    <input type="password" class="form-control" placeholder="Old Password" required="required" name="password" id="pass" >
                                    <input type="hidden" class="form-control"   name="password" id="pass2" value="<%=s.getPassword()%>">
                                    
                                </div>
                            </div> 
                        </div>

                        <!-- Confirm Password input -->
                        <div class="form-outline mb-4">
                            <div class="form-group">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text p-3">
                                            <span class="fa fa-lock"></span>
                                        </span>                    
                                    </div>
                                    <input type="password" class="form-control" placeholder="New password" required="required" name="newPass" id="pw" onmouseout="confirmPass();">
                                </div>
                            </div> 
                        </div>
   
                             
                          <div class="col">
                              <b id="report"></b> 
                            <!-- Simple link -->
                            <a style="float: right; display: none;" id="forgot" href="#!">Forgot password?</a>
                          </div>
                          <br>
                        <!-- Submit button -->
                        <div class="row d-flex justify-content-center">
                            <button type="submit" class="btn btn-primary btn-block mb-4" id="submitBtn"><h5>Submit</h5></button>
                        </div>
                        
                        
                </form>        
             
                </div>
              </div>
            </div>
          </section>
    </div>
  <div class="col-12 col-xl-1"></div>
</div> 
    <br><br> <br> <br> <br> <br> <br> <br> <br> <br> <br>   
<footer class="pt-5 d-flex justify-content-between">
  <span>Copyright &copy; 2022-2024 <a href="https://kambokinfotech.com">Kambok Infotech Limited</a></span>
  <ul class="nav m-0">
      <li class="nav-item">
        <a class="nav-link text-secondary" aria-current="page" href="#">Privacy Policy</a>
      </li>
      <li class="nav-item">
        <a class="nav-link text-secondary" href="#">Terms and conditions</a>
      </li>
      <li class="nav-item">
        <a class="nav-link text-secondary" href="#">Contact</a>
      </li>
    </ul>
</footer>
    <div class="row">
        <div class="col-md-12">
            <div class="model-container d-flex justify-content-center align-items-center" id="modelContainer">
               <div class="row">
                   <div class="col-md-5"></div>
                <div class="col-md-5 model text-center  ">
                   <h1>Change Password</h1>
                    <p>You're about to change your password</p>
                    <h5>Are you sure?</h5>
                    <br><br>
                    <form action="Changepassword" method="post">
                        <input type="hidden" class="form-control" placeholder="New password" required="required" name="password" id="password" value="<%= request.getParameter("newPass") %>">
                    <input type="hidden" class="form-control"  name="email" value="<%=s.getEmail()%>">
                     <button type="button" id="close-btn" class="btn btn-warning">Close</button>
                     <button type="submit"  class="btn btn-success">Yes</button>
                    </form>
                   </div>
            </div>
            </div>
        </div>
        
    </div>
  </main>
  </div>
    <script>
        const open = document.getElementById("submitBtn");
        const modelContainer = document.getElementById("modelContainer");
        const close = document.getElementById("close-btn");
        const blurContainer = document.getElementById("formDiv");
        const myform = document.getElementById("myform");
        
     
       myform.addEventListener('submit', ()=>{
            event.preventDefault();
            
            var passInput = document.getElementById("pw").value;
            var pass = document.getElementById("password");
            
            pass.value = passInput
            
            console.log(pass);
        });
        
        function confirmPass(){
            let pass = document.getElementById("pass").value;
            let pass2 = document.getElementById("pass2").value;
            let report = document.getElementById("report");
            let fg = document.getElementById("forgot");

            if(pass!=pass2){
                if(pass=="" || pass2==""){
                    report.style.color = "red";
                    report.innerHTML = "This field cannot be empty";
                    document.getElementById("submitBtn").disabled = true;
                }else{
                    report.style.color = "red";
                    report.innerHTML = "Incorrect old password";
                    fg.style.display = "block";
                    document.getElementById("submitBtn").disabled = true;
                }
            }
            else{
              
                report.innerHTML = "";
                
                fg.style.display = "none";
                document.getElementById("submitBtn").disabled = false;
            }
        }
        
        open.addEventListener('click', ()=>{
            modelContainer.classList.add('show');
            blurContainer.classList.add('blu');
        });
        close.addEventListener('click', ()=>{
            modelContainer.classList.remove('show');
            blurContainer.classList.remove('blu');
        });
    </script>
</body>
</html>
  
