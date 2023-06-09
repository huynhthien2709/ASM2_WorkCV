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
  <%@include file ="resource.jsp" %>
  
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
            
    <!--        <li class="nav-item"><a href="blog.html" class="nav-link">Công ty</a></li>-->
    <!-- 
            <li th:if="${session.user}" class="nav-item"><a th:href="@{'/user/profile/'+${session.user.id}}" th:text="${session.user.fullName}" class="nav-link" ></a> -->
    
              <ul class="dropdown">
                <li><a href="/">Hồ Sơ</a></li>
    <!--            <li><a href="service-single.html">Đổi mật khẩu</a></li>-->
                <li ><a href="/save-job/get-list" >Công việc đã lưu</a></li>
                <li ><a href="/user/list-post" >Danh sách bài đăng</a></li>
                <li ><a href="/user/get-list-apply" >Công việc đã ứng tuyển</a></li>
                <li ><a href="/user/get-list-company" >Công ty đã theo dõi</a></li>
    <!--            <li th:if="${session.user.role.id == 2}"><a href="/auth/logout" >Ứng cử viên tiềm năng</a></li>-->
                <li><a href="/auth/logout" >Đăng xuất</a></li>
    
              </ul>
            </li>
    
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
                <p class="breadcrumbs mb-0"><span class="mr-3"><a href="index.html">Trang chủ <i class="ion-ios-arrow-forward"></i></a></span> Đăng bài<span></span></p>
                <h1 class="mb-3 bread">Đăng bài tuyển dụng</h1>
            </div>
        </div>
    </div>
</div>
<%-- <div th:if="${success}" class="toast" data-delay="2500" style="position:fixed; top: 100PX; right: 10PX;z-index: 2000;width: 300px">
    <script>
        swal({
            title: 'Đăng tuyển thành công!',
            /* text: 'Redirecting...', */
            icon: 'success',
            timer: 3000,
            buttons: true,
            type: 'success'
        })
    </script>
</div> --%>

<!--<div th:if="${msg_register_error}" class="toast" data-delay="2500" style="position:fixed; top: 100PX; right: 10PX;z-index: 2000;width: 300px">-->
<!--    <div class="toast-header" style="background-color: red">-->

<!--        <strong class="mr-auto" style="color: white">Thông báo</strong>-->
<!--        <small style="color: white">Vừa xong</small>-->
<!--        <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">-->
<!--            <span aria-hidden="true" style="color: white">&times;</span>-->
<!--        </button>-->
<!--    </div>-->
<!--    <div class="toast-body" >-->
<!--        <p th:text="'❌ ' +${msg_register_error}"></p>-->
<!--    </div>-->
<!--    <script>-->
<!--        $(document).ready(function(){-->
<!--            $('.toast').toast('show');-->
<!--        });-->
<!--    </script>-->
<!--</div>-->
<!-- HOME -->
<section class="section-hero overlay inner-page bg-image" style="background-image: url('images/hero_1.jpg');" id="home-section">
    <div class="container">
        <div class="row">
            <div class="col-md-7">
                <h1 class="text-white font-weight-bold">Đăng bài</h1>
                <div class="custom-breadcrumbs">
                    <a href="#">Trang chủ</a> <span class="mx-2 slash">/</span>
                    <span class="text-white"><strong>Đăng bài tuyển dụng</strong></span>
                </div>
            </div>
        </div>
    </div>
