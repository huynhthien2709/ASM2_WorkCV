<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head th:replace="public/fragments :: html_head">
    <title>Detail Post</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <%@include file="resource.jsp"%>
      
</head>
<body>

    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid px-md-4	">
          <a class="navbar-brand" href="<%= request.getContextPath()%>">Work CV</a>
      
          <div class="collapse navbar-collapse" id="ftco-nav">
            <ul class="navbar-nav ml-auto">
            
              <li class="nav-item active"><a href="<%= request.getContextPath()%>" class="nav-link">Trang chủ</a></li>
              <li class="'nav-item"><a href="<c:url value = "/user/post-list"/>" class="nav-link">Công việc</a></li>
              <c:if test="${userDTO.role == '2'}">
              	<li class="nav-item"><a href="<c:url value = "/user/list-user"/>" class="nav-link">Ứng cử viên</a></li>
              </c:if>
                <ul class="dropdown">
                  <li><a href="/">Hồ Sơ</a></li>
                  <li ><a href="/save-job/get-list" >Công việc đã lưu</a></li>
                  <li ><a href="/user/list-post" >Danh sách bài đăng</a></li>
                  <li ><a href="/user/get-list-apply" >Công việc đã ứng tuyển</a></li>
                  <li ><a href="/user/get-list-company" >Công ty đã theo dõi</a></li>
                  <li><a href="/auth/logout" >Đăng xuất</a></li>
                </ul>
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



