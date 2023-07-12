<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Work CV</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<style type="text/css">
.dropdown1 {
	position: relative;
	display: inline-block;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f9f9f9;
	min-width: 210px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	padding: 12px 16px;
	z-index: 1;
}

.dropdown1:hover .dropdown-content {
	display: block;
}
</style>
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700&display=swap"
	rel="stylesheet">


<%@include file="resource.jsp"%>


</head>
<body>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container-fluid px-md-4	">
			<a class="navbar-brand" href="<%= request.getContextPath()%>">Work CV</a>

			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a href="/" class="nav-link">Trang
							chủ</a></li>
							
					<li class="'nav-item"><a href="<c:url value = "/user/post-list"/>" class="nav-link">Công
							việc</a></li>

					<li class="nav-item"><div class="nav-link dropdown1">${userDTO.fullName}
							<div class="dropdown-content">
							
									<p>
										<a href="<c:url value = "/user/profile"/>">Hồ Sơ</a>
									</p>
								<c:if test="${userDTO.role == 1}">
									<p>
										<a href="<c:url value = "/user/list-save-job"/>">Công việc đã lưu</a>
									</p>
								</c:if>
								<c:if test="${userDTO.role == 2}">
									<p>
										<a href="<c:url value = "/user/post-list-HR"/>">Danh sách bài đăng</a>
									</p>
								</c:if>
								<c:if test="${userDTO.role == 1}">
									<p>
										<a href="<c:url value="/user/list-apply-job"/>">Công việc đã ứng tuyển</a>
									</p>
									<p>
										<a href="<c:url value = "/user/list-follow-company"/>">Công ty đã theo dõi</a>
									</p>
								</c:if>
								<p><form style="padding: 0"
									action="<%= request.getContextPath() %>/user/logout"
									method="post" name="user" class="nav-item cta cta-colored">
									<button type="submit" class="">Đăng xuất
							</button>
						</form></p>
								

							</div>
						</div></li>
						<c:if test="${sessionScope.userDTO == null}">
							<li class="nav-item"><a data-toggle="modal" data-target="#myModal" class="nav-link">Ứng cử
							viên</a></li>
						</c:if>
						<c:if test="${sessionScope.userDTO != null && sessionScope.userDTO.role == '2'}">
							<li class="nav-item"><a href="<c:url value = "/user/list-user"/>" class="nav-link">Ứng cử
							viên</a></li>
						</c:if>
						
						 <!-- Modal -->
						  <div class="modal fade" id="myModal" role="dialog">
						    <div class="modal-dialog">
						    
						      <!-- Modal content-->
						      <div class="modal-content">
						        <div class="modal-header">
						          <button type="button" class="close" data-dismiss="modal">&times;</button>
						          <h4 class="modal-title"></h4>
						        </div>
						        <div class="modal-body">
						          <p>Bạn cần đăng nhập để xem</p>
						        </div>
						        <div class="modal-footer">
						          <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
						          <a href="<c:url value = "/user/login"/>" class="nav-link">Đăng nhập</a>
						        </div>
						      </div>
						      
						    </div>
						  </div>

						


					<li></li>
					<c:if test="${userDTO.role == 2}">
						<li class="nav-item cta mr-md-1"><a href="<c:url value = "/recruitment/post" />"
							class="nav-link">Đăng tuyển</a></li>
					</c:if>
					<c:if test="${sessionScope.userDTO == null}">
						<li class="nav-item cta cta-colored"><a
							href="<c:url value = "/user/login"/>" class="nav-link">Đăng
								nhập</a></li>
					</c:if>
					
				</ul>
			</div>
		</div>
	</nav>
	<!-- END nav
<div th:if="${msg_register_success}" class="toast" data-delay="2000" style="position:fixed;top: 100PX; right: 10PX;z-index: 2000;width: 300px">
    <script>
        swal({
            title: 'Đăng nhập thành công!',
            /* text: 'Redirecting...', */
            icon: 'success',
            timer: 3000,
            buttons: true,
            type: 'success'
        })
    </script>
