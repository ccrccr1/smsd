<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="util" uri="/ELFunctions"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
    <link rel="stylesheet" href="${root}/festival/read/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="${root}/festival/read/css/animate.css">
    <link rel="stylesheet" href="${root}/festival/read/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${root}/festival/read/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="${root}/festival/read/css/magnific-popup.css">
    <link rel="stylesheet" href="${root}/festival/read/css/aos.css">
    <link rel="stylesheet" href="${root}/festival/read/css/ionicons.min.css">
    <link rel="stylesheet" href="${root}/festival/read/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="${root}/festival/read/css/jquery.timepicker.css">
    <link rel="stylesheet" href="${root}/festival/read/css/flaticon.css">
    <link rel="stylesheet" href="${root}/festival/read/css/icomoon.css">
    <link rel="stylesheet" href="${root}/festival/read/css/style.css">
    <style>
	.btn_1{
		margin-top: 60px;
    	background-color: #2493e0;
    	padding: 23px 79px;	
		display: inline-block;
	    padding: 13px 30px;
	    border-radius: 0;
	    font-size: 16px;
	    color: #fff;
	    text-transform: capitalize;
	    -webkit-transition: 0.5s;
	    transition: 0.5s;
	    background-color: #fe5c24;
	    font-weight: 500;	
	}
    </style>
  </head>
  <body>    
    <div class="hero-wrap js-fullheight" style="background-image: url('${read.f_image}');" data-stellar-background-ratio="0.5">
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-end" data-scrollax-parent="true">
          <div class="col-md-12 text-center ftco-animate mt-5" data-scrollax=" properties: { translateY: '70%' }">
            <h1 class="mb-4" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">${read.f_title }</h1>
            <div class="banner_text_iner">
		           	<a href="javascript:booking('${read.f_id}')" class="btn_1">예매하기</a>
	            	<a href="javascript:bucket('${read.f_id}')" class="btn_1">즐겨찾기</a>
            </div>
          </div>
        </div>
      </div>
    </div>	

    <section class="ftco-section">
    	<div class="container">
    		<div class="row justify-content-center pb-5">
          		<div class="col-md-12 heading-section text-center ftco-animate">
            		<h2 class="mb-4">Best Place to Travel</h2>
          		</div>
        	</div>
    		<div class="row justify-content-center">
    			<c:forEach var="dto" items="${list}">
    			<div class="col-md-6 col-lg-3 ftco-animate">
    				<div class="project">
    					<div class="img">
		    				<img src="${dto.f_image}" class="img-fluid" alt="Colorlib Template" style="width: 300px; height: 200px;">	
	    				</div>
    				</div>
    			</div>
    			</c:forEach>
    		</div>
    	</div>
    </section>

    <section class="ftco-section services-section bg-light">
      <div class="container">
        <div class="row d-flex">
          <div class="col-md-3 d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services d-block">
              <div class="media-body">
                <h3 class="heading mb-3">Homepage</h3>
                <p>${read.f_homepage}</p>
              </div>
            </div>      
          </div>
          <div class="col-md-3 d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services d-block">
              <div class="media-body">
                <h3 class="heading mb-3">전화</h3>
                <p>${read.f_telname}</p>
                <br>
                <p>${read.f_tel}</p>
              </div>
            </div>      
          </div>
          <div class="col-md-3 d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services d-block">
              <div class="media-body">
                <h3 class="heading mb-3">장소</h3>
                <p>${read.f_address}</p>
                <br>
                <p>${read.f_eventplace}</p>
              </div>
            </div>      
          </div>
          <div class="col-md-3 d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services d-block">
              <div class="media-body">
                <h3 class="heading mb-3">기간</h3>
                <p>시작일 : ${read.f_sdate}</p>
                <br>
                <p>종료일 : ${read.f_edate}</p>
                <br>
                <p>${read.f_playtime}</p>
              </div>
            </div>      
          </div>
          <div class="col-md-3 d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services d-block">
              <div class="media-body">
                <h3 class="heading mb-3">참여 연령대</h3>
                <p>${read.f_age}</p>
              </div>
            </div>      
          </div>
        </div>
      </div>
    </section>
   	
    <section class="ftco-counter img" id="section-counter">
    	<div class="container">
    		<div class="row d-flex">
    			<div class="col-md-6 d-flex">
    				<div class="img d-flex align-self-stretch" style="background-image:url(${read.f_image});"></div>
    			</div>
    			<div class="col-md-6 pl-md-5 py-5">
    				<div class="row justify-content-start pb-3">
		          <div class="col-md-12 heading-section ftco-animate">
		            <h2 class="mb-4">About Festival</h2>
		          </div>
		        </div>
		    		<div class="row">
		          <div class="col-md-6 justify-content-center counter-wrap ftco-animate">
		            <div class="block-18 text-center py-5 bg-light mb-4">
		              <div class="text">		
		                <p>조횟 수</p>
		                <br>
		                <strong class="number" data-number="${read.f_cnt }">0</strong>
		              </div>
		            </div>
		          </div>
		          <div class="col-md-6 justify-content-center counter-wrap ftco-animate">
		            <div class="block-18 text-center py-5 bg-light mb-4">
		              <div class="text">
						<p>참여 인원</p>
						<br>		                
		                <strong class="number" data-number="200">0</strong>
		              </div>
		            </div>
		          </div>
		          <div class="col-md-6 justify-content-center counter-wrap ftco-animate">
		            <div class="block-18 text-center py-5 bg-light mb-4">
		              <div class="text">
		              	<p>후기</p>
		              	<br>
		                <strong class="number" data-number="2500">0</strong>
		              </div>
		            </div>
		          </div>
		          <div class="col-md-6 justify-content-center counter-wrap ftco-animate">
		            <div class="block-18 text-center py-5 bg-light mb-4">
		              <div class="text">
		              	<p>가격</p>
		              	<br>
		                <strong class="number" data-number="${read.f_price}">0</strong>
		              </div>
		            </div>
		          </div>
		        </div>
	        </div>
        </div>
    	</div>
    </section>

    <section class="ftco-section bg-light">
      <div class="container">
        <div class="row justify-content-center mb-5 pb-3">
          <div class="col-md-7 heading-section text-center ftco-animate">
            <h2>후기</h2>
          </div>
        </div>
        <a style="float: right;" href="javascript:review('${read.f_id}')">>></a>
            
        <div class="row d-flex">
          <div class="col-md-4 d-flex ftco-animate">
          	<div class="blog-entry justify-content-end">
              <a href="blog-single.html" class="block-20" style="background-image: url('festival/read/images/image_1.jpg');">
              </a>
              <div class="text mt-3 float-right d-block">
              	<div class="d-flex align-items-center pt-2 mb-4 topp">
              		<div class="one">
              			<span class="day">12</span>
              		</div>
              		<div class="two">
              			<span class="yr">2019</span>
              			<span class="mos">February</span>
              		</div>
              	</div>
                <h3 class="heading"><a href="#">Why Lead Generation is Key for Business Growth</a></h3>
              </div>
            </div>
          </div>
          <div class="col-md-4 d-flex ftco-animate">
          	<div class="blog-entry justify-content-end">
              <a href="blog-single.html" class="block-20" style="background-image: url('festival/read/images/image_2.jpg');">
              </a>
              <div class="text mt-3 float-right d-block">
              	<div class="d-flex align-items-center pt-2 mb-4 topp">
              		<div class="one">
              			<span class="day">12</span>
              		</div>
              		<div class="two">
              			<span class="yr">2019</span>
              			<span class="mos">February</span>
              		</div>
              	</div>
                <h3 class="heading"><a href="#">Why Lead Generation is Key for Business Growth</a></h3>
              </div>
            </div>
          </div>
          <div class="col-md-4 d-flex ftco-animate">
          	<div class="blog-entry">
              <a href="blog-single.html" class="block-20" style="background-image: url('festival/read/images/image_3.jpg');">
              </a>
              <div class="text mt-3 float-right d-block">
              	<div class="d-flex align-items-center pt-2 mb-4 topp">
              		<div class="one">
              			<span class="day">12</span>
              		</div>
              		<div class="two">
              			<span class="yr">2019</span>
              			<span class="mos">February</span>
              		</div>
              	</div>
                <h3 class="heading"><a href="#">Why Lead Generation is Key for Business Growth</a></h3>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>


  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>

  <script type="text/javascript">
  	function review(f_id){
  		var url = "review";
  		url += "?f_id="+f_id;
  		
  		location.href=url;
  	}
  	function booking(f_id){
  		var url = "${root}/order/order";
  		url += "?f_ids="+f_id;
  		url += "&amounts=1";
  		
  		location.href=url;
  	}
  	function bucket(f_id){
  		var url = "${root}/favorite/create";
  		url += "?f_id="+f_id;

  		location.href=url;
  	}
  	function create(){
  		var url = "${root}/member/agree";
  		
  		location.href = url;
  	}
  </script>
  
  
  
  <script src="${root}/festival/read/js/jquery.min.js"></script>
  <script src="${root}/festival/read/js/jquery-migrate-3.0.1.min.js"></script>
  <script src="${root}/festival/read/js/popper.min.js"></script>
  <script src="${root}/festival/read/js/bootstrap.min.js"></script>
  <script src="${root}/festival/read/js/jquery.easing.1.3.js"></script>
  <script src="${root}/festival/read/js/jquery.waypoints.min.js"></script>
  <script src="${root}/festival/read/js/jquery.stellar.min.js"></script>
  <script src="${root}/festival/read/js/owl.carousel.min.js"></script>
  <script src="${root}/festival/read/js/jquery.magnific-popup.min.js"></script>
  <script src="${root}/festival/read/js/aos.js"></script>
  <script src="${root}/festival/read/js/jquery.animateNumber.min.js"></script>
  <script src="${root}/festival/read/js/bootstrap-datepicker.js"></script>
  <script src="${root}/festival/read/js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="${root}/festival/read/js/google-map.js"></script>
  <script src="${root}/festival/read/js/main.js"></script>
    
  </body>
</html>