</section>
<!--  
<div class="hero-wrap hero-wrap-2" style="background-image: url('user/assets/images/bg_1.jpg');" data-stellar-background-ratio="0.5" th:if="${session.user.role.id == 1 }">
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
<section class="site-section">
    <div class="container">
    <form action='<c:url value = "/recruitment/add" />' name="recruitmentDTO"  method="post">
        <div class="row align-items-center mb-5">
            <div class="col-lg-8 mb-4 mb-lg-0">
                <div class="d-flex align-items-center">
                <c:if test="${recruitmentDTO.id == null }">
                    <div>
                        <h2>Đăng bài</h2>
                    </div>
                    </c:if>
                    <c:if test="${recruitmentDTO.id != null }">
                    <div>
                        <h2>Cập nhật bài đăng</h2>
                    </div>
                   </c:if>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="row">
                    <div class="col-6">
                        <a href="#" class="btn btn-block btn-light btn-md"></a>
                    </div>
                    <c:if test="${recruitmentDTO.id == null }">
	                    <div class="col-6">
	                        <button type="submit" class="btn btn-block btn-primary btn-md">Đăng</button>
	                    </div>
                    </c:if>
                     <c:if test="${recruitmentDTO.id != null }">
	                    <div class="col-6">
	                        <button type="submit" class="btn btn-block btn-primary btn-md">Cập nhật</button>
	                    </div>
                    </c:if>
                </div>
            </div>
        </div>
        <div class="row mb-5">
            <div class="col-lg-12">
                <div class="p-4 p-md-5 border rounded" method="post">
                    <h3 class="text-black mb-5 border-bottom pb-2">Chi tiết bài tuyển dụng</h3>

                    <div class="form-group">
                        <label for="email">Tiêu đề</label>
                        <input type="text" class="form-control" id="email" name="title" value="${recruitmentDTO.title }"  required placeholder="Tiêu đề">
                        <input type="hidden" class="form-control" name="user" value="${userDTO.id}" id="job-title" placeholder="userId"> 
                        <c:if test="${companyDTO.id != null}">                       
                       	 <input type="hidden" class="form-control" name="companyId" value="${companyDTO.id}" id="job-title" placeholder="ID">
                        </c:if>
                        <c:if test="${companyDTO.id == null}">
                       	 <input type="hidden" class="form-control" name="companyId" value="${company.id}" id="job-title" placeholder="ID">
                        </c:if>
                       <c:if test="${recruitmentDTO.id != null}">
                       	  <input type="hidden" class="form-control" name="id" value="${recruitmentDTO.id}" id="job-title" placeholder="ID">
                       </c:if>
                        
                    </div>
                    <div class="form-group">
                        <label for="job-location">Mô tả công việc</label>
                        <textarea  name="description"   class="form-control" id="editorN" placeholder="Mô tả">${recruitmentDTO.description} </textarea>
                    </div>
                    <div class="form-group">
                        <label for="job-title">Kinh nghiệm</label>
                        <input type="text" class="form-control" id="job-title" name="experience"  value="${recruitmentDTO.experience }" placeholder="Kinh nghiệm">
                    </div>
                    <div class="form-group">
                        <label for="job-title">Số người cần tuyển</label>
                        <input type="number" class="form-control" id="job-title" name="quantity"  value="${recruitmentDTO.quantity}" placeholder="Số người cần tuyển">
                    </div>
                    <div class="form-group">
                        <label for="job-location">Địa chỉ</label>
                        <input type="text" class="form-control" id="job-location"  name="address"  value="${recruitmentDTO.address }" placeholder="Địa chỉ công ty">
                    </div>
                    <div class="form-group">
                        <label for="job-location">Hạn ứng tuyển</label>
                        <input type="date" class="form-control" id="job-location"  name="deadline"  value="${recruitmentDTO.deadline }" placeholder="Địa chỉ công ty">
                    </div>
                    <div class="form-group">
                        <label for="job-location">Lương</label>
                        <input type="text" class="form-control" id="job-location"  name="salary"  value="${recruitmentDTO.salary }" placeholder="Mức lương">
                    </div>

                    <div class="form-group">
                        <label for="job-region">Loại công việc</label>
                        <select class="form-control" name="type" aria-label="Default select example" value="${recruitmentDTO.type }" required>
                            <option selected>Chọn loại công việc</option>
                            <option value="Part time">Part time</option>
                            <option value="Full time">Full time</option>
                            <option value="Freelancer">Freelancer</option>
                        </select>

                    </div>
                    <div class="form-group">
                        <label for="job-region">Danh mục công việc</label>
                        <select class="form-control" name="categoryId" aria-label="Default select example" required>
                            <option selected>Chọn danh mục công việc</option>
                            <c:forEach items="${categories}" var="cat" varStatus="loop">
                                <option value="${cat.id}">${cat.name}</option>
                           </c:forEach>

                        </select>

                    </div>
                </div>
            </div>

        </div>
        <div class="row align-items-center mb-5">

            <div class="col-lg-4 ml-auto">
                <div class="row">
                    <div class="col-6">
                        <a href="#" class="btn btn-block btn-light btn-md"></a>
                    </div>
                     <c:if test="${recruitmentDTO.id == null }">
	                    <div class="col-6">
	                        <button type="submit" class="btn btn-block btn-primary btn-md">Đăng tuyển</button>
	                    </div>
                    </c:if>
                    <c:if test="${recruitmentDTO.id != null }">
	                    <div class="col-6">
	                        <button type="submit" class="btn btn-block btn-primary btn-md">Cập nhật</button>
	                    </div>
                    </c:if>
                </div>
            </div>
        </div>
    </form>
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