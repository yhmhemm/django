<%@page import="cn.com.huanyueyaoqin.House"%>
<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>找房网</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" href="css/bootstrap.css">
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
		<div class="jumbotron">
			<h1>欢迎登陆页面！</h1>
			<p>
				<a class="btn btn-primary btn-lg" role="button">了解更多</a>
			</p>
		</div>
	</div>

	<!-- 搜索栏  -->
	<div class = "container">
		<form name="search" action="search" method="get">
		<table class = "table table-hover">
			<tr>
			  <th>房屋位置</th>
			  <th>房型</th>
			  <th>朝向</th>
			  <th>面积</th>
			  <th>价格</th>
			</tr>
			<tr>
			  <td>
				  	<select name = "location" class="input-sm">
					  	<option value = "不限">不限</option>
					  	<option value = "雨湖区">雨湖区</option>
					  	<option value = "岳塘区">岳塘区</option>
					  	<option value = "湘潭县">湘潭县</option>
					  	<option value = "韶山市">韶山市</option>
					  	<option value = "湘乡市">湘乡市</option>
					</select>
				</td>
			  <td>
					<select name = "roomtype" class="input-sm">
					  	<option value = "不限">不限</option>
					  	<option value = "一室一厅">一室一厅</option>
					  	<option value = "一室两厅">一室两厅</option>
					  	<option value = "两室一厅">两室一厅</option>
					  	<option value = "两室两厅">两室两厅</option>
					</select>
			  </td>
			  <td>
				  	<select name = "toward" class="input-sm">
					  	<option value = "不限">不限</option>
					  	<option value = "朝街房">朝街房</option>
					  	<option value = "背街房">背街房</option>
					  	<option value = "城景房">城景房</option>
					  	<option value = "海景房">海景房</option>
					</select>
			  </td>
			  <td>
					<select name = "area" class="input-sm">
					  	<option value = "不限">不限</option>
					  	<option value = "0-60">60以下</option>
					  	<option value = "60-200">60~200</option>
					  	<option value = "200-500">200~500</option>
					  	<option value = "500以上">500以上</option>
					</select>
			  </td>
			  <td>
				  	<select name = "price" class="input-sm">
					  	<option value = "不限">不限</option>
					  	<option value = "0-100">100元以下</option>
					  	<option value = "100-200">100元~200元</option>
					  	<option value = "200-300">200元~300元</option>
					  	<option value = "300元以上">300元以上</option>
					</select>
			  </td>
			  <td><button id = "login" onclick="btn()" class="btn btn-sm btn-primary btn-block" type="submit">查询</button></td>
			</tr>
		</table>
		</form>
	</div>
	
	
	
	<br><br><br>
	<%List<House> houses = (List)request.getAttribute("Houses");
	if(houses!=null){
	%>
	<div class = "container">
	<p class="lead">查询结果</p></div>
	<div class = "container">
		<table class = "table table-hover table-striped">
			<tr>
			  <th>房屋位置</th>
			  <th>房型</th>
			  <th>朝向</th>
			  <th>面积</th>
			  <th>价格</th>
			  <th>房东</th>
			</tr>
			<% 

				for(House s:houses){
					%>
					<tr><a href="#" onclick = "">
					<td><%=s.getLocation() %></td>
					<td><%=s.getRoomtype() %></td>
					<td><%=s.getToward() %></td>
					<td><%=s.getArea() %></td>
					<td>￥<%=s.getPrice() %></td>
					<td><%=s.getUserName() %></td>
					</tr>
					<%
				}}
			%>
			
		</table>
	</div>
	
	

	<br><br><br><br><br><br>
	<!-- footer -->
	<div class="footer">
		<footer class="footer">
		<div class="container">
			<div class="row footer-top">
				<div class="col-sm-6  col-lg-5 col-lg-offset-1">
					<div class="row about">
						<div class="col-xs-3">
							<h4>关于</h4>
							<ul class="list-unstyled">
								<li><a href="/about/">关于我们</a></li>
								<li><a href="/ad/">广告合作</a></li>
								<li><a href="/links/">友情链接</a></li>
								<li><a href="/hr/">招聘</a></li>
							</ul>
						</div>
						<div class="col-xs-3">
							<h4>联系方式</h4>
							<ul class="list-unstyled">
								<li><a href="http://weibo.com/xiaomikeji" title="官方微博"
									target="_blank">新浪微博</a></li>
								<li><a href="mailto:huanyueyaoqin@qq.com">电子邮件</a></li>
							</ul>
						</div>
						<div class="col-xs-3">
							<h4>旗下网站</h4>
							<ul class="list-unstyled">
								<li><a href="http://www.Apple.com/" target="_blank">Apple</a>
								</li>
								<li><a href="http://www.Microsoft.com/" target="_blank">Microsoft</a>
								</li>
								<li><a href="http://www.z.cn/" target="_blank">Amazon</a></li>
							</ul>
						</div>
						<div class="col-xs-3">
							<h4>赞助商</h4>
							<ul class="list-unstyled">
								<li><a href="http://www.hnust.edu.cn/" target="_blank">湖南科技大学</a>
								</li>
								<li><a href="https://www.baidu.com" target="_blank">百度</a>
								</li>
							</ul>
						</div>
					</div>

				</div>
			</div>
			<hr />
			<div class="row footer-bottom">
				<ul class="list-inline text-center">
					<li><a href="http://www.miibeian.gov.cn/" target="_blank">京ICP备6666666号</a>
					</li>
					<li>京公网安备2333333333333</li>
				</ul>
			</div>
		</div>
		</footer>
	</div>


	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	  

	<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
	<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>

</html>
