<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
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
        <a class="navbar-brand" href="<c:url value = "/"/>">Work CV</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
          <span class="oi oi-menu"></span> Menu
        </button>
    
        <div class="collapse navbar-collapse" id="ftco-nav">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item active"><a href="/" class="nav-link">Trang chủ</a></li>
            <li class="'nav-item"><a href="/" class="nav-link">Công việc</a></li>
            <li class="nav-item"><a href="/" class="nav-link">Ứng cử viên</a></li>
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
    
              <li class="nav-item cta mr-md-1"><a href="/recruitment/post" class="nav-link">Đăng tuyển</a></li>
            <li class="nav-item cta cta-colored"><a href="/auth/login" class="nav-link">Đăng nhập</a></li>
    
          </ul>
        </div>
      </div>
</nav>



<div class="hero-wrap hero-wrap-2" style="background-image: url(<c:url value="/resources/assets/images/bg_1.jpg"/>);" data-stellar-background-ratio="0.5">
    <div class="overlay"></div>
    <div class="container">
        <div class="row no-gutters slider-text align-items-end justify-content-start">
            <div class="col-md-12 text-center mb-5">
                <h1 class="mb-3 bread">Hồ sơ </h1>               
                <div class="form-group">
                    <label class="btn btn-primary btn-md btn-file">
                        Chọn ảnh<input type="file" name="file" id="fileUpload" hidden />                         
                    </label>
                </div>                
                <div style="margin-left: 0px" id="divImage" >
                    <img id="avatar" height="100" width="100" style="border-radius: 50px" src="${userDTO.image}">
                </div>
            </div>
        </div>
    </div>
</div>
<!-- HOME 
<div th:if="${userInformation.status == 0}" class="container-fluid" style="text-align: center">
    <p style="font-size: 20px;font-weight: bold;color: #aaa;margin-top: 10px">Xác thực email đăng nhập</p>
    <div style="width: 600px;height: 400px;border-radius: 5px;
    box-shadow: rgba(0, 0, 0, 0.4) 0px 0px 10px;margin: 20px auto;padding: 15px">
        <p style="line-height: 35px;font-size: 16px">Xin chào, <span th:text="${userInformation.fullName}" ></span> và làm theo hướng dẫn trong email.
            Trường hợp không nhận được email, bạn vui lòng bấm nút Nhận email xác thực dưới đây.</p>
        <div class="row form-group">
            <form action="/user/confirm-account" method="post" class="col-md-12">
                <input type="hidden" th:value="${userInformation.email}" name="email" class="btn px-4 btn-primary text-white">
                <input type="submit" value="Nhận email xác thực" class="btn px-4 btn-primary text-white">
            </form>
        </div>
        <p>Mọi thắc mắc vui lòng liên hệ bộ phận CSKH của WorkCV:<br></p>
        - Điện thoại:<span style="color:#5f80ec">(024) 6680 5588</span><br>
        - Email: <a href="#" style="color:#5f80ec"> hotro@workcv.vn</a>
    </div>
    <div th:if="${comfirm_await}" style="width: 600px;height: 400px;border-radius: 5px;
    box-shadow: rgba(0, 0, 0, 0.4) 0px 0px 10px;margin: 20px auto;padding: 15px">
        <p style="line-height: 35px;font-size: 16px">Xin chào, <span th:text="${userInformation.fullName}" ></span> .Bạn đã gửi yêu cầu xác thực thành công,
            vui lòng kiểm tra mail để xác thực.Cảm ơn bạn!!!
        </p>
        <p>Mọi thắc mắc vui lòng liên hệ bộ phận CSKH của WorkCV:<br></p>
        - Điện thoại:<span style="color:#5f80ec">(024) 6680 5588</span><br>
        - Email: <a href="#" style="color:#5f80ec"> hotro@workcv.vn</a>
    </div>
