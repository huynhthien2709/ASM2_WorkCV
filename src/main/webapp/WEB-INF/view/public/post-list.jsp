<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
<nav class="header_menu" class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
    <div class="container-fluid px-md-4	">
        <a class="navbar-brand" href="<%= request.getContextPath()%>">Work CV</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
          <span class="oi oi-menu"></span> Menu
        </button>
    
        <div class="collapse navbar-collapse" id="ftco-nav">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item active"><a href="<%= request.getContextPath()%>" class="nav-link">Trang chủ</a></li>
            <li class="'nav-item"><a href="<c:url value = "/user/post-list"/>" class="nav-link">Công việc</a></li>
            
	   
	             <!--  <ul class="dropdown">
	                <li><a href="/">Hồ Sơ</a></li>
	                <li ><a href="/save-job/get-list" >Công việc đã lưu</a></li>
	                <li ><a href="/user/list-post" >Danh sách bài đăng</a></li>
	                <li ><a href="/user/get-list-apply" >Công việc đã ứng tuyển</a></li>
	                <li ><a href="/user/get-list-company" >Công ty đã theo dõi</a></li>
	                <li><a href="/auth/logout" >Đăng xuất</a></li>
	    
	              </ul> -->
	    
	              <li></li>
	    
	         <c:if test="${sessionScope.userDTO.role == '2'}">
	    		<li class="nav-item"><a href="<c:url value = "/user/list-user"/>" class="nav-link">Ứng cử viên</a></li>
	             <li class="nav-item cta mr-md-1"><a href="<c:url value = "/recruitment/post" />" class="nav-link">Đăng tuyển</a></li>	           
    		</c:if>
    		<li class="nav-item cta cta-colored"><a href="<c:url value = "/user/login"/>" class="nav-link">Đăng nhập</a></li>
          </ul>
        </div>
      </div>
</nav>

<div class="hero-wrap hero-wrap-2" style="background-image: url(<c:url value="/resources/assets/images/bg_1.jpg"/>);" data-stellar-background-ratio="0.5" th:if="${session.user.role.id == 2 }">
    <div class="overlay"></div>
    <div class="container">
        <div class="row no-gutters slider-text align-items-end justify-content-start">
            <div class="col-md-12 text-center mb-5">
                <p class="breadcrumbs mb-0"><span class="mr-3"><a href="index.html">Trang chủ <i class="ion-ios-arrow-forward"></i></a></span>Danh sách <span></span></p>
                <h1 class="mb-3 bread">Danh sách bài đăng</h1>
            </div>
        </div>
    </div>
</div>
<%-- <div th:if="${success}" class="toast" data-delay="2500" style="position:fixed; top: 100PX; left: 10PX;z-index: 2000;width: 300px">
    <script>
        swal({
            title: 'Thành công!',
            /* text: 'Redirecting...', */
            icon: 'success',
            timer: 3000,
            buttons: true,
            type: 'success'
        })
    </script>
</div>
<div th:if="${error}" class="toast" data-delay="2500" style="position:fixed; top: 100PX; left: 10PX;z-index: 2000;width: 300px">
    <script>
        swal({
            title: 'Bài đăng đang có người ứng tuyển!',
            /* text: 'Redirecting...', */
            icon: 'error',
            timer: 3000,
            buttons: true,
            type: 'error'
        })
    </script>
</div> --%>
<!-- 
<div class="hero-wrap hero-wrap-2" style="background-image: url(<c:url value="/resources/assets/images/bg_1.jpg"/>);" data-stellar-background-ratio="0.5" th:if="${session.user.role.id == 1 }">
    <div class="overlay"></div>
    <div class="container">
        <div class="row no-gutters slider-text align-items-end justify-content-start">
            <div class="col-md-12 text-center mb-5">

                <h1 class="mb-3 bread">Không tìm thấy trang yêu cầu</h1>
            </div>
        </div>
    </div>
</div>
 -->

