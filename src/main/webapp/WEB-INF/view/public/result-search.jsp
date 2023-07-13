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
<!-- END nav -->

<div class="hero-wrap img" style="background-image: url(user/assets/images/bg_1.jpg);">
    <div class="overlay"></div>
    <div class="container">
        <div class="row d-md-flex no-gutters slider-text align-items-center justify-content-center">
            <div class="col-md-10 d-flex align-items-center ">
                <div class="text text-center pt-5 mt-md-5">
                    <p class="mb-4">Tìm việc làm, Cơ hội việc làm và Nghề nghiệp</p>
                    <h1 class="mb-5">Cách dễ dàng nhất để có được công việc mới của bạn</h1>
                    <div class="ftco-counter ftco-no-pt ftco-no-pb">
                        <div class="row">
                            <div class="col-md-4 d-flex justify-content-center counter-wrap ">
                                <div class="block-18">
                                    <div class="text d-flex">
                                        <div class="icon mr-2">
                                            <span class="flaticon-visitor"></span>
                                        </div>
                                        <div class="desc text-left">
                                            <strong class="number" data-number="46" th:text="${numberCandidate}"></strong>
                                            <span>Ứng cử viên</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4 d-flex justify-content-center counter-wrap ">
                                <div class="block-18 text-center">
                                    <div class="text d-flex">
                                        <div class="icon mr-2">
                                            <span class="flaticon-visitor"></span>
                                        </div>
                                        <div class="desc text-left">
                                            <strong class="number" data-number="450" th:text="${numberCompany}"></strong>
                                            <span>Công ty</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4 d-flex justify-content-center counter-wrap">
                                <div class="block-18 text-center">
                                    <div class="text d-flex">
                                        <div class="icon mr-2">
                                            <span class="flaticon-resume"></span>
                                        </div>
                                        <div class="desc text-left">
                                            <strong class="number" data-number="80000" th:text="${numberRecruitment}"></strong>
                                            <span>Tuyển dụng</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="ftco-search my-md-5">
                        <div class="row">
                            <div class="col-md-12 nav-link-wrap">
                                <div class="nav nav-pills text-center" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                                    <a class="nav-link active mr-md-1" id="v-pills-1-tab" data-toggle="pill" href="#v-pills-1" role="tab" aria-controls="v-pills-1" aria-selected="true">Tìm công việc</a>

                                    <a class="nav-link" id="v-pills-2-tab" data-toggle="pill" href="#v-pills-2" role="tab" aria-controls="v-pills-2" aria-selected="false">Tìm ứng cử viên</a>
                                    <a class="nav-link" id="v-pills-3-tab" data-toggle="pill" href="#v-pills-3" role="tab" aria-controls="v-pills-3" aria-selected="false">Tìm theo địa điểm</a>
                                </div>
                            </div>
                            <div class="col-md-12 tab-wrap">
                                <div class="tab-content p-4" id="v-pills-tabContent">

                                    <div class="tab-pane fade show active" id="v-pills-1" role="tabpanel" aria-labelledby="v-pills-nextgen-tab">
                                        <form action="${pageContext.request.contextPath}/recruitment/searchByJobName" method="post" class="search-job">
                                            <div class="row no-gutters">

                                                <div class="col-md-10 mr-md-2">
                                                    <div class="form-group">
                                                        <div class="form-field">
                                                            <div class="icon"><span class="icon-map-marker"></span></div>
                                                            <input type="text" name="jobName" class="form-control" placeholder="Tìm kiếm công việc">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md">
                                                    <div class="form-group">
                                                        <div class="form-field">
                                                            <button type="submit" class="form-control btn btn-primary">Tìm kiếm</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>

                                    <div class="tab-pane fade" id="v-pills-2" role="tabpanel" aria-labelledby="v-pills-performance-tab">
                                        <form action="${pageContext.request.contextPath}/recruitment/searchByCompanyName" method="post" class="search-job">
                                            <div class="row no-gutters">

                                                <div class="col-md-10 mr-md-2">
                                                    <div class="form-group">
                                                        <div class="form-field">
                                                            <div class="icon"><span class="icon-map-marker"></span></div>
                                                            <input type="text" name="companyName" class="form-control" placeholder="Tìm kiếm công ty">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md">
                                                    <div class="form-group">
                                                        <div class="form-field">
                                                            <button type="submit" class="form-control btn btn-primary">Tìm kiếm</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="tab-pane fade" id="v-pills-3" role="tabpanel" aria-labelledby="v-pills-performance-tab">
                                        <form action="${pageContext.request.contextPath}/recruitment/searchByAddress" method="post" class="search-job">
                                            <div class="row no-gutters">

                                                <div class="col-md-10 mr-md-2">
                                                    <div class="form-group">
                                                        <div class="form-field">
                                                            <div class="icon"><span class="icon-map-marker"></span></div>
                                                            <input type="text" name="address" class="form-control" placeholder="Tìm kiếm theo địa điểm">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md">
                                                    <div class="form-group">
                                                        <div class="form-field">
                                                            <button type="submit" class="form-control btn btn-primary">Tìm kiếm</button>
                                                        </div>
                                                    </div>
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
        </div>
    </div>