<div class="hero-wrap hero-wrap-2" style="background-image: url(<c:url value="/resources/assets/images/bg_1.jpg"/>);" data-stellar-background-ratio="0.5">
    <div class="overlay"></div>
    <div class="container">
        <div class="row no-gutters slider-text align-items-end justify-content-start">
            <div class="col-md-12 text-center mb-5">
                <p class="breadcrumbs mb-0"><span class="mr-3"><a href="index.html">Trang chủ <i class="ion-ios-arrow-forward"></i></a></span>Chi tiết <span></span></p>
                <h1 class="mb-3 bread">Chi tiết công việc</h1>
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
							<img width="100" height="100"
								src="${recruitmentDTO.company.logo}" alt="Image">
						</div>
						<div>
							<h2></h2>
							<div>
								<span class="icon-briefcase mr-2"></span><a
									class="ml-0 mr-2 mb-2">${recruitmentDTO.company.nameCompany}</a>
								<span class="icon-room mr-2"></span><span class="m-2">${recruitmentDTO.address}</span>
								<span class="icon-clock-o mr-2"></span><span class="m-2">${recruitmentDTO.type}</span>
							</div>
							<input type="hidden">
						</div>
					</div>
				</div>
				<c:if test="${sessionScope.userDTO == null}">
					<div class="col-lg-4">
						<div class="row">
							<div class="col-6">
								<a class="btn btn-block btn-light btn-md" ><span
									class="icon-heart-o mr-2 text-danger" ></span>Lưu</a>
							</div>
							<div class="col-6">
								<a data-toggle="modal"  data-target="#myModal" class="btn btn-block btn-primary btn-md">Ứng
									tuyển</a>
							</div>
						</div>
					</div>
					<div class="col-lg-4">
						<div class="row">
							<div class="col-6">
								<a class="btn btn-block btn-light btn-md" ><span
									class="icon-heart-o mr-2 text-danger"></span>Lưu</a>
							</div>
							<div class="col-6">
								<a data-toggle="modal" data-target="#myModal"
									class="btn btn-block btn-primary btn-md">Ứng tuyển</a>
							</div>
						</div>
					</div>
				
				<!-- Modal asking for login  -->
				<div class="modal fade" id="myModal" role="dialog">
					<div class="modal-dialog">

						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
							</div>
							<div class="modal-body">
								<p>Bạn cần đăng nhập để ứng tuyển</p>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Đóng</button>
							</div>
						</div>

					</div>
				</div>
				<!-- End Modal asking for login  -->
				
				<!-- Modal save button  -->
				<div class="modal fade" id="saveModal" role="dialog">
					<div class="modal-dialog">

						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
							</div>
							<div class="modal-body">
								<p>Bạn đã lưu công việc này</p>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Đóng</button>
							</div>
						</div>

					</div>
				</div>
				<!-- End Modal save button   -->

			</c:if>
			<!-- modal -->
			<c:if test="${sessionScope.userDTO != null}">
					<div class="col-lg-4">
						<div class="row">
							<div class="col-6">
								<a href="<c:url value = "/recruitment/saveJob/${recruitmentDTO.id}"/>" class="btn btn-block btn-light btn-md"><span
									class="icon-heart-o mr-2 text-danger" data-toggle="modal"  data-target="#saveModal"></span>Lưu</a>
							</div>
							<div class="col-6">
								<input type="hidden" id="recruitmentDTO_${recruitmentDTO.id}" name="recruitmentDTO" value="${recruitmentDTO.id}">
								<a data-toggle="modal"  data-target="#exampleModal_${recruitmentDTO.id}"  class="btn btn-block btn-primary btn-md">Ứng
									tuyển</a>
							</div>
						</div>
					</div>
					<div class="col-lg-4">
						<div class="row">
							<div class="col-6">
								<a href="<c:url value = "/recruitment/saveJob/${recruitmentDTO.id}"/>" class="btn btn-block btn-light btn-md"><span
									class="icon-heart-o mr-2 text-danger" data-toggle="modal"  data-target="#saveModal"></span>Lưu</a>
							</div>
							<div class="col-6">
								<input type="hidden" id="recruitmentDTO_${recruitmentDTO.id}" name="recruitmentDTO" value="${recruitmentDTO.id}">
								<a data-toggle="modal" data-target="#exampleModal_${recruitmentDTO.id}" 
									class="btn btn-block btn-primary btn-md">Ứng tuyển</a>
							</div>
						</div>
					</div>
				</c:if>
			
           
        </div>
        <div class="row">
            <div class="col-lg-8">
                <div class="mb-5">

                    <h3 class="h5 d-flex align-items-center mb-4 text-primary"><span class="icon-align-left mr-3"></span>Mô tả công việc</h3>
                    <p >${recruitmentDTO.description}</p>
                </div>

            </div>
            <div class="col-lg-4">
                <div class="bg-light p-3 border rounded mb-4">
                    <h3 class="text-primary  mt-3 h5 pl-3 mb-3 ">Tóm tắt công việc</h3>
                    <ul class="list-unstyled pl-3 mb-0">
                       <li class="mb-2"> <strong class="text-black">Ngày tạo: </strong> <span>${recruitmentDTO.createdAt}</span> </li>
                        <li class="mb-2"><strong class="text-black">Kiểu công việc: </strong> <span>${recruitmentDTO.category.name}</span></li>
                        <li class="mb-2"><strong class="text-black">Loại công việc: </strong> <span>${recruitmentDTO.type}</span></li>
                        <li class="mb-2"><strong class="text-black">Kinh nghiệm: </strong> <span>${recruitmentDTO.experience}</span></li>
                        <li class="mb-2"><strong class="text-black">Đại chỉ: </strong> <span> ${recruitmentDTO.address}</span></li>
                        <li class="mb-2"><strong class="text-black">Lương: </strong> <span> ${recruitmentDTO.salary} </span></li>
                        <li class="mb-2"><strong class="text-black">Số lượng: </strong><span>${recruitmentDTO.quantity}</span></li>
                        <li class="mb-2"><strong class="text-black">Hạn nộp cv: </strong><span>${recruitmentDTO.deadline}</span></li>
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
</section>
<!-- Modal -->
<div class="modal fade" tabindex="-1" role="dialog" id="exampleModal_${recruitmentDTO.id}"   aria-labelledby="exampleModalLabel" >
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" >Ứng tuyển: <span>${recruitmentDTO.title}</span></h5>
                <input type="hidden" id="recruitmentDTO_${recruitmentDTO.id}" name="recruitmentDTO" value="${recruitmentDTO.id}">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form method="post" action="${pageContext.request.contextPath}/user/applyJob">
                <div class="modal-body">
                    <div class="row">
                    <input type="hidden" id="userId_${recruitmentDTO.id}" name="user" value="${sessionScope.userDTO.id}">
					<input type="hidden" id="recruitmentDTO_${recruitmentDTO.id}" name="recruitmentDTO" value="${recruitmentDTO.id}">
					<input type="hidden" id="cv_${recruitmentDTO.id}" name="cv" value="${cv.fileName}">
                        <div class="col-12">
                            <label for="fileUpload"
                                   class="col-form-label">Chọn cv:</label>
                            <input type="file" class="form-control" onchange="fileUploadChange(${recruitmentDTO.id})"
                                   id="${'fileUpload'}_${recruitmentDTO.id}" name="file"  required>
                            <label for="fileUpload"
                                   class="col-form-label">Giới thiệu:</label>
                            <textarea rows="10" cols="3" class="form-control" name="text" id="text_${recruitmentDTO.id}"> 
								
                        </textarea>
                        </div>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                        <button type="button" onclick="apply(${recruitmentDTO.id})" class="btn btn-primary">Nộp</button>
                    </div>
                </div>
            </form>


        </div>
    </div>