</div>-->
<section th:if="${userInformation.status == 1 && userInformation.role.id == 1}" class="site-section" style="margin-top: 10px">
    <div class="container">
        <form enctype="multipart/form-data">
            <div class="row align-items-center mb-5">
                <div class="col-lg-8 ">
                    <div class="d-flex align-items-center">
                        <div class="form-group" style="margin-top: 15px">
                            <label class="btn btn-primary btn-md btn-file">
                                Chọn cv (pdf)<input type="file" name="file" id="fileUpload1" required hidden>
                            </label>
                        </div>
                    </div>
                    <p id="cvName" if="${Cv != null}" th:text="${Cv != null ? Cv.fileName :'Chưa cập nhập'}"></p>
                    <p id="cvName" if="${Cv == null}"></p>
                    <c:if test="${cv != null }">
                    <a id="nameCv" href="${cv.fileName}" target="_blank">Xem cv: ${cv.cvShortName} </a>                    
                    <a id="nameCv"  href="${'http://localhost:8080/resources/uploads/'}" ></a>
                    <a style="color: red;margin-left: 20px" if="${Cv !=null}" data-toggle="modal" data-target="#exampleModal" >Xóa cv</a>                    
                    <a style="color: red;margin-left: 20px" if="${Cv ==null}" id="xoa" data-toggle="modal" data-target="#exampleModal" ></a>
                    </c:if>
                </div>

                <div class="col-lg-4">
                    <div class="row">
<!--                        <div class="col-6">-->
<!--                            <button type="submit" id="myBtn" class="btn btn-block btn-light btn-md"><span class="icon-open_in_new mr-2"></span>Cập nhật cv</button>-->
<!--                        </div>-->
                    </div>
                </div>
            </div>
        </form>
		<c:if test="${userDTO.role == 1 }">
        <form action="${pageContext.request.contextPath}/user/updateUserCandidate" name="user" method="post" >
            <div class="row align-items-center mb-5">
                <div class="col-lg-8 mb-4 mb-lg-0">
                    <div class="d-flex align-items-center">
                        <div>
                            <h2>Cập nhật thông tin</h2>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="row">

                        <div class="col-6">
                            <button type="submit" class="btn btn-block btn-primary btn-md">Lưu thông tin</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row mb-5">
                <div class="col-lg-12">
                    <div class="p-4 p-md-5 border rounded" method="post">
                    	<input type="text" name="cv" id="fileUploadCandidate" hidden /> 
                        <h3 class="text-black mb-5 border-bottom pb-2">Thông tin chi tiết</h3>
                        <input type="hidden" name="id" value="${userDTO.id}">
						<input type="hidden" name="status" value="${userDTO.status}">
						<input type="hidden" name="role" value="${userDTO.role}">
						<input type="hidden" name="password" value="${userDTO.password}">
						<%-- <input type="hidden" name="cv" value="${userDTO.cv}"> --%>
						
                        <div class="form-group">
                            <label for="email">Email</label>
                            <input type="email" class="form-control" id="email" name="email" value="${userDTO.email}" required placeholder="you@yourdomain.com">
                        </div>
                        <div class="form-group">
                            <label for="job-title">Full name</label>
                            <input type="text" class="form-control" name="fullName" value="${userDTO.fullName}" required id="job-title" placeholder="Full name">
                        </div>
                        <div class="form-group">
                            <label for="job-location">Địa chỉ</label>
                            <input type="text" name="address" value="${userDTO.address}" class="form-control" id="job-location" required placeholder="e.g. New York">
                        </div>
                        <div class="form-group">
                            <label for="job-location">Số điện thoại</label>
                            <input type="text" name="phoneNumber" value="${userDTO.phoneNumber}" class="form-control" id="job-location" required placeholder="+ 84">
                        </div>
                        <div class="form-group">
                            <label for="job-location">Mô tả bản thân</label>
                            <textarea  name="description" text="${userDTO.description}" class="form-control" id="editor" placeholder="Mô tả">${userDTO.description}</textarea>
                        </div>

                    </div>

                </div>

            </div>
        </form>
        </c:if>
    </div>
