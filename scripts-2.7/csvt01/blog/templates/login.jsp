<%@ page language="java" import="java.util.*"  contentType="text/html; charset=UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'login.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/signin.css">
	<link rel="stylesheet" href="css/navbar-static-top.css">
  </head>
  
  <body>
<div class="navbar">
		<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<a class="navbar-brand" href="/FindHouses/index.jsp"><strong>找房网</strong>
				</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="/FindHouses/index.jsp">首页</a>
					<li><a href="/FindHouses/about.jsp">关于</a> 
					<%
					String userName = null;
					if(session.getAttribute("userName") != null)
						 userName = session.getAttribute("userName").toString();
					
					if(userName == null){
					%>
					
					<li><a href="/FindHouses/login.jsp">登陆</a>
					<li><a href="/FindHouses/register.jsp">注册</a> <%}else {
					
						if("Admin@qq.com".equals(userName)){%>
							<li><a href="/FindHouses/Admin.jsp"><font color="red"><%=userName%></font>	
					<%}else{%>
					<li><a href="/FindHouses/userInfo.jsp"><font color="red"><%=userName%></font>
					</a> <%}}%>
					</li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid --> </nav>
	</div>

  
    <div class="container">
   	
      <form class="form-signin" name="loginForm" action="login" method="post">
        <h2 class="form-signin-heading">用户登陆</h2>
        <label for="inputEmail" class="sr-only">Email address</label>
        <input type="email" name="inputEmail" class="form-control" placeholder="邮箱" required autofocus>
        
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" name="inputPassword" class="form-control" placeholder="密码" required>
        
        <div class="checkbox">
          <label>
            <input type="checkbox" value="remember-me"> 记住密码
          </label>
        </div>
        
        <button class="btn btn-lg btn-primary btn-block" type="submit">登陆</button>
        
      </form>

    </div> <!-- /container -->

    <!-- Placed at the end of the document so the pages load faster -->
    <script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
    <script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

  </body>
</html>
