<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<meta name="keywords" content="洛阳，旅游，旅游景点信息,旅游资讯" />
<meta name="description" content="洛阳旅游网，旅游，旅游景点，旅游资讯" />
<title></title>
<link rel="Bookmark" href="favicon.ico">
<link rel="Shortcut Icon" href="favicon.ico" />
<link rel="stylesheet" type="text/css" href="public/css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="public/css/bootstrap-theme.css" />
<link rel="stylesheet" type="text/css" href="public/css/travel/index.css" />
</head>
<body>

		<!-- 头部导航 NAV-->
	<header class="">
			<nav class="navbar navbar-default navbar-fixed-top">
				<div class="container">
					<!-- Brand and toggle get grouped for better mobile display -->
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed"
							data-toggle="collapse"
							data-target="#bs-example-navbar-collapse-1">
							<span class="sr-only">Toggle navigation</span><span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
						<!--LOGO-->
						<a class="navbar-brand" href="index.jsp" style="padding: 0px;"> 
							<img src="public/img/header_logo1.png"  alt="无法显示"  height="50px" />
						</a>
					</div>

					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse"
						id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav">
							<li class="active"><a href="index.jsp">首页 <span
									class="sr-only">(current)</span></a></li>
							
							<li><a href="travel.jsp">热门资讯</a></li>
							<li><a href="info.jsp">历史与文化</a></li>
						</ul>
						
						<!-- 全站搜索 -->
						<form class="navbar-form navbar-left" role="search" action="http://zhannei.baidu.com/cse/search" method="get" target="_blank" class="bdcs-search-form" autocomplete="off" id="bdcs-search-form">
							<div class="form-group">
								<input type="hidden" name="s" value="4106996640374743104">
								<input type="hidden" name="entry" value="1">
								<input type="search" name="q" class="bdcs-search-form-input form-control" id="bdcs-search-form-input" placeholder="请输入关键词" autocomplete="off" style="height: 34px; line-height: 34px;">					 
							</div>
							<button type="submit" class="btn btn-success">搜索</button>
						</form>

						<ul class="nav navbar-nav navbar-right">
							<li><a href="server.jsp">服务</a></li>
						</ul>
						&nbsp;
						<!-- 天气预报插件-->
						<iframe width="300" height="25" src="https://i.tianqi.com/?c=code&
						a=getcode&id=10&py=dujiangyan&icon=1" frameborder="0"></iframe>
				
					</div>
					<!-- /.navbar-collapse -->
				</div>
				<!-- /.container-fluid -->
			</nav>
		</header>
		<!-- 导航结束 -->
		
		
		<!-- 资讯详情 -->
		<div class="container scen-info">
				<div class="row">
					<div class="col-md-12">
					<div class="col-md-6">
						<img src="" class="" id="infoimg"/>
						
					</div>
					
					<div class="col-md-6">
						<input type="hidden" value="${param.infoid}" name="info-id" id="info-id" readonly>
						<div class="info-title">
							<blockquote id="">资讯标题</blockquote>
							<hr />
							<p class="intro-content" id="info-title">
								 
							</p>
						</div>
						
						<div class="scen-feature">
							<blockquote>活动时间</blockquote>
							<hr />
							<p class="intro-content" id="info-date">
								 
							</p>
						</div>
												 
					</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col-md-12">
						<div class="container scen-intro">

							<blockquote>活动详情</blockquote>
							<hr />
							<p class="intro-content" id="info-content">
								 
						
							</p>
						</div>
					</div>
				</div>

			</div>


<!-- 底部版权声明 -->
		<%@ include file="include/footer.jsp" %>
</body>

	<script src="public/js/jquery-3.1.1.js" type="text/javascript" charset="utf-8"></script> 
	<script src="public/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
	<script src="public/js/back-top.js" type="text/javascript"></script>
	
	<script type="text/javascript">
			$(function(){
				var info_id=$("#info-id").val();
 
				$.ajax({
					type: 'post',
					url: 'admin/InfoById'+ '?' +'infoid=' +info_id, //这里offset,size无作用，仅方便调试
					dataType: 'json',
					success: function(infos){
						/* 每次读取数据个数 */
						//alert(scens.length);
						/* 实现页面的拼接 */
						info=infos[0];
						console.log(info.info_title); 
						$("title").html(info.info_title+" - 洛阳旅游");
						$("#info-title").html(info.info_title);
						$("#info-tag").html(info.info_tag);
						$("#info-url").html(info.info_url);	
						$("#info-date").html(info.info_date);
 
						$("#infoimg").attr("alt",info.info_title);
						$("#infoimg").attr("src",info.info_pic);
						$("#info-content").html(info.info_txt);		
						
					},
					error: function(xhr, type){
						alert('Ajax error!');
					}
				});
			});
				
				 
			</script>
	
	
	
</html>