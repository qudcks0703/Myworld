<%@page import="java.util.List"%>
<%@page import="com.jsp.db.MesDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>

<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap&subset=korean" rel="stylesheet">
<style>
	html,body{
		background-color: gray;	
	}

.nav-side-menu {
  overflow: auto;
  font-family: verdana;
  font-size: 12px;
  font-weight: 200;
  background-color: #2e353d;
  position: fixed;
  top: 0px;
  width: 300px;
  height: 100%;
  color: #e1ffff;
}
.nav-side-menu .brand {
  background-color: #23282e;
  line-height: 50px;
  display: block;
  text-align: center;
  font-size: 14px;
}
.nav-side-menu .toggle-btn {
  display: none;
}
.nav-side-menu ul,
.nav-side-menu li {
  list-style: none;
  padding: 0px;
  margin: 0px;
  line-height: 35px;
  cursor: pointer;
  /*    
    .collapsed{
       .arrow:before{
                 font-family: FontAwesome;
                 content: "\f053";
                 display: inline-block;
                 padding-left:10px;
                 padding-right: 10px;
                 vertical-align: middle;
                 float:right;
            }
     }
*/
}
.nav-side-menu ul :not(collapsed) .arrow:before,
.nav-side-menu li :not(collapsed) .arrow:before {
  font-family: FontAwesome;
  content: "\f078";
  display: inline-block;
  padding-left: 10px;
  padding-right: 10px;
  vertical-align: middle;
  float: right;
}
.nav-side-menu ul .active,
.nav-side-menu li .active {
  border-left: 3px solid #d19b3d;
  background-color: #4f5b69;
}
.nav-side-menu ul .sub-menu li.active,
.nav-side-menu li .sub-menu li.active {
  color: #d19b3d;
}
.nav-side-menu ul .sub-menu li.active a,
.nav-side-menu li .sub-menu li.active a {
  color: #d19b3d;
}
.nav-side-menu ul .sub-menu li,
.nav-side-menu li .sub-menu li {
  background-color: #181c20;
  border: none;
  line-height: 28px;
  border-bottom: 1px solid #23282e;
  margin-left: 0px;
}
.nav-side-menu ul .sub-menu li:hover,
.nav-side-menu li .sub-menu li:hover {
  background-color: #020203;
}
.nav-side-menu ul .sub-menu li:before,
.nav-side-menu li .sub-menu li:before {
  font-family: FontAwesome;
  content: "\f105";
  display: inline-block;
  padding-left: 10px;
  padding-right: 10px;
  vertical-align: middle;
}
.nav-side-menu li {
  padding-left: 0px;
  border-left: 3px solid #2e353d;
  border-bottom: 1px solid #23282e;
}
.nav-side-menu li a {
  text-decoration: none;
  color: #e1ffff;
}
.nav-side-menu li a i {
  padding-left: 10px;
  width: 20px;
  padding-right: 20px;
}
.nav-side-menu li:hover {
  border-left: 3px solid #d19b3d;
  background-color: #4f5b69;
  -webkit-transition: all 1s ease;
  -moz-transition: all 1s ease;
  -o-transition: all 1s ease;
  -ms-transition: all 1s ease;
  transition: all 1s ease;
}
@media (max-width: 767px) {
  .nav-side-menu {
    position: relative;
    width: 100%;
    margin-bottom: 10px;
  }
  .nav-side-menu .toggle-btn {
    display: block;
    cursor: pointer;
    position: absolute;
    right: 10px;
    top: 10px;
    z-index: 10 !important;
    padding: 3px;
    background-color: #ffffff;
    color: #000;
    width: 40px;
    text-align: center;
  }
  .brand {
    text-align: left !important;
    font-size: 22px;
    padding-left: 20px;
    line-height: 50px !important;
  }
}
@media (min-width: 767px) {
  .nav-side-menu .menu-list .menu-content {
    display: block;
  }
}
body {
  margin: 0px;
  padding: 0px;
}

/* GLOBAL STYLES
-------------------------------------------------- */
/* Padding below the footer and lighter body text */