</div>
<section class="site-section" id="next">
    <div class="container">

        <div class="row mb-5 justify-content-center">
            <div class="col-md-7 text-center">
            	<c:if test="${sessionScope.userDTO.role == 2}">
                <h2 class="section-title mb-2" ">Danh sách ứng viên ứng tuyển</h2>
                </c:if>
                <c:if test="${sessionScope.userDTO.role == 1}">
                <h2 class="section-title mb-2" >Những công việc liên quan</h2>
                </c:if>
            </div>
        </div>

		<c:if test="${sessionScope.userDTO.role == 2}">
	        <div class="row">
	            <div class="col-lg-12 pr-lg-4">            
	                <div class="row">
	                <c:if test="${sessionScope.userDTO.role == 2}">
	                    <c:forEach items="${applyPosts}" var="applyPost">
	                        <div class="col-md-12" style="box-shadow: rgba(0, 0, 0, 0.4) 0px 0px 10px;margin: 20px auto;">
	                            <div class="team d-md-flex p-4 bg-white">
	                                <IMG class="img" src="${applyPost.user.image}"></IMG>
	                                <div class="text pl-md-4">
	                                    <H5 class="location mb-0"><c:out value="${applyPost.user.fullName}"/></H5>
	                                    <p style="display: block;color: black" ><c:out value="${applyPost.user.address}"/></p>
	                                    <span class="position" style="display: block;color: black" ><c:out value="${applyPost.user.email}"/></span>	                                   
	                                    <input type="hidden"  name="id" value="${applyPost.id}">
	                                    <div class="row">
	                                        <p><a class="btn btn-primary" href="<c:out value="${applyPost.nameCv}"/>" target="_blank"> Xem cv</a></p>
	                                        <c:if test="${applyPost.status == 0}">
	                                        <p  style="margin-left: 10px"><a class="btn btn-outline-primary" href="<c:url value = "/recruitment/approveCandidate/${applyPost.id}"/>">Duyệt</a></p>
	                                        </c:if>
	                                        <c:if test="${applyPost.status == 1}">
	                                        <p  style="margin-left: 10px;margin-top: 15px"><span style="color: #1e7e34;font-weight: bold" >Đã duyệt</span></p>
	                                        </c:if>
	                                    </div>
	
	                                </div>
	                            </div>
	                        </div>
	                    </c:forEach>
	                    <c:if test="${applyPosts.size() == 0}">	               
	                        <p>Chưa có ứng cử viên nào ứng tuyển</p>
	                    </c:if>
					</c:if>
	
	                </div>
	            </div>
	
	            <div class="col-lg-4 sidebar">
	                <div class="sidebar-box bg-white p-4 ftco-animate">
	                    <h3 class="heading-sidebar">Browse Category</h3>
	                    <form action="#" class="search-form mb-3">
	                        <div class="form-group">
	                            <span class="icon icon-search"></span>
	                            <input type="text" class="form-control" placeholder="Search...">
	                        </div>
	                    </form>
	                    <form action="#" class="browse-form">
	                        <label for="option-job-1"><input type="checkbox" id="option-job-1" name="vehicle" value="" checked> Website &amp; Software</label><br>
	                        <label for="option-job-2"><input type="checkbox" id="option-job-2" name="vehicle" value=""> Education &amp; Training</label><br>
	                        <label for="option-job-3"><input type="checkbox" id="option-job-3" name="vehicle" value=""> Graphics Design</label><br>
	                        <label for="option-job-4"><input type="checkbox" id="option-job-4" name="vehicle" value=""> Accounting &amp; Finance</label><br>
	                        <label for="option-job-5"><input type="checkbox" id="option-job-5" name="vehicle" value=""> Restaurant &amp; Food</label><br>
	                        <label for="option-job-6"><input type="checkbox" id="option-job-6" name="vehicle" value=""> Health &amp; Hospital</label><br>
	                    </form>
	                </div>
	
	                <div class="sidebar-box bg-white p-4 ftco-animate">
	                    <h3 class="heading-sidebar">Select Location</h3>
	                    <form action="#" class="search-form mb-3">
	                        <div class="form-group">
	                            <span class="icon icon-search"></span>
	                            <input type="text" class="form-control" placeholder="Search...">
	                        </div>
	                    </form>
	                    <form action="#" class="browse-form">
	                        <label for="option-location-1"><input type="checkbox" id="option-location-1" name="vehicle" value="" checked> Sydney, Australia</label><br>
	                        <label for="option-location-2"><input type="checkbox" id="option-location-2" name="vehicle" value=""> New York, United States</label><br>
	                        <label for="option-location-3"><input type="checkbox" id="option-location-3" name="vehicle" value=""> Tokyo, Japan</label><br>
	                        <label for="option-location-4"><input type="checkbox" id="option-location-4" name="vehicle" value=""> Manila, Philippines</label><br>
	                        <label for="option-location-5"><input type="checkbox" id="option-location-5" name="vehicle" value=""> Seoul, South Korea</label><br>
	                        <label for="option-location-6"><input type="checkbox" id="option-location-6" name="vehicle" value=""> Western City, UK</label><br>
	                    </form>
	                </div>
	
	                <div class="sidebar-box bg-white p-4 ftco-animate">
	                    <h3 class="heading-sidebar">Job Type</h3>
	                    <form action="#" class="browse-form">
	                        <label for="option-job-type-1"><input type="checkbox" id="option-job-type-1" name="vehicle" value="" checked> Partime</label><br>
	                        <label for="option-job-type-2"><input type="checkbox" id="option-job-type-2" name="vehicle" value=""> Fulltime</label><br>
	                        <label for="option-job-type-3"><input type="checkbox" id="option-job-type-3" name="vehicle" value=""> Intership</label><br>
	                        <label for="option-job-type-4"><input type="checkbox" id="option-job-type-4" name="vehicle" value=""> Temporary</label><br>
	                        <label for="option-job-type-5"><input type="checkbox" id="option-job-type-5" name="vehicle" value=""> Freelance</label><br>
	                        <label for="option-job-type-6"><input type="checkbox" id="option-job-type-6" name="vehicle" value=""> Fixed</label><br>
	                    </form>
	                </div>
	            </div>
	        </div>
        </c:if>
    
     
        <c:if test="${sessionScope.userDTO.role == 1}">
        <c:forEach items="${recruitments}" var="recruitment">      
            <div  class="col-md-12 ">
                <div class="job-post-item p-4 d-block d-lg-flex align-items-center">
                    <div class="one-third mb-4 mb-md-0">
                        <div class="job-post-item-header align-items-center">
                            <span class="subadge"> <c:out value="${recruitment.type}"/></span>
                            <h2 class="mr-3 text-black" ><a <%-- href="${'/recruitment/detail/'} +${recruitment.id}" --%>><c:out value="${recruitment.title}"/></a></h2>
                        </div>
                        <div class="job-post-item-body d-block d-md-flex">
                            <div class="mr-3"><span class="icon-layers"></span> <a href="#" ><c:out value="${recruitment.company.nameCompany}"/></a></div>
                            <div><span class="icon-my_location"></span> <span><c:out value="${recruitment.address}"/></span></div>
                        </div>
                    </div>

                    <%-- <input type="hidden" id="${'idRe'}+${recruitment.id}" value="${recruitment.id}"> --%>
                    <div  class="one-forth ml-auto d-flex align-items-center mt-4 md-md-0">
                        <div >
                            <a  onclick="'save(' +${recruitment.id}+ ')'" class="icon text-center d-flex justify-content-center align-items-center icon mr-2">
                                <span class="icon-heart"></span>
                            </a>
                        </div>
                        <input type="hidden" id="recruitment_${recruitment.id}" name="recruitmentDTO" value="${recruitment.id}">
                        <a  data-toggle="modal"  data-target="#exampleModal_${recruitment.id}" class="btn btn-primary py-2">Apply Job</a>
                    </div>
                 <%--    <div  class="one-forth ml-auto d-flex align-items-center mt-4 md-md-0">
                        <div >
                            <a  onclick="'save(' +${recruitment.id}+ ')'" class="icon text-center d-flex justify-content-center align-items-center icon mr-2">
                                <span class="icon-heart"></span>
                            </a>
                        </div>
                        <a  data-toggle="modal" data-target="${'#exampleModal'}+${recruitment.id}" class="btn btn-primary py-2">Apply Job</a>
                    </div> --%>
                </div>
            </div><!-- end -->
        </c:forEach>
	</c:if>
        <script>

            function apply(id){
                var name = "#idRe" +id;
                var nameModal = "#exampleModal" +id;
                var nameFile = "#fileUpload"+id;
                var nameText = "#text" +id;
                var idRe = $(name).val();
                var textvalue = $(nameText).val();
             /*    var fileUpload = $(nameFile).get(0);
                var files = fileUpload.files; */
                
            	var userId = $("#userId_" + id).val();
    			var recruitmentId = $("#recruitmentDTO_" + id).val();
    			var cvPath = $("#cv_" + id).val();
    			var text = $("#text_" + id).val();
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
                                    	title: 'Ứng tuyển thành công!',
                                        /* text: 'Redirecting...', */
                                    	icon: 'success',
                                        timer: 3000,
                                        buttons: true,
                                        type: 'success'
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
        <script>
    /* $(function () { */
    	/* $('#fileUpload1').change(function () { */
        function fileUploadChange(inputId) {
            if (window.FormData !== undefined) {
                var fileUpload = $('#fileUpload_' + inputId).get(0);
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
    /* }) */
</script>

    </div>
</section>




<footer th:replace="public/fragments :: footer" class="ftco-footer ftco-bg-dark ftco-section">

</footer>
</body>
</html>