</section>
<!-- Modal -->
<div class="modal fade"  id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Bạn có chắc chắn muốn xóa ?</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                Cv : <span id="cvXoa" >${cv.cvShortName}</span>
                <!--  <span  text="${cv.fileName}"></span>-->
                <form action="${pageContext.request.contextPath}/user/deleteCv" name="user" method="post">
                    <div class="modal-footer mt-1">
                        <input type="hidden"  name="idCv">
                        <input type="text" name="cv" value="${cv.id}" hidden /> 
                        <button type="submit" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                        <button type="submit" class="btn btn-danger">Xóa</button>
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>
<c:if test="${userDTO.role == 2 }">
<section class="site-section" style="margin-top: 10px">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 mb-5">
                <h2 class="mb-4">Thông tin cá nhân</h2>
                <form action="${pageContext.request.contextPath}/user/updateProfile" name="user" method="post" >
                    <div class="row mb-5">
                        <div class="col-lg-12">
                            <div class="p-4 p-md-5 border rounded " method="post">
                               <input type="text" name="image" id="fileUpload2UserPath" hidden />
                            	<input type="hidden" name="id" value="${userDTO.id}">
								<input type="hidden" name="status" value="${userDTO.status}">
								<input type="hidden" name="role" value="${userDTO.role}">
								<input type="hidden" name="password" value="${userDTO.password}">  
                                <div class="form-group">
                                    <label for="email">Email</label>
                                    <input type="email" class="form-control" name="email" value="${userDTO.email}" required placeholder="you@yourdomain.com">
                                </div>
                                <div class="form-group">
                                    <label for="job-title">Họ và tên</label>
                                    <input type="text" class="form-control" name="fullName" value="${userDTO.fullName}" required placeholder="Full name">
                                </div>
                                <div class="form-group">
                                    <label for="job-location">Địa chỉ</label>
                                    <input type="text" name="address" value="${userDTO.address}" required class="form-control"  placeholder="e.g. New York">
                                </div>
                                <div class="form-group">
                                    <label for="job-location">Số điện thoại</label>
                                    <input type="text" name="phoneNumber" value="${userDTO.phoneNumber}" required class="form-control"  placeholder="+ 84">
                                </div>
                              
		                        <div class="form-group">
                                    <label for="job-location">Mô tả bản thân</label>
                                    <textarea  name="description"  class="form-control" id="editorT" placeholder="Mô tả">${userDTO.description}</textarea>
                                </div>
                                <div class="row form-group">
                                    <div class="col-md-12">
                                        <input type="submit" value="Lưu thông tin" class="btn px-4 btn-primary text-white">
                                    </div>
                                </div>
                                
                            </div>

                        </div>

                    </div>
                </form>
            </div>
              
            <div class="col-lg-6">           
                <h2 class="mb-4">Thông tin công ty</h2>                             
                <div class="form-group">
                    <label for="company-website-tw d-block1">Cập nhật Logo</label> <br>
                    <label class="btn btn-primary btn-md btn-file">
                        Chọn logo<input type="file" name="file" id="fileUpload2" required hidden />
                    </label>
                    <div id="divLogo">
                        <img id="avatar1" src="${companyDTO.logo}" height="100" width="100" style="border-radius: 50px" >
                    </div>
                </div>             
                <form action="${pageContext.request.contextPath}/user/updateCompanyInfo" name="companyDTO" method="post"> 
                    <div class="row mb-5">
                        <div class="col-lg-12">
                            <div class="p-4 p-md-5 border rounded">
                            	<input type="text" name="logo" id="fileUpload2Path"  hidden />
                            	
                                <div class="form-group">
                                    <label for="email">Email</label>
                                    <input type="text" class="form-control"  id="email1" name="email" value="${companyDTO.email}" required placeholder="you@yourdomain.com" />
                                </div>
                                <div class="form-group">
                                    <label for="job-title">Tên công ty</label>
                                    <input type="text" class="form-control" name="nameCompany" value="${companyDTO.nameCompany}" id="job-title"  placeholder="Full name" required>                                    
                                    <input type="hidden" class="form-control" name="user" value="${userDTO.id}" id="job-title" placeholder="userId">
                                     <input type="hidden" class="form-control" name="id" value="${companyDTO.id}" id="job-title" placeholder="ID">
                                </div>
                                <div class="form-group">
                                    <label for="job-location">Địa chỉ</label>
                                    <input type="text" name="address" value="${companyDTO.address}" required class="form-control" id="job-location" placeholder="e.g. New York">
                                </div>
                                <div class="form-group">
                                    <label for="job-location">Số điện thoại công ty</label>
                                    <input type="text" name="phoneNumber" value="${companyDTO.phoneNumber}" required class="form-control" id="job-location" placeholder="+ 84">
                                </div>
                                <div class="form-group">
                                    <label for="job-location">Mô tả công ty</label>
                                    <textarea  name="description"  class="form-control" id="editorN" placeholder="Mô tả">${companyDTO.description}</textarea>
                                </div>

								<c:if test="${companyDTO.logo != null}">
                                <div style="margin-left: 0px" id="divImag1">
                                    <img id="avatar" height="100" width="100" style="border-radius: 50px;margin-bottom: 15px" src="${companyDTO.logo}">
                                </div>
                                </c:if>
                                <div class="row form-group" >
                                    <div class="col-md-12">
                                        <input type="submit" value="Lưu thông tin" class="btn px-4 btn-primary text-white">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>