body {
  padding-bottom: 40px;
  color: #5a5a5a;
}

.carousel {
  height: 500px;
  margin-bottom: 60px;
}
.carousel-caption {
  z-index: 10;
}

.carousel .item {
  height: 500px;
  background-color: #777;
}
.carousel-inner > .item > img {
  position: absolute;
  top: 0;
  left: 0;
  min-width: 100%;
  height: 500px;
}

.marketing .col-lg-4 {
  margin-bottom: 20px;
  text-align: center;
}
.marketing h2 {
  font-weight: normal;
}
.marketing .col-lg-4 p {
  margin-right: 10px;
  margin-left: 10px;
}


.featurette-divider {
  margin: 80px 0; 
}

.featurette-heading {
  font-weight: 300;
  line-height: 1;
  letter-spacing: -1px;
}



@media (min-width: 768px) {
  /* Navbar positioning foo */
  .navbar-wrapper {
    margin-top: 20px;
  }
  .navbar-wrapper .container {
    padding-right: 15px;
    padding-left: 15px;
  }
  .navbar-wrapper .navbar {
    padding-right: 0;
    padding-left: 0;
  }

  .navbar-wrapper .navbar {
    border-radius: 4px;
  }

  .carousel-caption p {
    margin-bottom: 20px;
    font-size: 21px;
    line-height: 1.4;
  }

  .featurette-heading {
    font-size: 50px;
  }
}

@media (min-width: 992px) {
  .featurette-heading {
    margin-top: 120px;
  }
}

.carousel-caption{
	color:#FFCD4A;
}

</style>
</head>
<body>
<div class="nav-side-menu">
    <div class="brand">
    <img src="/bb/img/main1.png" width="300px;" style="margin-top:10px; margin-bottom:20px; ">
    </div>
    <i class="fa fa-bars fa-2x toggle-btn" data-toggle="collapse" data-target="#menu-content"></i>
        <div class="menu-list">
            <ul id="menu-content" class="menu-content collapse out">
                <li>
                  <a href="/bb/index.jsp">
                  <i class="fas fa-home"></i> 홈
                  </a>
                </li>

                 <li>
                  <a href="/bb/member/signup.jsp">
                  <i class="fa fa-user fa-lg"></i> 회원가입
                  </a>
                </li>
                 <li>
                  <a href="/bb/member/login2.jsp">
                  <i class="fas fa-hand-paper"></i> 로그인
                  </a>
                </li>
            </ul>
     </div>
     <div style="position:absolute; bottom:0px;">
	     <small style="color:#e1ffff">
	     <p>
	     	대표자명: 이동준 외 3명
	     </p>
	     <p>	
	     	주소:안알려줌 사업자등록번호:없음
	     </p>
	     <p> 
	     	본 사이트의 콘텐츠는 저작권법의 보호를 받는 바 무단 전재, 복사, 배포 등을 금합니다.
	     </p>
	     <p>	
	     	ⓒ 2020 MyWorld. ALL RIGHTS RESERVED
	     </p>
	     </small>
     </div>
</div> 

<div class="container-fluid" style="font-family: 'Jua', sans-serif;height:100%;width:80%;position:absolute ;top:0px;left:300px;">
    <div id="myCarousel" class="carousel slide" data-ride="carousel" style="width:80%;margin-left:auto;margin-right:auto;margin-top:25px; ">
    
      <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
      </ol>
      
      <div class="carousel-inner" role="listbox">
        <div class="item active">
   <!--        <img class="first-slide" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="First slide"> -->
   
          <img class="first-slide" src="img/friend.png" alt="First slide">
          <div class="container">
            <div class="carousel-caption">
              <h1>친구</h1>
              <p>새로운 친구를 사겨보세요! </p>
              <p><a class="btn btn-lg btn-warning" href="/bb/member/signup.jsp" role="button">회원가입</a></p>
            </div>
          </div>
        </div>
        <div class="item">
          <img class="second-slide" src="img/mes.png" alt="Second slide">
          <div class="container">
            <div class="carousel-caption">
              <h1>게시판</h1>
              <p>많은 재미가 담겨 있는 게시판을 작성하세요! </p>
              <p><a class="btn btn-lg btn-warning" href="/bb/member/signup.jsp" role="button">회원가입</a></p>
            </div>
          </div>
        </div>
        <div class="item">
          <img class="third-slide" src="img/chat.png" alt="Third slide">
          <div class="container">
            <div class="carousel-caption">
              <h1>소통</h1>
              <p>새로운 사람과 대화를 통해 좋은 정보를 얻어가세요!</p>
              <p><a class="btn btn-lg btn-warning" href="/bb/member/signup.jsp" role="button">회원가입</a></p>
            </div>
          </div>
        </div>
      </div>
      
      <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">이전</span>
      </a>
      <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">다음</span>
      </a>
      
