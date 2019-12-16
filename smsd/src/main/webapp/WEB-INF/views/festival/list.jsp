<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<!doctype html>
<html>

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="icon" href="${root}/festival/list/img/favicon.png">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="${root}/festival/list/css/bootstrap.min.css">
    <!-- animate CSS -->
    <link rel="stylesheet" href="${root}/festival/list/css/animate.css">
    <!-- owl carousel CSS -->
    <link rel="stylesheet" href="${root}/festival/list/css/owl.carousel.min.css">
    <!-- themify CSS -->
    <link rel="stylesheet" href="${root}/festival/list/css/themify-icons.css">
    <!-- flaticon CSS -->
    <link rel="stylesheet" href="${root}/festival/list/css/flaticon.css">
    <!-- fontawesome CSS -->
    <link rel="stylesheet" href="${root}/festival/list/fontawesome/css/all.min.css">
    <!-- magnific CSS -->
    <link rel="stylesheet" href="${root}/festival/list/css/magnific-popup.css">
    <link rel="stylesheet" href="${root}/festival/list/css/gijgo.min.css">
    <!-- niceselect CSS -->
    <link rel="stylesheet" href="${root}/festival/list/css/nice-select.css">
    <!-- slick CSS -->
    <link rel="stylesheet" href="${root}/festival/list/css/slick.css">
    <!-- style CSS -->
    <link rel="stylesheet" href="${root}/festival/list/css/style.css">
    <style>
    	.show {
    		display: block;
    	}
    	.hide {
    		display: none;
    	}
    	.more {
    		margin-top: 100px;
    	}
    	.moreBtn {
    		font-size: 30px;
    		padding: 20px 70px;
    	}
    </style>
    
    <script type="text/javascript">
    	function aa() {
			alert("로그인을 해야만 예매가 가능합니다.");
			location.href= "${root}/login"
		}
    </script>
</head>