</div>

<section class="ftco-section bg-light" >
    <div class="container">
        <h4 style="margin-top: -20px">Kết quả tìm kiếm cho : <span>${jobName}</span></h4>
        <div class="row">
            <div class="col-lg-12 pr-lg-5">
                <div class="row">                  
                    <c:forEach items="${recruitments}" var="recruitment">
                        <div class="col-md-12 ">
                            <div class="job-post-item p-4 d-block d-lg-flex align-items-center">
                                <div class="one-third mb-4 mb-md-0">
                                    <div class="job-post-item-header align-items-center">
                                        <span class="subadge" ><c:out value="${recruitment.type}"/></span>
                                        <h2 class="mr-3 text-black" ><a href="${pageContext.request.contextPath}/recruitment/detail/${recruitment.id}" ><c:out value="${recruitment.title}"/></a></h2>
                                    </div>
                                    <div class="job-post-item-body d-block d-md-flex">
                                        <div class="mr-3"><span class="icon-layers"></span> <a href="#"  ><c:out value="${recruitment.company.nameCompany}"/></a></div>
                                        <div><span class="icon-my_location"></span> <span><c:out value="${recruitment.address}"/></span></div>
                                    </div>
                                </div>
                             <%--  <input type="hidden" id="${'idRe'}+${recruitment.id}" value="${recruitment.id}"> --%> 
                                <div class="one-forth ml-auto d-flex align-items-center mt-4 md-md-0">                                
                                    <div>
                                        <a  href="<c:url value = "/recruitment/saveJob/${recruitment.id}"/> class="icon text-center d-flex justify-content-center align-items-center icon mr-2">
                                            <span class="icon-heart"></span>
                                        </a>
                                    </div>
                                    <c:if test="${sessionScope.userDTO == null}">
                                    	<a href="<c:url value = "/user/login"/>" class="btn btn-primary py-2">Đăng nhập</a>
                                    </c:if>
                                    <c:if test="${sessionScope.userDTO != null}">
                                    	<a  data-toggle="modal" data-target="#exampleModal_${recruitment.id}"  class="btn btn-primary py-2">Apply Job</a>
                                    </c:if>
                                </div>
                            </div>
                        </div><!-- end -->
                        <!-- Modal -->
                        <div class="modal fade" id="exampleModal_${recruitment.id}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Ứng tuyển: <span><c:out value="${recruitment.title}"/></span></h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <form method="post" action="/user/apply-job">
                                        <div class="modal-body">
                                            <div class="row">
                                                <div class="col-12">
                                                    <select id="${'choose'}_${recruitment.id}" onchange="choosed(${recruitment.id})" class="form-control" aria-label="Default select example">
                                                        <option selected>Chọn phương thức nộp</option>
                                                        <option value="1">Dùng cv đã cập nhật</option>
                                                        <option value="2">Nộp cv mới</option>
                                                    </select>
                                                </div>
                                                <div id="loai1_${recruitment.id}" style="display:none" class="col-12">
                                               		<input type="hidden" id="userId_${recruitment.id}" name="user" value="${user.id}">
													<input type="hidden" id="recruitments_${recruitment.id}" name="recruitments" value="${recruitment.id}">
													<input type="hidden" id="cv_${recruitment.id}" name="cv" value="${cv.fileName}">
                                                    <label for="fileUpload"
                                                           class="col-form-label">Giới thiệu:</label>
                                                    <textarea rows="10" cols="3" class="form-control"  id="text_${recruitment.id}">

                                                    </textarea>
                                                </div>
                                                <div id="loai2_${recruitment.id}" style="display:none" class="col-12">
													<input type="hidden" id="userId_${recruitment.id}" name="user" value="${user.id}">
													<input type="hidden" id="recruitments_${recruitment.id}" name="recruitments" value="${recruitment.id}">	
                                                    <label for="fileUpload"
                                                           class="col-form-label">Chọn cv:</label>
                                                    <input type="file" class="form-control"
                                                           id="${'fileUpload1'}_${recruitment.id}" name="file" 
                                                           onchange="fileUploadChange(${recruitment.id})"  required>
                                                    <label for="fileUpload"
                                                           class="col-form-label">Giới thiệu:</label>
                                                    <textarea rows="10" cols="3" class="form-control"  id="text-${recruitment.id}" >

                                                    </textarea>
                                                </div>

                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                                                <button type="button" id="button1_${recruitment.id}" style="display: none" onclick="apply1(${recruitment.id})" class="btn btn-primary">Nộp</button>
                                                <button type="button" id="button2_${recruitment.id}" style="display: none" onclick="apply(${recruitment.id})" class="btn btn-primary">Nộp</button>
                                            </div>
                                        </div>
                                    </form>


                                </div>
                            </div>
                        </div>
                    </c:forEach>>
                    <c:if test="${recruitments.size() == 0 }">
	                    <div   style="text-align: center" >
	                        <p style="color: red">Không có kết quả nào</p>
	                    </div>
                    </c:if>
                </div>

                <div class="row mt-5">
                    <div class="col text-center">
                        <div class="block-27">
                            <ul>
                                <li th:if="${numberPage>0}"><a th:href="@{'/recruitment/search/'+ ${keySearch}(page = ${list.number - 1})}">&lt;</a></li>
                                <th:block th:each="recruitment,state  : ${recruitmentList}">
                                    <li th:class="${numberPage == state.index  ? 'active' : null }"><a th:href="@{'/recruitment/search/'+ ${keySearch}(page = ${state.index})}" th:text="${state.index + 1}"></a></li>
                                </th:block>
                                <li th:if="${numberPage<list.totalPages - 1}"><a th:href="@{'/recruitment/search/'+ ${keySearch}(page = ${list.number + 1})}">&gt;</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</section>

