<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head">
    <title>Work CV</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700&display=swap" rel="stylesheet">
<%@include file="resource.jsp"%>
  
</head>
<body>
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
<%-- <div th:if="${success}" class="toast" data-delay="2000" style="position:fixed;top: 100PX; right: 10PX;z-index: 2000;width: 300px">
    <script>
        swal({
            title: 'Xóa thành công!',
            /* text: 'Redirecting...', */
            icon: 'success',
            timer: 3000,
            buttons: true,
            type: 'success'
        })
    </script>
</div> --%>
<!-- END nav -->
<div class="hero-wrap hero-wrap-2" style="background-image: url(<c:url value="/resources/assets/images/bg_1.jpg"/>);" data-stellar-background-ratio="0.5" th:if="${session.user.role.id == 1 }">
    <div class="overlay"></div>
    <div class="container">
        <div class="row no-gutters slider-text align-items-end justify-content-start">
            <div class="col-md-12 text-center mb-5">
                <p class="breadcrumbs mb-0"><span class="mr-3"><a href="/">Trang chủ <i class="ion-ios-arrow-forward"></i></a></span>Công ty <span></span></p>
                <h1 class="mb-3 bread">Danh sách công ty đã theo dõi</h1>
            </div>
        </div>
    </div>
</div>


<section class="ftco-section bg-light" th:if="${session.user.role.id == 1 }">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 pr-lg-5">
                <div  class="row">
                	<c:forEach items="${followCompanies}" var="followCompany">      
                        <div class="col-md-12 ">
                            <div class="job-post-item p-4 d-block d-lg-flex align-items-center">
                                <div class="one-third mb-4 mb-md-0">
                                    <div class="job-post-item-header align-items-center">
<!--                                        <span class="subadge" th:text="${saveJob.com.type}"></span>-->
                                        <h2 class="mr-3 text-black" ><a href="${pageContext.request.contextPath}/user/detail-company/${followCompany.company.id}}">${followCompany.company.nameCompany}</a></h2>
                                    </div>
                                    <div class="job-post-item-body d-block d-md-flex">
                                        <div class="mr-3"><span class="icon-layers"></span> <a href="#" ></a>${followCompany.company.email}</div>
                                        <div class="mr-3"><span class="icon-my_location"></span> <span>${followCompany.company.address}</span></div>
                                        <div style="margin-left: 10"><span class="icon-my_location"></span> <span>${followCompany.company.phoneNumber}</span></div>
                                    </div>
                                </div>
                                <input type="hidden" id="${'idRe'}_${followCompany.company.id}" value="${followCompany.company.id}">
                                <div class="one-forth ml-auto d-flex align-items-center mt-4 md-md-0" style="width:370px !important;">
                                    <div>
                                        <a  th:href="${'/user/delete-follow/'}+${saveJob.id}" class="icon text-center d-flex justify-content-center align-items-center icon mr-2">
                                            <span class="icon-delete"></span>
                                        </a>
                                    </div>
                                    <a href="${pageContext.request.contextPath}/user/detail-company/${followCompany.company.id}}" class="btn btn-primary py-2">Chi tiết</a>
                                    <a href="${'/user/company-post/'}+${saveJob.company.id}" class="btn btn-warning py-2 ml-1">Danh sách bài đăng</a>
                                </div>
                            </div>
                        </div><!-- end -->
                    </c:forEach> 

                </div>
                <c:if test="${followCompanies.size() == 0 }">
	                <div style="text-align: center">
	                    <p style="color:red;">Danh sách trống</p>
	                </div>
                </c:if>
                <div class="row mt-5">
                    <div class="col text-center">
                        <div class="block-27">
                           <c:if test="${currentPage > 1}">
   									 <a href="${pageContext.request.contextPath}/user/list-follow-company?page=${currentPage - 1}"> <- Trang trước</a>
  								</c:if>
  								<c:forEach begin="1" end="${totalPages}" var="page">
								    <c:choose>
								      <c:when test="${page == currentPage}">
								        <span class="active">Trang: ${page}</span>
								      </c:when>
								      <c:otherwise>
								        <a href="${pageContext.request.contextPath}/user/list-follow-company?page=${page}">${page}</a>
								      </c:otherwise>
								    </c:choose>
							 </c:forEach>
							   <c:if test="${currentPage <= totalPages}">
							    	<a href="${pageContext.request.contextPath}/user/list-follow-company?page=${currentPage + 1}"> -> Trang kế tiếp</a>
							   </c:if>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</section>
<script>
    function save(id){
        var name = "#idRe" +id;
        var idRe = $(name).val();
        var formData = new FormData();
        formData.append('idRe', idRe);
        $.ajax(
            {
                type: 'POST',
                url: '/save-job/save/',
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
                            title: 'Lưu thành công!',
                            /* text: 'Redirecting...', */
                            icon: 'success',
                            timer: 3000,
                            buttons: true,
                            type: 'success'
                        })
                    }else{
                        swal({
                            title: 'Bạn đã lưu bài này rồi!',
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




<footer th:replace="public/fragments :: footer" class="ftco-footer ftco-bg-dark ftco-section">

</footer>


<!-- loader -->
<!--<div th:replace="public/fragments :: loading" id="ftco-loader" class="show fullscreen"></div>-->

</body>
</html>