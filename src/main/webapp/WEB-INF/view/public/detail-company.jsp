<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head th:replace="public/fragments :: html_head">
    <title>Skillhunt - Free Bootstrap 4 Template by Colorlib</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700&display=swap" rel="stylesheet">
 <%@include file="resource.jsp"%>
  
</head>
<body>

    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid px-md-4	">
          <a class="navbar-brand" href="/">Work CV</a>
      
          <div class="collapse navbar-collapse" id="ftco-nav">
            <ul class="navbar-nav ml-auto">
              <li class="nav-item active"><a href="/" class="nav-link">Trang chủ</a></li>
              <li class="'nav-item"><a href="/" class="nav-link">Công việc</a></li>
              <li class="nav-item"><a href="/" class="nav-link">Ứng cử viên</a></li>
                <ul class="dropdown">
                  <li><a href="/">Hồ Sơ</a></li>
                  <li ><a href="/save-job/get-list" >Công việc đã lưu</a></li>
                  <li ><a href="/user/list-post" >Danh sách bài đăng</a></li>
                  <li ><a href="/user/get-list-apply" >Công việc đã ứng tuyển</a></li>
                  <li ><a href="/user/get-list-company" >Công ty đã theo dõi</a></li>
                  <li><a href="/auth/logout" >Đăng xuất</a></li>
                </ul>
                <li></li>
                <li class="nav-item cta mr-md-1"><a href="/recruitment/post" class="nav-link">Đăng tuyển</a></li>
              <li class="nav-item cta cta-colored"><a href="/auth/login" class="nav-link">Đăng nhập</a></li>
            </ul>
          </div>
        </div>
      </nav>
<!-- END nav -->



<div class="hero-wrap hero-wrap-2" style="background-image: url('/assets/images/bg_1.jpg');" data-stellar-background-ratio="0.5">
    <div class="overlay"></div>
    <div class="container">
        <div class="row no-gutters slider-text align-items-end justify-content-start">
            <div class="col-md-12 text-center mb-5">
                <p class="breadcrumbs mb-0"><span class="mr-3"><a href="index.html">Trang chủ <i class="ion-ios-arrow-forward"></i></a></span>Chi tiết <span></span></p>
                <h1 class="mb-3 bread">Chi tiết công ty</h1>
            </div>
        </div>
    </div>
</div>

<section style="margin-top: 10px" class="site-section">
    <div class="container">
        <div class="row align-items-center mb-5">
            <div class="col-lg-8 mb-4 mb-lg-0">
                <div class="d-flex align-items-center">
                    <div class="border p-2 d-inline-block mr-3 rounded">
                        <img width="100" height="100" src="${companyDTO.logo}" alt="Image">
                    </div>
                    <div>
                        <h2 >${companyDTO.nameCompany}</h2>
                        <div>
                            <span class="icon-briefcase mr-2"></span><span class="ml-0 mr-2 mb-2">${companyDTO.email}</span>
                            <span  class="icon-room mr-2"></span ><span class="m-2">${companyDTO.address}</span>

                        </div>
                        <input type="hidden" id="idCompany">
                    </div>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="row">
                	<c:if test="${sessionScope.userDTO == null}">
                	<div class="col-6">
                        <a class="btn btn-block btn-light btn-md"><span class="icon-heart-o mr-2 text-danger"></span>Đăng nhập để theo dõi</a>
                    </div>
                    </c:if>
                
                   <c:if test="${sessionScope.userDTO != null}">
                    <div class="col-6">
                    	<input type="hidden" id="userId_${sessionScope.userDTO.id}" name="user" value="${sessionScope.userDTO.id}">
						<input type="hidden" id="companyId_${companyDTO.id}" name="recruitments" value="${companyDTO.id}">
                        <a  onclick="follow(${sessionScope.userDTO.id}, ${companyDTO.id})" class="btn btn-block btn-light btn-md"><span class="icon-heart-o mr-2 text-danger"></span>Theo dõi</a>
                    </div>
                    </c:if>
                    <div class="col-6">

                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-8">
                <div class="mb-5">

                    <h3 class="h5 d-flex align-items-center mb-4 text-primary"><span class="icon-align-left mr-3"></span>Mô tả công ty</h3>
                    <p>${companyDTO.description}</p>
                </div>

            </div>
            <div class="col-lg-4">
                <div class="bg-light p-3 border rounded mb-4">
                    <h3 class="text-primary  mt-3 h5 pl-3 mb-3 ">Thông tin liên hệ</h3>
                    <ul class="list-unstyled pl-3 mb-0">

                        <li class="mb-2"><strong class="text-black">Email công ty: </strong> <span>${companyDTO.email}</span></li>
                        <li class="mb-2"><strong class="text-black">Số điện thoại: </strong> <span ">${companyDTO.phoneNumber}</span></li>
                        <li class="mb-2"><strong class="text-black">Đại chỉ: </strong> <span>${companyDTO.address}</span></li>
                    </ul>
                </div>

                <div class="bg-light p-3 border rounded">
                    <h3 class="text-primary  mt-3 h5 pl-3 mb-3 ">Share</h3>
                    <div class="px-3">
                        <a href="#" class="pt-3 pb-3 pr-3 pl-0"><span class="icon-facebook"></span></a>
                        <a href="#" class="pt-3 pb-3 pr-3 pl-0"><span class="icon-twitter"></span></a>
                        <a href="#" class="pt-3 pb-3 pr-3 pl-0"><span class="icon-linkedin"></span></a>
                        <a href="#" class="pt-3 pb-3 pr-3 pl-0"><span class="icon-pinterest"></span></a>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <script>
        function follow(userId, compId){
            var name = "#idCompany";
            var idCompany = $(name).val();
            
            var userId = $("#userId_" + userId).val();
			var companyId = $("#companyId_" + compId).val();
            var formData = new FormData();            
            
            /* formData.append('idCompany', idCompany); */
            formData.append('userId', userId);
			formData.append('companyId', companyId);
            $.ajax(
                {
                    type: 'POST',
                    url: '${pageContext.request.contextPath}/user/follow-company/',
                    contentType: false,
                    processData: false,
                    data: formData,
                    success: function (data) {
                        if(data == "false"){
                            swal({
                                title: 'Bạn cần phải đăng nhập!',
                                /* text: 'Redirecting...', */
                                icon: 'error',
                                timer: 3000,
                                buttons: true,
                                type: 'error'
                            })
                        }else if(data == "true"){
                            swal({
                                title: 'Theo dõi thành công!',
                                /* text: 'Redirecting...', */
                                icon: 'success',
                                timer: 3000,
                                buttons: true,
                                type: 'success'
                            })
                        }else{
                            swal({
                                title: 'Bạn đã theo dõi công ty này!',
                                /* text: 'Redirecting...', */
                                icon: 'error',
                                timer: 3000,
                                buttons: true,
                                type: 'error'
                            })
                        }
                    },
                    error: function (err) {
                        alert(err);
                    }
                }
            )
        }
    </script>
</section>

<footer class="footer" class="ftco-footer ftco-bg-dark ftco-section">
    <div class="container">
  
      <div class="row">
        <div class="col-md-12 text-center">
  
          <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
            Copyright &copy;<script>document.write(new Date().getFullYear());</script>  <i class="icon-heart text-danger" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">KhuongTM</a>
            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
        </div>
      </div>
    </div>
  </footer>

</footer>
</body>
</html>