</div>


    <div class="container marketing">

      <div class="row">
        <div class="col-lg-4"  style="color:white">
          <img class="img-circle" src="img/friendimg.jpg" alt="Generic placeholder image" width="140" height="140">
          <h2>친구</h2>
          <p>저희 사이트는 현재 약 2만 명의 회원과 함께 사이트를 만들어가고 있습니다. 좋은 사람을 얻길 바랍니다.</p>
          <p><a class="btn btn-default" href="#" role="button" data-target="#friend" data-toggle="modal">상세 보기 &raquo;</a></p>
        </div><!-- /.col-lg-4 -->
        <div class="col-lg-4"  style="color:white">
          <img class="img-circle" src="img/board.jpg" alt="Generic placeholder image" width="140" height="140">
          <h2>게시판</h2>
          <p>저희 회원들은 연예인부터 학생들까지 남녀노소 할 것없이 두루 게시판을 이용하고 있습니다. 많은 정보를 얻길 바랍니다.</p>
          <p><a class="btn btn-default" href="#" role="button" data-target="#board" data-toggle="modal">상세 보기 &raquo;</a></p>
        </div><!-- /.col-lg-4 -->
        <div class="col-lg-4" style="color:white">
          <img class="img-circle" src="img/talk.jpg" width="140" height="140">
          <h2>소통</h2>
          <p>저희는 회원들끼리 소통을 할 수 있는 채팅방을 만들고 있습니다. 소통을 통해 스트레스를 날려버리시길 바랍니다..</p>
          <p><a class="btn btn-default" href="#" role="button">상세 보기 &raquo;</a></p>
        </div><!-- /.col-lg-4 -->
      </div>

      <hr class="featurette-divider">
		<h1 style="color:black;font-size:100px;text-align:center; ">개발자</h1>
      <hr class="featurette-divider">
      <div class="row featurette">
        <div class="col-md-7">
          <h2 class="featurette-heading" style="color:black;">CEO: <span style="font-size:80px;">이</span>동준<p><span class="text-muted" style="color:#444446;font-size:40px;">아.. 나 대표하기 싫다고</span></p></h2>
          <p class="lead"> 저 원래 요리사에요.. 나는 이런 것보다 요리가 더 좋다고.. <br/> 어쨋든 애들이 시켜서 했어요.<br/> <span style="color:white;">아 오늘 점심 뭐먹지?</span> </p>
        </div>
        <div class="col-md-5">
          <img class="featurette-image img-responsive center-block" src="img/dj.jpg" alt="Generic placeholder image">
        </div>
      </div>

      <hr class="featurette-divider">

      <div class="row featurette">
        <div class="col-md-7 col-md-push-5">
          <h2 class="featurette-heading" style="color:black;">Programer: <span style="font-size:80px;">최</span>병찬 <p><span class="text-muted" style="color:#444446;font-size:40px;">시시해서 죽고 싶어졌다..</span></p></h2>
          <p class="lead">코드 만드는 거 뭐 별거 있나요.. 그냥 뚝딱하면 만들어지던데.. <br/>어렵다구요?ㅋㅋ 공부는 하셨구요? 저 때문에 위축될 필요는 없어요ㅋㅋ <br/><span style="color:white;">상대가 나잖아 ㅋㅋ </span></p>
        </div>
        <div class="col-md-5 col-md-pull-7">
          <img class="featurette-image img-responsive center-block" src="img/bc.jpg" alt="Generic placeholder image">
        </div>
      </div>

      <hr class="featurette-divider">

      <div class="row featurette">
        <div class="col-md-7">
          <h2 class="featurette-heading" style="color:black;">Programer: <span style="font-size:80px;">허</span>정 <p><span class="text-muted" style="color:#444446;font-size:40px;">웹툰좀 보자고...</span></p></h2>
          <p class="lead">매일 옆에서,, 하루에 10번은 잔소리 듣습니다.<br/> 그리고 수업끝납니다. 그리고 수업시작하고 수업 끝납니다..<br/><span style="color:white;">요새 흰머리나요..</span></p>
        </div>
        <div class="col-md-5">
          <img class="featurette-image img-responsive center-block" src="img/hj.jpg" alt="Generic placeholder image">
        </div>
      </div>

      <hr class="featurette-divider">

  	 <div class="row featurette">
        <div class="col-md-7 col-md-push-5">
          <h2 class="featurette-heading" style="color:black;">Programer: <span style="font-size:80px;">고</span>결<p><span class="text-muted" style="color:#444446;font-size:40px;" >내 나이좀 생각해주라.. </span></p></h2>
          <p class="lead">너희들은 어리잖아.. 나는 나이가 있다고, 지금도 힘들어 <br/> <span style="color:white;">그냥 다 힘들어.. </span></p>
        </div>
        <div class="col-md-5 col-md-pull-7">
          <img class="featurette-image img-responsive center-block" src="img/gg.jpg" alt="Generic placeholder image" style="height: 380px;">
        </div>
      </div>

      <hr class="featurette-divider">

    </div>
