<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-md bg-dark navbar-dark fixed-top">
	<a class="navbar-brand" href="#">SPACE BE</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#collapsibleNavbar">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="collapsibleNavbar">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item"><a class="nav-link" href="#">공지사항</a></li>
			<li class="nav-item"><a class="nav-link" href="#">Blog</a></li>
			<li class="nav-item"><a class="nav-link" href="#">커뮤니티</a></li>
		</ul>
		<form class="form-inline my-2 my-lg-0" action="/action_page.php">
			<div class="form-group">
				<input class="form-control mr-sm-2" type="text" placeholder="Search">
			</div>
			<button class="btn btn-success mr-sm-5" type="submit">Search</button>
			<a class="btn btn-primary" data-toggle="modal" data-target="#myModal">Login</a>
		</form>
	</div>
</nav>
<body>
	<!-- The Modal -->
	<div class="modal fade" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h2 class="modal-title">Login</h2>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<section>
						<h4>이메일로 로그인</h4>
						<form action="/action_page.php">
							<div class="form-group">
								<label for="email">Email address:</label> <input type="email"
									class="form-control" placeholder="Enter email" id="email">
							</div>
							<div class="form-group">
								<label for="pwd">Password:</label> <input type="password"
									class="form-control" placeholder="Enter password" id="pwd">
							</div>
							<div class="form-group form-check">
								<label class="form-check-label"> <input
									class="form-check-input" type="checkbox"> Remember me
								</label>
							</div>
							<button type="submit" class="btn btn-primary">Submit</button>
						</form>
					</section>
					<section>
						<h4>소셜 계정으로 로그인</h4>
						<a href=""><img src=""/>Gmail</a>
						<a href=""><img src=""/>Facebook</a>
					</section>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<span>아직 회원이 아니신가요?</span>
					<button type="button" class="btn btn-success" data-dismiss="modal">Join</button>
				</div>

			</div>
		</div>
	</div>
</body>