</div> -->
	<div class="hero-wrap img"
		style="background-image: url(<c:url value="/resources/assets/images/bg_1.jpg"/>);">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row d-md-flex no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-10 d-flex align-items-center ">
					<div class="text text-center pt-5 mt-md-5">
						<p class="mb-4">Tìm việc làm, Cơ hội việc làm và Nghề nghiệp</p>
						<h1 class="mb-5">Cách dễ dàng nhất để có được công việc mới
							của bạn</h1>
						<div class="ftco-counter ftco-no-pt ftco-no-pb">
							<div class="row">
								<div
									class="col-md-4 d-flex justify-content-center counter-wrap ">
									<div class="block-18">
										<div class="text d-flex">
											<div class="icon mr-2">
												<span class="flaticon-visitor"></span>
											</div>
											<div class="desc text-left">
												<strong class="number" data-number="46"
													th:text="${numberCandidate}"></strong> <span>Ứng cử
													viên</span>
											</div>
										</div>
									</div>
								</div>
								<div
									class="col-md-4 d-flex justify-content-center counter-wrap ">
									<div class="block-18 text-center">
										<div class="text d-flex">
											<div class="icon mr-2">
												<span class="flaticon-visitor"></span>
											</div>
											<div class="desc text-left">
												<strong class="number" data-number="450"
													th:text="${numberCompany}"></strong> <span>Công ty</span>
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
												<strong class="number" data-number="80000"
													th:text="${numberRecruitment}"></strong> <span>Tuyển
													dụng</span>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="ftco-search my-md-5">
							<div class="row">
								<div class="col-md-12 nav-link-wrap">
									<div class="nav nav-pills text-center" id="v-pills-tab"
										role="tablist" aria-orientation="vertical">
										<a class="nav-link active mr-md-1" id="v-pills-1-tab"
											data-toggle="pill" href="#v-pills-1" role="tab"
											aria-controls="v-pills-1" aria-selected="true">Tìm công
											việc</a> 
											<a class="nav-link" id="v-pills-2-tab"
											data-toggle="pill" href="#v-pills-2" role="tab"
											aria-controls="v-pills-2" aria-selected="false">Tìm theo công ty</a> 
											<a class="nav-link" id="v-pills-3-tab"
											data-toggle="pill" href="#v-pills-3" role="tab"
											aria-controls="v-pills-3" aria-selected="false">Tìm theo
											địa điểm</a>

									</div>
								</div>
								<div class="col-md-12 tab-wrap">

									<div class="tab-content p-4" id="v-pills-tabContent">

										<div class="tab-pane fade show active" id="v-pills-1"
											role="tabpanel" aria-labelledby="v-pills-nextgen-tab">
											<form action="${pageContext.request.contextPath}/recruitment/searchByJobName"  method="post"
												class="search-job">
												<div class="row no-gutters">

													<div class="col-md-10 mr-md-2">
														<div class="form-group">
															<div class="form-field">
																<div class="icon">
																	<span class="icon-map-marker"></span>
																</div>
																<input type="text" name="jobName" class="form-control"
																	placeholder="Tìm kiếm công việc">
															</div>
														</div>
													</div>
													<div class="col-md">
														<div class="form-group">
															<div class="form-field">
																<button type="submit"
																	class="form-control btn btn-primary">Tìm kiếm</button>
															</div>
														</div>
													</div>
												</div>
											</form>
										</div>

										<div class="tab-pane fade" id="v-pills-2" role="tabpanel"
											aria-labelledby="v-pills-performance-tab">
											<form action="${pageContext.request.contextPath}/recruitment/searchByCompanyName" method="post" class="search-job">
												<div class="row no-gutters">

													<div class="col-md-10 mr-md-2">
														<div class="form-group">
															<div class="form-field">
																<div class="icon">
																	<span class="icon-map-marker"></span>
																</div>
																<input type="text" name="companyName" class="form-control"
																	placeholder="Tìm kiếm công ty">
															</div>
														</div>
													</div>
													<div class="col-md">
														<div class="form-group">
															<div class="form-field">
																<button type="submit"
																	class="form-control btn btn-primary">Tìm kiếm</button>
															</div>
														</div>
													</div>
												</div>
											</form>
										</div>
										<div class="tab-pane fade" id="v-pills-3" role="tabpanel"
											aria-labelledby="v-pills-performance-tab">
											<form action="${pageContext.request.contextPath}/recruitment/searchByAddress" method="post"
												class="search-job">
												<div class="row no-gutters">

													<div class="col-md-10 mr-md-2">
														<div class="form-group">
															<div class="form-field">
																<div class="icon">
																	<span class="icon-map-marker"></span>
																</div>
																<input type="text" name="address" class="form-control"
																	placeholder="Tìm kiếm theo địa điểm">
															</div>
														</div>
													</div>
													<div class="col-md">
														<div class="form-group">
															<div class="form-field">
																<button type="submit"
																	class="form-control btn btn-primary">Tìm kiếm</button>
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

	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center mb-5">
 
				<div style="display: block"
					class="col-md-7 heading-section text-center">
					<span class="subheading">Danh mục công việc</span>
					<h2 class="mb-0">Top Danh Mục</h2>
				</div>
			</div>
			<div class="row">
				<c:forEach items="${categories}" var="categories">
					<div class="col-md-3 ">
						<ul class="category text-center">

							<li><a style="text-decoration: none !important;"
								 href="${'/recruitment/category/'}+${categories.id}">
									<p><c:out value="${categories.name}" /></p>
									 <span class="number"><c:out value="${categories.numberChoose}" /></span> 
									 <span>Vị trí</span><i class="ion-ios-arrow-forward"></i>
							</a></li>
						</ul>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>

	<section class="ftco-section services-section">
		<div class="container">
			<div class="row d-flex">
				<div class="col-md-3 d-flex align-self-stretch ">
					<div class="media block-6 services d-block">
						<div class="icon">
							<span class="flaticon-resume"></span>
						</div>
						<div class="media-body">
							<h3 class="heading mb-3">Tìm kiếm hàng triệu việc làm</h3>
							<p>Một con sông nhỏ tên là Duden chảy qua nơi ở và nguồn cung
								cấp của họ.</p>
						</div>
					</div>
				</div>
				<div class="col-md-3 d-flex align-self-stretch ">
					<div class="media block-6 services d-block">
						<div class="icon">
							<span class="flaticon-team"></span>
						</div>
						<div class="media-body">
							<h3 class="heading mb-3">Dễ dàng quản lý công việc</h3>
							<p>Một con sông nhỏ tên là Duden chảy qua nơi ở và nguồn cung
								cấp của họ.</p>
						</div>
					</div>
				</div>
				<div class="col-md-3 d-flex align-self-stretch ">
					<div class="media block-6 services d-block">
						<div class="icon">
							<span class="flaticon-career"></span>
						</div>
						<div class="media-body">
							<h3 class="heading mb-3">Top Nghề nghiệp</h3>
							<p>Một con sông nhỏ tên là Duden chảy qua nơi ở và nguồn cung
								cấp của họ.</p>
						</div>
					</div>
				</div>
				<div class="col-md-3 d-flex align-self-stretch ">
					<div class="media block-6 services d-block">
						<div class="icon">
							<span class="flaticon-employees"></span>
						</div>
						<div class="media-body">
							<h3 class="heading mb-3">Ứng viên Chuyên gia Tìm kiếm</h3>
							<p>Một con sông nhỏ tên là Duden chảy qua nơi ở và nguồn cung
								cấp của họ.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section bg-light">
		<div class="container">
			<div class="row">
				<div class="col-lg-9 pr-lg-5">
					<div class="row justify-content-center pb-3">
						<div class="col-md-12 heading-section ">
							<span class="subheading">CÔNG VIỆC ĐƯỢC NHIỀU NGƯỜI ỨNG
								TUYỂN</span>
							<h2 class="mb-4">Các bài đăng về việc làm nổi bật</h2>

						</div>
					</div>
					<div class="row">
						<c:forEach items="${recruitments}" var="recruitments"> 
							<div class="col-md-12 ">
								<div
									class="job-post-item p-4 d-block d-lg-flex align-items-center">
									<div class="one-third mb-4 mb-md-0">
										<div class="job-post-item-header align-items-center">
											<span class="subadge"><c:out value="${recruitments.type}"></c:out></span>
											<h2 class="mr-3 text-black">
												<a
													href="${'/recruitment/detail/'}_${recruitments.id}"><c:out value="${recruitments.title}"/></a>
											</h2>
										</div>
										<div class="job-post-item-body d-block d-md-flex">
											<div class="mr-3">
												<span class="icon-layers"></span> <a href="#"
													><c:out value="${recruitments.company.nameCompany}"/></a>
											</div>
											<div>
												<span class="icon-my_location"></span> <span
													><c:out value="${recruitments.address}"/></span>
											</div>
										</div>
									</div>
									<input type="hidden" th:id="${'idRe'}+${recruitment.id}"
										th:value="${recruitment.id}">
										
									<div 
										class="one-forth ml-auto d-flex align-items-center mt-4 md-md-0">
										
										<div th:if="${session.user.role.id == 1}">
											<a onclick="'save(' +${recruitment.id}+ ')'"
												class="icon text-center d-flex justify-content-center align-items-center icon mr-2">
												<span class="icon-heart"></span>
											</a>
										</div>
										<c:if test="${sessionScope.userDTO == null }">
										<a class="btn btn-primary py-2" href="<c:url value = "/user/login"/>">Đăng nhập</a>
										</c:if>
										<c:if test="${sessionScope.userDTO != null }">
										<a data-toggle="modal"
										   data-target="#exampleModal_${recruitments.id}" 
											class="btn btn-primary py-2" >Apply Job</a>
										</c:if>
									</div>
									
									<div th:unless="${session.user}"
										class="one-forth ml-auto d-flex align-items-center mt-4 md-md-0">
										<div>
											<a th:onclick="'save(' +${recruitment.id}+ ')'"
												class="icon text-center d-flex justify-content-center align-items-center icon mr-2">
												<span class="icon-heart"></span>
											</a>
										</div>
										<!--  <a data-toggle="modal"
											th:data-target="${'#exampleModal'}+${recruitment.id}"
											class="btn btn-primary py-2">Apply Job</a>--> 
									</div>
								</div>
							</div>
							<!-- end -->
							<!-- Modal -->
							<div class="modal fade"
								id="exampleModal_${recruitments.id}" tabindex="-1"
								role="dialog" aria-labelledby="exampleModalLabel"
								aria-hidden="true">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel">
												Ứng tuyển: <span><c:out value="${recruitments.title}"/></span>
											</h5>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<form method="post" action="${pageContext.request.contextPath}/user/applyJob" name="user">
											<div class="modal-body">
												<div class="row">
													<div class="col-12">
														<select id="${'choose'}_${recruitments.id}"
															onchange="choosed(${recruitments.id})"
															class="form-control" aria-label="Default select example">
															<option selected>Chọn phương thức nộp</option>
															<option value="1">Dùng cv đã cập nhật</option>
															<option value="2">Nộp cv mới</option>
														</select>
													</div>
													<div id="loai1_${recruitments.id}"
														style="display: none" class="col-12">
														<input type="hidden" id="userId_${recruitments.id}" name="user" value="${user.id}">
														<input type="hidden" id="recruitments_${recruitments.id}" name="recruitments" value="${recruitments.id}">
														<input type="hidden" id="cv_${recruitments.id}" name="cv" value="${cv.fileName}">
														<label for="fileUpload" class="col-form-label">Giới
															thiệu:</label>
														<textarea rows="10" cols="3" class="form-control" name="text" id="text_${recruitments.id}">
														
                                                   		</textarea>
													</div>
													<div id="loai2_${recruitments.id}"
														style="display: none" class="col-12">
														<input type="hidden" id="userId_${recruitments.id}" name="user" value="${user.id}">
														<input type="hidden" id="recruitments_${recruitments.id}" name="recruitments" value="${recruitments.id}">
														<input type="hidden" id="cv_${recruitments.id}" name="cv" value="${cv.fileName}">
														<label for="fileUpload1" class="col-form-label">
															Chọn cv:</label> 
															<input type="file" class="form-control"	 id="${'fileUpload1'}_${recruitments.id}" name="file"
															  onchange="fileUploadChange(${recruitments.id})" required /> 
															<label for="fileUpload1" class="col-form-label">Giới
																thiệu:</label>
															<textarea rows="10" cols="3" class="form-control" name="text" id="text-${recruitments.id}">														
                                                   		    </textarea>
													</div>

												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-secondary"
														data-dismiss="modal">Đóng</button>
													<button type="button"
														id="button1_${recruitments.id}"
														style="display: none"
														onclick="apply1(${recruitments.id})"
														class="btn btn-primary">Nộp</button>
													<button type="button"
														id="button2_${recruitments.id}"
														style="display: none"
														onclick="apply(${recruitments.id})"
														class="btn btn-primary">Nộp</button>
												</div>
											</div>
										</form>


									</div>
								</div>
							</div>
						</c:forEach>

					</div>
				</div>
				<div class="col-lg-3 sidebar">
					<div class="row justify-content-center pb-3">
						<div class="col-md-12 heading-section ">
							<h2 class="mb-4">Công ty nổi bật</h2>
						</div>
					</div>
					<c:forEach items="${companies}" var="company">
						<div class="sidebar-box">
							<div class="">
							<!--  th:href="${'/user/detail-company/'}+${companies[0]}"-->
								<a 
									class="company-wrap"><img src='${company.logo}'
									class="img-fluid" alt="Colorlib Free Template"/></a>
								<div class="text p-3">
									
									<h3>
										<a href="${pageContext.request.contextPath}/user/detail-company/${company.id}">
											
										 <span class="number" style="color: black">
										 <c:out value="${company.nameCompany}"/></span></a>
											
									</h3>
									<p>
										 <span class="number" style="color: black"
											><c:out value="${fn:length(company.recruitments)}"/></span> <span>Vị trí ứng tuyển</span>
									</p>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</section>
	<script>
		function save(id) {
			var name = "#idRe" + id;
			var idRe = $(name).val();
			var formData = new FormData();
			formData.append('idRe', idRe);
			$.ajax({
				type : 'POST',
				url : '/save-job/save/',
				contentType : false,
				processData : false,
				data : formData,
				success : function(data) {
					console.log(data);
					if (data == "false") {
						swal({
							title : 'Bạn cần phải đăng nhập!',
							/* text: 'Redirecting...', */
							icon : 'error',
							timer : 3000,
							buttons : true,
							type : 'error'
						})
					} else if (data == "true") {
						swal({
							title : 'Lưu thành công!',
							/* text: 'Redirecting...', */
							icon : 'success',
							timer : 3000,
							buttons : true,
							type : 'success'
						})
					} else {
						swal({
							title : 'Bạn đã lưu bài này rồi!',
							/* text: 'Redirecting...', */
							icon : 'error',
							timer : 3000,
							buttons : true,
							type : 'error'
						})
					}
				},
				error : function(err) {
					alert(err);
				}
			})
		}

		function choosed(id) {
			var name = '#choose_' + id;
			var name1 = 'loai1_' + id;
			var name2 = 'loai2_' + id;
			var button1 = 'button1_' + id;
			var button2 = 'button2_' + id;
			var giaitri = $(name).val();
			console.log(giaitri);
			if (giaitri == 1) {
				document.getElementById(name1).style.display = 'block'
				document.getElementById(name2).style.display = 'none'
				document.getElementById(button1).style.display = 'block'
				document.getElementById(button2).style.display = 'none'
			} else {
				document.getElementById(name2).style.display = 'block'
				document.getElementById(name1).style.display = 'none'
				document.getElementById(button2).style.display = 'block'
				document.getElementById(button1).style.display = 'none'
			}
		}

		function apply(id) {
			var name = "#apply_" + id;
			var nameModal = "#exampleModal_" + id;
			var nameFile = "#fileUpload" + id;
			var nameText = "#text_" + id;
			var idRe = $(name).val();
			var textvalue = $(nameText).val();
/* 			var fileUpload = $(nameFile).get(0);
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
			
			
			if (cvPath == '') {
				swal({
					title : 'Bạn cần phải chọn cv!',
					/* text: 'Redirecting...', */
					icon : 'error',
					timer : 3000,
					buttons : true,
					type : 'error'
				})
			} else {
				$.ajax({
					type : 'POST',
					url : '${pageContext.request.contextPath}/user/apply-job/',
					contentType : false,
					processData : false,
					data : formData,
					success : function(data) {
						if (data == "false") {
							swal({
								title : 'Bạn cần phải đăng nhập!',
								/* text: 'Redirecting...', */
								icon : 'error', 
								timer : 3000,
								buttons : true,
								type : 'error'
							})
						} else if (data == "true") {
							swal({
								title : 'Ứng tuyển thành công!',
								/* text: 'Redirecting...', */
								icon : 'success',
								timer : 3000,
								buttons : true,
								type : 'success'
							})
							$(nameModal).modal('hide');
							$('#fileUpload').val("");
						} else {
							swal({
								title : 'Bạn đã ứng tuyển công việc này!',
								/* text: 'Redirecting...', */
								icon : 'error',
								timer : 3000,
								buttons : true,
								type : 'error'
							})
							$(nameModal).modal('hide');
							$('#fileUpload').val("");
						}
					},
					error : function(err) {
						alert(err);
					}
				})
			}

		}
		function apply1(id) {
			var name = "#apply1_" + id;
			var nameModal = "#exampleModal" + id;
			var nameFile = "#fileUpload" + id;
			var nameText = "#text" + id;
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
			$.ajax({
				type : 'POST',
				url : '${pageContext.request.contextPath}/user/apply-job/',
				contentType : false,
				processData : false,
				data : formData,
				success : function(data) {
					if (data == "false") {
						swal({
							title : 'Bạn cần phải đăng nhập!',
							/* text: 'Redirecting...', */
							icon : 'error',
							timer : 3000,
							buttons : true,
							type : 'error'
						})
					} else if (data == "true") {
						swal({
							title : 'Ứng tuyển thành công!',
							/* text: 'Redirecting...', */
							icon : 'success',
							timer : 3000,
							buttons : true,
							type : 'success'
						})
						$(nameModal).modal('hide');
						$('#fileUpload').val("");
					} else {
						swal({
							title : 'Bạn đã ứng tuyển công việc này!',
							/* text: 'Redirecting...', */
							icon : 'error',
							timer : 3000,
							buttons : true,
							type : 'error'
						})
						$(nameModal).modal('hide');
						$('#fileUpload').val("");
					}
				},
				error : function(err) {
					alert(err);
				}
			})

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


	<footer th:replace="public/fragments :: footer"
		class="ftco-footer ftco-bg-dark ftco-section"> </footer>


	<!-- loader -->
	<!--<div th:replace="public/fragments :: loading" id="ftco-loader" class="show fullscreen"></div>-->

</body>
</html>