</c:if>
<script>
    ClassicEditor.create(document.querySelector('#editor')).then(eidt => {
        console.log("da" + eidt);
    })
        .catch(error => {
            console.error(error);
        });   
    ClassicEditor.create(document.querySelector('#editorT')).then(eidt => {
        console.log("da" + eidt);
    })
        .catch(error => {
            console.error(error);
        });
</script>
<script>
    $(function () {
        $('#fileUpload').change(function () {
            if (window.FormData !== undefined) {
                var fileUpload = $('#fileUpload').get(0);
                var files = fileUpload.files;
                //var email = $("#email").val();
                var formData = new FormData();
                formData.append('file', files[0]);
                //formData.append('email', email);
                if(files[0] == null){
                    // document.getElementById("change").style.backgroundColor = 'red';
                    // $('#text').val(" ❌ Cập nhật ảnh thất bại");
                    $(".toast").toast("show");
                } else {
                    $.ajax(
                        {
                            type: 'POST',                           
                            url: '${pageContext.request.contextPath}/user/upload-user/',
                            contentType: false,
                            processData: false,
                            data: formData,
                            success: function (urlImage) {
                                console.log(urlImage)
                                if(urlImage == "Error"){
                                    document.getElementById("change").style.backgroundColor = 'red';
                                    swal({
                                        title: 'Cập nhật ảnh đại diện thất bại!',
                                        /* text: 'Redirecting...', */
                                        icon: 'error',
                                        timer: 3000,
                                        buttons: true,
                                        type: 'error'
                                    })
                                    $("#divImage").css("display","block")
                                }else{
                                    $('#avatar').attr('src', urlImage)
                                    $('#fileUpload2UserPath').val(urlImage);                                   
                                    swal({
                                        title: 'Cập nhật ảnh đại diện thành công!',
                                        /* text: 'Redirecting...', */
                                        icon: 'success',
                                        timer: 3000,
                                        buttons: true,
                                        type: 'success'
                                    })
                                }

                            },
                            error: function (err) {
                                alert(err);
                            }
                        }
                    )
                }

            }
        })
    })
 
</script>

