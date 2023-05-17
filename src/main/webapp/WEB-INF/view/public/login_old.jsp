<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head th:replace="public/fragments :: html_head">
  <title>Skillhunt - Free Bootstrap 4 Template by Colorlib</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  
  <%@include file ="resource.jsp" %>

</head>
<body>

<nav th:replace="public/fragments :: header_menu" class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">

</nav>
<!-- END nav -->
<div class="hero-wrap hero-wrap-2" style="background-image: url('user/assets/images/bg_1.jpg');" data-stellar-background-ratio="0.5">
  <div class="overlay"></div>
  <div class="container">
    <div class="row no-gutters slider-text align-items-end justify-content-start">
      <div class="col-md-12 text-center mb-5">
        <p class="breadcrumbs mb-0"><span class="mr-3"><a href="index.html">Trang chủ <i class="ion-ios-arrow-forward"></i></a></span> đăng nhập<span></span></p>
        <h1 class="mb-3 bread">Đăng nhập / Đăng kí</h1>
      </div>
    </div>
  </div>
</div>
 <!--  <div th:if="${msg_register_success}" class="toast" data-delay="2500" style="position:fixed; top: 100PX; right: 10PX;z-index: 2000;width: 300px">
    <script>
      swal({
        title: 'Đăng ký thành công!',
        /* text: 'Redirecting...', */
        icon: 'success',
        timer: 3000,
        buttons: true,
        type: 'success'
      })
    </script>
  </div> 

<div th:if="${msg_register_error}" class="toast" data-delay="2500" style="position:fixed; top: 100PX; right: 10PX;z-index: 2000;width: 300px">
  <script>
    swal({
      title: 'Đăng ký thất bại!',
      /* text: 'Redirecting...', */
      icon: 'error',
      timer: 3000,
      buttons: true,
      type: 'error'
    })
  </script>
</div>-->
<!-- HOME -->
<section class="section-hero overlay inner-page bg-image" style="background-image: url('images/hero_1.jpg');" id="home-section">
  <div class="container">
    <div class="row">
      <div class="col-md-7">
        <h1 class="text-white font-weight-bold">Đăng kí / đăng nhập</h1>
        <div class="custom-breadcrumbs">
          <a href="#">Trang chủ</a> <span class="mx-2 slash">/</span>
          <span class="text-white"><strong>Đăng nhập</strong></span>
        </div>
      </div>
    </div>
  </div>
</section>

<section class="site-section">
  <div class="container">
    <div class="row">
      <div class="col-lg-6 mb-5">
        <h2 class="mb-4">Đăng kí</h2>
        <form action='<c:url value = "/user/register" />' name="user" method="post" class="p-4 border rounded">

          <div class="row form-group">
            <div class="col-md-12 mb-3 mb-md-0">
              <label class="text-black" for="fname">Email</label>
              <input type="email" id="email" name="email" class="form-control" placeholder="Email" required>
            </div>
          </div>

          <div class="row form-group">
            <div class="col-md-12 mb-3 mb-md-0">
              <label class="text-black" for="fname">Họ và tên</label>
              <input type="text" id="email" name="fullName" class="form-control" placeholder="Họ và tên" required>
            </div>
          </div>

          <div class="row form-group">
            <div class="col-md-12 mb-3 mb-md-0">
              <label class="text-black" for="fname">Mật khẩu</label>
              <input type="password" id=""  name="password" class="form-control" placeholder="Mật khẩu" required>
            </div>
          </div>
          <div class="row form-group mb-4">
            <div class="col-md-12 mb-3 mb-md-0">
              <label class="text-black" for="fname">Nhập lại mật khẩu</label>
              <input type="password" id="fname" name="rePassword" class="form-control" placeholder="Nhập lại mật khẩu" required>
            </div>
          </div>
          <div class="row form-group">
            <div class="col-md-12 mb-3 mb-md-0">
              <label class="text-black" for="fname">Vai trò</label>
              <select class="form-control" name="role" aria-label="Default select example" required>
                <option selected>Chọn vai trò</option>
                <c:forEach items="${roles}" var="r" varStatus="loop">
					<option value="${r.id}">${r.roleName}</option>
				</c:forEach>
              </select>
            </div>
          </div>
          <div class="row form-group">
            <div class="col-md-12">
              <input type="submit" value="Đăng kí" class="btn px-4 btn-primary text-white">
            </div>
          </div>
           <div>
              <p style="color: red" >${msg}</p>
           </div>
           <div>
              <p style="color: red" >${msg2}</p>
           </div>
        </form>
      </div>
      <div class="col-lg-6">
        <h2 class="mb-4">Đăng nhập</h2>
        <form action="<c:url value = "/user/checkLogin" />" name="user" method="post" class="p-4 border rounded">

          <div class="row form-group">
            <div class="col-md-12 mb-3 mb-md-0">
              <label class="text-black" for="fname">Email</label>
              <input type="email" id="fname" name="email" class="form-control" placeholder="Email" required>
            </div>
          </div>
          <div class="row form-group mb-4">
            <div class="col-md-12 mb-3 mb-md-0">
              <label class="text-black" for="fname">Mật khẩu</label>
              <input type="password" id="fname" name="password" class="form-control" placeholder="Mật khẩu" required>
            </div>
          </div>

          <div class="row form-group">
            <div class="col-md-12">
              <input type="submit" value="Đăng nhập" class="btn px-4 btn-primary text-white">
            </div>
          </div>
          
          <div>
              <p style="color: red" >${status}</p>
           </div>

        </form>
      </div>
    </div>
  </div>
</section>

<footer th:replace="public/fragments :: footer" class="ftco-footer ftco-bg-dark ftco-section">

</footer>
</body>
</html>