<body>
    <!-- banner part start-->
    <section class="banner_part" style="background-image: url('${best.f_image}');">
        <div class="container">
            <div class="row align-items-center justify-content-center">
                <div class="col-lg-12">
                    <div class="banner_text text-center">
                        <div class="banner_text_iner">
                            <h1>${best.f_title}</h1>
                            <c:choose>
			            	<c:when test="${empty sessionScope.id}">
			            		<a href="javascript:aa()" class="btn_1">지금 예매하기</a>
			            	</c:when>
			            	<c:otherwise>
                        	   	<a href="javascript:read('${best.f_id}')" class="btn_1">지금 예매하기</a>
			            	</c:otherwise>            	
			            	</c:choose>
                            <a href="javascript:enrollFestival()" class="btn_1">최신화</a>
                            <a href="javascript:enrollFestivalDetail()" class="btn_1">구체화</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- banner part start-->

    <!-- booking part start-->
    <section class="booking_part">
        <div class="container">
            <div class="row">				
                <div class="col-lg-12">	
                    <div class="booking_content">
                        <div class="tab-content" id="myTabContent">
                            <div class="tab-pane fade show active" id="hotel" role="tabpanel" aria-labelledby="hotel-tab">
                                <div class="booking_form">
                                    <form id="searchFrm" action="list" method="get" name="searchFrm" onsubmit="return valueCheck(this)">
                                        <div class="form-row">
                                            <div class="form_colum">
                                                <select class="nc_select" id="area" name="area">
                                                    <option selected value="0">장소 선택</option>
                                                    <option value="1">서울</option>
                                                    <option value="2">인천</option>
                                                    <option value="3">대전</option>
                                                    <option value="4">대구</option>
                                                    <option value="5">광주</option>
                                                    <option value="6">부산</option>
                                                    <option value="7">울산</option>
                                                    <option value="8">세종특별자치시</option>
                                                    <option value="31">경기도</option>
                                                    <option value="32">강원도</option>
                                                    <option value="33">충청북도</option>
                                                    <option value="34">충청남도</option>
                                                    <option value="35">경상북도</option>
                                                    <option value="36">경상남도</option>
                                                    <option value="37">전라북도</option>
                                                    <option value="38">전라남도</option>
                                                    <option value="39">제주도</option>
                                                </select>
                                            </div>
                                            <div class="form_colum">
                                                <input id="datepicker_1" placeholder="Check in date" name="sdate">
                                            </div>
                                            <div class="form_colum">
                                                <input id="datepicker_2" placeholder="Check in date" name="edate">
                                            </div>
                                            <div class="form_colum">
                                                <select class="nc_select" name="price" id="price">
                                                    <option selected value="0">가격 선택</option>
                                                    <option value="1">3000원 이하</option>
                                                    <option value="2">3000원 ~ 5000원</option>
                                                    <option value="3">5000원 ~ 10000원</option>
                                                    <option value="4">10000원 이상</option>
                                                </select>
                                            </div>
                                            <div class="form_btn">
                                                <button class="btn_1">search</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Booking part end-->

    <!--Search place start-->
    
    <section class="top_place section_padding <c:choose><c:when test="${isSearch  == true}">show</c:when><c:otherwise>hide</c:otherwise></c:choose>">	
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-xl-6">
                    <div class="section_tittle text-center">
                        <h2>Search Result</h2>
                    </div>
                </div>
            </div>
            <div class="row">
            	<c:forEach var="dto" items="${searchList}">
                <div class="col-lg-6 col-md-6">
                    <div class="single_place">
                        <img src="${dto.f_image}" alt="" style="height: 400px; width:600px;">
                        <div class="hover_Text d-flex align-items-end justify-content-between">
                            <div class="hover_text_iner">
                                <a href="javascript:read('${dto.f_id}')" class="place_btn">Go</a>
                                <h3>${dto.f_title }</h3>
                                <p>${dto.f_address}</p>
                                <div class="place_review">
                                    <a href="#"><i class="fas fa-star"></i></a>
                                    <a href="#"><i class="fas fa-star"></i></a>
                                    <a href="#"><i class="fas fa-star"></i></a>
                                    <a href="#"><i class="fas fa-star"></i></a>
                                    <a href="#"><i class="fas fa-star"></i></a>
                                    <span>(210 review)</span>
                                </div>
                            </div>
                            <div class="details_icon text-right">
                                <a href="javascript:read('${dto.f_id}')"><i class="ti-share"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                </c:forEach>
            </div>
        </div>
    </section>
    <!--Search place end-->

    <!--top place start-->
    <section class="top_place section_padding">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-xl-6">
                    <div class="section_tittle text-center">
                        <h2>Top Places to visit</h2>
                    </div>
                </div>
            </div>
            <div class="row">
		    <c:forEach var="dto" items="${topList}">
                <div class="col-lg-6 col-md-6">
                    <div class="single_place">
                        <img src="${dto.f_image}" alt="" style="height: 400px; width:600px;">
                        <div class="hover_Text d-flex align-items-end justify-content-between">
                            <div class="hover_text_iner">
                                <a href="javascript:read('${dto.f_id}')" class="place_btn">Go</a>
                                <h3><a href="javascript:read('${dto.f_id}')">${dto.f_title}</a></h3>
                                <p>${dto.f_address}</p>
                                <div class="place_review">
                                    <a href="#"><i class="fas fa-star"></i></a>
                                    <a href="#"><i class="fas fa-star"></i></a>
                                    <a href="#"><i class="fas fa-star"></i></a>
                                    <a href="#"><i class="fas fa-star"></i></a>
                                    <a href="#"><i class="fas fa-star"></i></a>
                                    <span>(${dto.f_cnt} 조회 수)</span>				
                                </div>
                            </div>
                            <div class="details_icon text-right">
                                <a href="javascript:read('${dto.f_id }')"><i class="ti-share"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
		    </c:forEach>
            </div>
        </div>
    </section>
    <!--top place end-->

    <!--::industries start::-->
    <section class="hotel_list section_padding">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-xl-6">
                    <div class="section_tittle text-center">
                        <h2>진행 중인 축제들</h2>
                    </div>
                </div>
            </div>
            <div class="row">
            	<c:forEach var="dto" items="${recentList}">
	                <div class="col-lg-4 col-sm-6" style="height: 500px;">
	                    <div class="single_ihotel_list" style="border-bottom: none;">
	                        <img src="${dto.f_image}" alt="" style="width: 400px; height: 300px;">
	                        <div class="hotel_text_iner">
	                            <h3><a href="javascript:read('${dto.f_id}')">${dto.f_title}</a></h3>
	                            <div class="place_review">
	                                <a href="#"><i class="fas fa-star"></i></a>
	                                <a href="#"><i class="fas fa-star"></i></a>
	                                <a href="#"><i class="fas fa-star"></i></a>
	                                <a href="#"><i class="fas fa-star"></i></a>
	                                <a href="#"><i class="fas fa-star"></i></a>
	                                <span>(210 review)</span>
	                            </div>
	                            <p>${dto.f_address}</p>
	                            <h5>From <span>${dto.f_price} 원</span></h5>
	                        </div>
	                    </div>
	                </div>
            	</c:forEach>
            </div>
        </div>
    </section>
    <!--::industries end::-->

    <!--top place start-->
    <section class="client_review section_padding">
        <div class="container">
            <div class="row ">
                <div class="col-xl-6">
                    <div class="section_tittle">
                        <h2>후기</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="client_review_slider owl-carousel">
                        <div class="single_review_slider">
                            <div class="place_review">
                                <a href="#"><i class="fas fa-star"></i></a>
                                <a href="#"><i class="fas fa-star"></i></a>
                                <a href="#"><i class="fas fa-star"></i></a>
                                <a href="#"><i class="fas fa-star"></i></a>
                                <a href="#"><i class="fas fa-star"></i></a>
                            </div>
                            <p>Waters make fish every without firmament saw had. Morning air subdue. Our Air very one whales grass is fish whales winged night yielding land creeping that seed </p>
                            <h5> - Allen Miller</h5>
                        </div>
                        <div class="single_review_slider">
                            <div class="place_review">
                                <a href="#"><i class="fas fa-star"></i></a>
                                <a href="#"><i class="fas fa-star"></i></a>
                                <a href="#"><i class="fas fa-star"></i></a>
                                <a href="#"><i class="fas fa-star"></i></a>
                                <a href="#"><i class="fas fa-star"></i></a>
                            </div>
                            <p>Waters make fish every without firmament saw had. Morning air subdue. Our Air very one whales grass is fish whales winged night yielding land creeping that seed </p>
                            <h5> - Allen Miller</h5>
                        </div>
                        <div class="single_review_slider">
                            <div class="place_review">
                                <a href="#"><i class="fas fa-star"></i></a>
                                <a href="#"><i class="fas fa-star"></i></a>
                                <a href="#"><i class="fas fa-star"></i></a>
                                <a href="#"><i class="fas fa-star"></i></a>
                                <a href="#"><i class="fas fa-star"></i></a>
                            </div>
                            <p>Waters make fish every without firmament saw had. Morning air subdue. Our Air very one whales grass is fish whales winged night yielding land creeping that seed </p>
                            <h5> - Allen Miller</h5>
                        </div>
                        <div class="single_review_slider">
                            <div class="place_review">
                                <a href="#"><i class="fas fa-star"></i></a>
                                <a href="#"><i class="fas fa-star"></i></a>
                                <a href="#"><i class="fas fa-star"></i></a>
                                <a href="#"><i class="fas fa-star"></i></a>
                                <a href="#"><i class="fas fa-star"></i></a>
                            </div>
                            <p>Waters make fish every without firmament saw had. Morning air subdue. Our Air very one whales grass is fish whales winged night yielding land creeping that seed </p>
                            <h5> - Allen Miller</h5>
                        </div>
                        <div class="single_review_slider">
                            <div class="place_review">
                                <a href="#"><i class="fas fa-star"></i></a>
                                <a href="#"><i class="fas fa-star"></i></a>
                                <a href="#"><i class="fas fa-star"></i></a>
                                <a href="#"><i class="fas fa-star"></i></a>
                                <a href="#"><i class="fas fa-star"></i></a>
                            </div>
                            <p>Waters make fish every without firmament saw had. Morning air subdue. Our Air very one whales grass is fish whales winged night yielding land creeping that seed </p>
                            <h5> - Allen Miller</h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--top place end-->

    <!-- jquery plugins here-->
    <script src="${root}/festival/list/js/jquery-1.12.1.min.js"></script>
    <!-- popper js -->
    <script src="${root}/festival/list/js/popper.min.js"></script>
    <!-- bootstrap js -->
    <script src="${root}/festival/list/js/bootstrap.min.js"></script>
    <!-- magnific js -->
    <script src="${root}/festival/list/js/jquery.magnific-popup.js"></script>
    <!-- swiper js -->
    <script src="${root}/festival/list/js/owl.carousel.min.js"></script>
    <!-- masonry js -->
    <script src="${root}/festival/list/js/masonry.pkgd.js"></script>
    <!-- masonry js -->
    <script src="${root}/festival/list/js/jquery.nice-select.min.js"></script>
    <script src="${root}/festival/list/js/gijgo.min.js"></script>
    <!-- contact js -->
    <script src="${root}/festival/list/js/jquery.ajaxchimp.min.js"></script>
    <script src="${root}/festival/list/js/jquery.form.js"></script>
    <script src="${root}/festival/list/js/jquery.validate.min.js"></script>
    <script src="${root}/festival/list/js/mail-script.js"></script>
    <script src="${root}/festival/list/js/contact.js"></script>
    <!-- custom js -->
    <script src="${root}/festival/list/js/custom.js"></script>
    <script>
    	function enrollFestival(){
			$.ajax({
				url:"./tour/api/list/allCreate",
				type:"get",
				contentType : "application/json; charset=utf-8",
				success: function(data){
					console.log("success");
				},
				error: function(data){
					console.log("fail");
				}
			});    		
    	}
    	function enrollFestivalDetail(){
			$.ajax({
				url:"./tour/api/list/detailCreate",
				type:"get",
				contentType : "application/json; charset=utf-8",
				success: function(data){
					console.log("success");
				},
				error: function(data){
					console.log("fail");
				}
			});    		
    	}
    </script>
    <script>
    	function read(id){
    		var url = 'read';
    		url += '?id='+id;
    		location.href = url;
    	}
    	function valueCheck(f){
     		if(f.price.selectedIndex == 0){
    			alert("가격을 입력하세요");
    			return false;
    		}
    		if(document.getElementById('datepicker_1').value == 0){
    			alert("기간을 입력하세요");
    			return false;
    		}
    		if(document.getElementById('datepicker_1').value == 0){
    			alert("기간을 입력하세요");
    			return false;
    		}
    		if(f.area.selectedIndex == 0){
    			alert("지역을 입력하세요");
    			return false;
    		}
     	}
    	
    </script>
</body>

</html>