</div>

<div class="modal fade" id="friend" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
				<h3 class="modal-title" id="myModalLabel">친구란?</h3>
			</div>
			<div class="modal-body">
				<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
		        	<ol class="carousel-indicators">
			          <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
			          <li data-target="#carousel-example-generic" data-slide-to="1"></li>
			          <li data-target="#carousel-example-generic" data-slide-to="2"></li>
		        	</ol>
		        	<div class="carousel-inner" role="listbox">
		          		<div class="item active">
		            		<img src="img/friend_help1.PNG" alt="First slide">
		          		</div>
		          		<div class="item">
		            		<img src="img/friend_help2.PNG" alt="Two slide">
		          		</div>
		          		<div class="item">
		            		<img src="img/friend_help3.PNG" alt="Three slide">
		          		</div>
		        	</div>
		        	<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
			          	<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
			          	<span class="sr-only">Previous</span>
		        	</a>
		        	<a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
			        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			        <span class="sr-only">Next</span>
		        	</a>
				</div>
			</div>
			<div class="modal-footer">
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="board" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
				<h3 class="modal-title" id="myModalLabel">게시판이란?</h3>
			</div>
			<div class="modal-body">
				<div id="carousel-example" class="carousel slide" data-ride="carousel">
		        	<ol class="carousel-indicators">
			          <li data-target="#carousel-example" data-slide-to="0" class="active"></li>
			          <li data-target="#carousel-example" data-slide-to="1"></li>
			          <li data-target="#carousel-example" data-slide-to="2"></li>
		        	</ol>
		        	<div class="carousel-inner" role="listbox">
		          		<div class="item active">
		            		<img src="img/board_help1.PNG" alt="First slide">
		          		</div>
		          		<div class="item">
		            		<img src="img/board_help2.PNG" alt="Two slide">
		          		</div>
		          		<div class="item">
		            		<img src="img/board_help3.PNG" alt="Three slide">
		          		</div>
		        	</div>
		        	<a class="left carousel-control" href="#carousel-example" role="button" data-slide="prev">
			          	<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
			          	<span class="sr-only">Previous</span>
		        	</a>
		        	<a class="right carousel-control" href="#carousel-example" role="button" data-slide="next">
			        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			        <span class="sr-only">Next</span>
		        	</a>
				</div>
			</div>
			<div class="modal-footer">
			</div>
		</div>
	</div>
</div>


</body>
</html>