<script>
    function apply1(id){
        var name = "#idRe" +id;
        var nameModal = "#exampleModal" +id;
        var nameFile = "#fileUpload"+id;
        var nameText = "#text" +id;
        var idRe = $(name).val();
        var textvalue = $(nameText).val();
        
        var userId = $("#userId_" + id).val();
		var recruitmentId = $("#recruitments_" + id).val();
		var cvPath = $("#cv_" + id).val();
		var text = $("#text_" + id).val();
        var formData = new FormData();
        formData.append('userId', userId);
		formData.append('recruitmentId', recruitmentId);
		formData.append('nameCv', cvPath);
		formData.append('text', text);
        $.ajax(
            {
                type: 'POST',
                url: '${pageContext.request.contextPath}/user/apply-job/',
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
                            title: 'Ứng tuyển thành công!',
                            /* text: 'Redirecting...', */
                            icon: 'success',
                            timer: 3000,
                            buttons: true,
                            type: 'success'
                        })
                        $(nameModal).modal('hide');
                        $('#fileUpload').val("");
                    }else{
                        swal({
                            title: 'Bạn đã ứng tuyển công việc này!',
                            /* text: 'Redirecting...', */
                            icon: 'error',
                            timer: 3000,
                            buttons: true,
                            type: 'error'
                        })
                        $(nameModal).modal('hide');
                        $('#fileUpload').val("");
                    }
                },
                error: function (err) {
                    alert(err);
                }
            }
        )


    }
    function choosed(id){
        var name = '#choose_' + id;
        var name1 = 'loai1_' + id;
        var name2 = 'loai2_' + id;
        var button1 = 'button1_' + id;
        var button2 = 'button2_' + id;
        var giaitri = $(name).val();
        if(giaitri == 1){
            document.getElementById(name1).style.display = 'block'
            document.getElementById(name2).style.display = 'none'
            document.getElementById(button1).style.display = 'block'
            document.getElementById(button2).style.display = 'none'
        }else{
            document.getElementById(name2).style.display = 'block'
            document.getElementById(name1).style.display = 'none'
            document.getElementById(button2).style.display = 'block'
            document.getElementById(button1).style.display = 'none'
        }
    }

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
                    console.log(data);
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

    function apply(id){
        var name = "#idRe" +id;
        var nameModal = "#exampleModal" +id;
        var nameFile = "#fileUpload"+id;
        var nameText = "#text" +id;
        var idRe = $(name).val();
        var textvalue = $(nameText).val();
/*         var fileUpload = $(nameFile).get(0);
        var files = fileUpload.files; */
        
        var userId = $("#userId_" + id).val();
		var recruitmentId = $("#recruitments_" + id).val();
		var cvPath = $("#cv_" + id).val();
		var text = $("#text-" + id).val();
        var formData = new FormData();
        formData.append('userId', userId);
		formData.append('recruitmentId', recruitmentId);
		formData.append('nameCv', cvPath);
		formData.append('text', text);
        if(cvPath == ''){
            swal({
                title: 'Bạn cần phải chọn cv!',
                /* text: 'Redirecting...', */
                icon: 'error',
                timer: 3000,
                buttons: true,
                type: 'error'
            })
        } else {
            $.ajax(
                {
                    type: 'POST',
                    url: '${pageContext.request.contextPath}/user/apply-job/',
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
                                title: 'Ứng tuyển thành công!',
                                /* text: 'Redirecting...', */
                                icon: 'success',
                                timer: 3000,
                                buttons: true,
                                type: 'success'
                            })
                            $(nameModal).modal('hide');
                            $('#fileUpload').val("");
                        }else{
                            swal({
                                title: 'Bạn đã ứng tuyển công việc này!',
                                /* text: 'Redirecting...', */
                                icon: 'error',
                                timer: 3000,
                                buttons: true,
                                type: 'error'
                            })
                            $(nameModal).modal('hide');
                            $('#fileUpload').val("");
                        }
                    },
                    error: function (err) {
                        alert(err);
                    }
                }
            )
        }

    }
</script>
<script>
    
        function fileUploadChange(inputId) {
            if (window.FormData !== undefined) {
                var fileUpload = $('#fileUpload1_' + inputId).get(0);
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
                                     /* $('#fileUploadCVJob').val(urlImage);
                                    const fileName = urlImage.substr(urlImage.lastIndexOf('/') + 1);
                                    document.getElementById('cvErrorMsg').innerHTML = fileName;
                                    document.getElementById('nameCv').innerHTML = 'Xem cv';
                                    document.getElementById('nameCv').href = "http://localhost:8080/resources/CandidateImage/"+urlImage ; //or grab it by tagname etc */
                                    document.getElementById('cv_' + inputId).value = urlImage;
                                    
										
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
        }

</script>



<footer th:replace="public/fragments :: footer" class="ftco-footer ftco-bg-dark ftco-section">

</footer>


<!-- loader -->
<!--<div th:replace="public/fragments :: loading" id="ftco-loader" class="show fullscreen"></div>-->

</body>
</html>