<script>
    $(function () {
        $('#fileUpload2').change(function () {
        	console.log('File changed');
            if (window.FormData !== undefined) {
                var fileUpload = $('#fileUpload2').get(0);
                var files = fileUpload.files;
                //var email = $("#email").val();
                var formData = new FormData();
                formData.append('file', files[0]);
                //formData.append('email', email);
                if(files[0] == null){                	
                    // document.getElementById("change").style.backgroundColor = 'red';
                    // $('#text').val(" ❌ Cập nhật ảnh thất bại");
                    $(".toast").toast("show");
                } else {                	
                    $.ajax(
                        {
                            type: 'POST',
                            url: '${pageContext.request.contextPath}/user/upload-company/',
                            contentType: false,
                            processData: false,
                            data: formData,
                            success: function (urlImage) {
                                console.log(urlImage)
                                if(urlImage == "Error"){
                                    document.getElementById("change").style.backgroundColor = 'red';
                                    swal({
                                        title: 'Cập nhật logo thất bại!',
                                        /* text: 'Redirecting...', */
                                        icon: 'error',
                                        timer: 3000,
                                        buttons: true,
                                        type: 'error'
                                    })
                                    $("#divLogo").css("display","block")
                                }else{
                                    $('#avatar1').attr('src', urlImage);
                                    $('#fileUpload2Path').val(urlImage);
                                    swal({
                                        title: 'Cập nhật logo thành công!',
                                        /* text: 'Redirecting...', */
                                        icon: 'success',
                                        timer: 3000,
                                        buttons: true,
                                        type: 'success'
                                    })
                                }

                            },
                            error: function (err) {
                                alert(err);
                            }
                        }
                    )
                }

            }
        })
    })
</script>

<script>
    $(function () {
        $('#fileUpload1').change(function () {
            if (window.FormData !== undefined) {
                var fileUpload = $('#fileUpload1').get(0);
                var files = fileUpload.files;
                var formData = new FormData();
                formData.append('file', files[0]);
                if(files[0] == null){
                    // document.getElementById("change").style.backgroundColor = 'red';
                    // $('#text').val(" ❌ Cập nhật ảnh thất bại");
                    $(".toast").toast("show");
                } else {
                    $.ajax(
                        {
                            type: 'POST',
                            url: '${pageContext.request.contextPath}/user/upload-Candidate/',
                            contentType: false,
                            processData: false,  
                            data: formData,
                            success: function (urlImage) {
                                console.log(urlImage)
                                if(urlImage == "Error"){
                                    // document.getElementById("change").style.backgroundColor = 'red';

                                    swal({
                                        title: 'Cần chọn đúng loại file (PDF)!',
                                        /* text: 'Redirecting...', */
                                        icon: 'error',
                                        timer: 3000,
                                        buttons: true,
                                        type: 'error'
                                    })
                                    // $("#divImage").css("display","block")
                                }else{
                                    // $('#avatar').attr('src', urlImage)
                                     $('#fileUploadCandidate').val(urlImage);
                                    document.getElementById('nameCv').innerHTML = 'Xem cv';
                                    document.getElementById('nameCv').href = "http://localhost:8080/resources/CandidateImage/"+urlImage ; //or grab it by tagname etc
                                    document.getElementById('xoa').innerHTML = 'Xóa cv';
                                    document.getElementById("cvName").innerHTML = urlImage;
                                    document.getElementById("cvXoa").innerHTML = urlImage;

                                    swal({
                                        title: 'Cập nhật CV thành công!',
                                        /* text: 'Redirecting...', */
                                        icon: 'success',
                                        timer: 3000,
                                        buttons: true,
                                        type: 'success'
                                    })
                                }

                            },
                            error: function (err) {
                                alert(err);
                            }
                        }
                    )
                }

            }
        })
    })
</script>

<footer th:replace="public/fragments :: footer" class="ftco-footer ftco-bg-dark ftco-section">

</footer>
</body>
</html>