<section class="ftco-section bg-light" >
    <div class="container">
        <div class="row">
            <div class="col-lg-12 pr-lg-4">
                <div class="row">
                    <c:if test="${recruitments.size() == 0 }">
                        <div class="row form-group" >
                            <label for="company-website-tw d-block">Danh sách bài tuyển dụng </label> <br>
                            <div class="col-md-12">
                                <a href="/recruitment/post" class="btn px-4 btn-primary text-white">Đăng tuyển</a>
                            </div>
                        </div>

                    </c:if>
                   
                   		<c:forEach items="${recruitments}" var="recruitments">
                        <div class="col-md-12 ">
                            <div class="job-post-item p-4 d-block d-lg-flex align-items-center">
                                <div class="one-third mb-4 mb-md-0">
                                <input type="hidden" class="form-control" id="id" name="id" value="${recruitments.id}">
                                    <div class="job-post-item-header align-items-center">
                                    
                                        <span class="subadge" ><c:out value="${recruitments.type}"/></span>
                                        <h2 class="mr-3 text-black" ><a  href="${pageContext.request.contextPath}/recruitment/detail/${recruitments.id}" ><c:out value="${recruitments.title}"/></a></h2>
                                    </div>
                                    <div class="job-post-item-body d-block d-md-flex">
                                        <div class="mr-3"><span class="icon-layers"></span> <a href="#" ><c:out value="${recruitments.company.nameCompany}"/></a></div>
                                        <div><span class="icon-my_location"></span> <c:out value="${recruitments.address}"/></div>
                                    </div>
                                </div>

                                <div class="one-forth ml-auto d-flex align-items-center mt-4 md-md-0" style="width: 330px !important;">
<!--                                    <div>-->
<!--                                        <a href="#" class="icon text-center d-flex justify-content-center align-items-center icon mr-2">-->
<!--                                            <span class="icon-heart"></span>-->
<!--                                        </a>-->
<!--                                    </div>-->
                                    <a href="${pageContext.request.contextPath}/recruitment/detail/${recruitments.id}"  class="btn btn-primary py-2 ml-2">Xem chi tiết</a>
                                    <a href="${pageContext.request.contextPath}/recruitment/updatePost/${recruitments.id}"  class="btn btn-warning py-2 ml-2">Cập nhật</a>
                                    <a class="btn btn-danger py-2 ml-2" href="" data-toggle="modal" data-target="#exampleModal_${recruitments.id}" >Xóa</a>

                                </div>
                            </div>
                        </div><!-- end -->
                        <!-- Modal -->
                        <div class="modal fade" id="exampleModal_${recruitments.id}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Bạn có chắc chắn muốn xóa ?</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        Bài đăng :  <c:out value="${recruitments.title}"/>
                                        <form action="${pageContext.request.contextPath}/recruitment/deleteRec" method="post">
                                            <input type="hidden" class="form-control" id="id" name="id" value="${recruitments.id}">
                                            <div class="modal-footer mt-1">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                                                <button type="submit" class="btn btn-danger">Xóa</button>
                                            </div>
                                        </form>
                                    </div>

                                </div>
                            </div>
                        </div>
                   
                    </c:forEach>
                   
                </div>
                <!-- Modal -->
                <div class="row mt-5">
                    <div class="col text-center">
                        <div class="block-27">
                           <c:if test="${currentPage > 1}">
   									 <a href="${pageContext.request.contextPath}/user/post-list?page=${currentPage - 1}"> <- Trang trước</a>
  								</c:if>
  								<c:forEach begin="1" end="${totalPages}" var="page">
								    <c:choose>
								      <c:when test="${page == currentPage}">
								        <span class="active">Trang: ${page}</span>
								      </c:when>
								      <c:otherwise>
								        <a href="${pageContext.request.contextPath}/user/post-list?page=${page}">${page}</a>
								      </c:otherwise>
								    </c:choose>
							 </c:forEach>
							   <c:if test="${currentPage <= totalPages}">
							    	<a href="${pageContext.request.contextPath}/user/post-list?page=${currentPage + 1}"> -> Trang kế tiếp</a>
							   </c:if>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</section>



<script>
    ClassicEditor.create(document.querySelector('#editorN')).then(eidt => {
        console.log("da" + eidt);
    })
        .catch(error => {
            console.error(error);
        });
</script>

<footer th:replace="public/fragments :: footer" class="ftco-footer ftco-bg-dark ftco-section">

</footer>
</body>
</html>