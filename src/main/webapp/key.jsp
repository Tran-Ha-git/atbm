<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="includes/head.jsp"%>
<title>Quản lý khóa</title>
<style>
.green-tea {
	color: #008000 !important;
}

.header {
	font-size: 14px;
	font-weight: 600;
	text-transform: uppercase;
	background-color: #004315;
}

.category-nav {
	border-top: #004315 2px solid;
}

.item-cart {
	transition: opacity 0.3s, transform 0.3s, background-color 0.3s,
		-webkit-transform 0.3s;
}

.item-cart .card {
	box-shadow: rgba(50, 50, 105, 0.15) 0px 2px 5px 0px, rgba(0, 0, 0, 0.05)
		0px 1px 1px 0px;
}

.item-cart .card img {
	height: 250px;
}

.item-cart:hover {
	transform: scale(1) translateZ(0) translateY(0) !important;
	margin-top: -10px;
}

.bg-login {
	background-color: #e7e7e7;
}

.login {
	min-height: 450px;
}

.my-scroll {
	max-width: 500px;
	overflow: auto;
}

.my-scroll-min {
	max-width: 400px;
	overflow: auto;
}
</style>
</head>
<body>
	<%@include file="includes/header.jsp"%>
	<div class="container-fluid bg-light bg-login">
		<div class="container login pt-5">

			<div class="table-responsive bg-white p-2 rounded">
				<h3 class="float-start mt-4">Danh sách khóa</h3>
				<div class="float-end mt-4 mb-4">
					<!-- Button trigger modal -->
					<button type="button" class="btn btn-primary"
						data-bs-toggle="modal" id="openModal">Tạo khóa</button>

					<!-- Modal -->
					<div class="modal fade" id="staticBackdrop"
						data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
						aria-labelledby="staticBackdropLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="staticBackdropLabel">Tạo khóa</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<div>
										<button type="button" class="btn btn-primary" id="createKey">Tạo khóa</button>
									</div>
									<div class="input-group flex-nowrap mt-2">
										<span class="input-group-text " id="addon-wrapping" >Public key</span> 
										<input id="contentKey" type="text" class="form-control" aria-describedby="addon-wrapping">
									</div>
									<div class="input-group flex-nowrap mt-2">
										<span class="input-group-text " id="addon-wrapping2" >Private key</span> 
										<input id="hiddenKey" type="text" class="form-control" aria-describedby="addon-wrapping2">
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										id="closeModal">Hủy</button>
									<button type="button" class="btn btn-primary">Lưu khóa</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				<table class="table align-middle  table-bordered">
					<thead>
						<tr class=" table-primary">
							<th scope="col">#</th>
							<th scope="col">Public key</th>
							<th scope="col">Trạng thái</th>
							<th scope="col">Thao tác</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${keys !=null && keys.size() > 0}">
								<c:forEach var="key" items="${keys}" step="1" varStatus="loop">
									<tr>
										<th scope="row" style="width: 5%">${loop.count}</th>
										<td style="width: 60%" class="my-scroll">${key.publicKey}</td>
										<td style="width: 15%"><c:choose>
												<c:when test="${key.status !=null && key.status == 1}">
													<span class="text-success  ps-2">Hoạt động</span>
												</c:when>
												<c:otherwise>
													<span class="text-danger ps-2">Không hoạt động</span>
												</c:otherwise>
											</c:choose></td>
										<td style="width: 25%">
											<button class="btn btn-outline-success"
												onclick="location.href=`/update-key?id=${key.id}&status=1`"
												title="Kích hoạt">
												<i class="fa-solid fa-bookmark"></i>
											</button>
											<button class="btn btn-outline-warning"
												onclick="location.href=`/update-key?id=${key.id}&status=0`"
												title="Hủy kích hoạt">
												<i class="fa-regular fa-bookmark"></i>
											</button>
											<button class="btn btn-outline-danger"
												onclick="location.href=`/delete-key?id=${key.id}`"
												title="Xóa">
												<i class="fa-regular fa-trash-can"></i>
											</button>
										</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="4">
										<p>Danh sách khóa rỗng</p>
									</td>
								</tr>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${status == false}">
								<tr>
									<td colspan="4">
										<div class="alert alert-danger text-danger mt-3">
											<strong>Thất bại!</strong> ${msgKey }
										</div>
									</td>
								</tr>
							</c:when>
							<c:when test="${status == true}">
								<tr>
									<td colspan="4">
										<div class="alert alert-success text-success mt-3">
											<strong>Thành công!</strong> ${msgKey }
										</div>
									</td>
								</tr>
							</c:when>
							<c:otherwise>

							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<%@include file="includes/footer.jsp"%>
	<%@include file="includes/scripts.jsp"%>
	<script>
		$(document).on("click", "#openModal", function() {
			$("#contentKey").val("");
			$("#hiddenKey").val("");
			$('#staticBackdrop').modal('toggle');
		});
		
		$(document).on("click", "#closeModal", function() {
			$("#contentKey").val("");
			$("#hiddenKey").val("");
			$('#staticBackdrop').modal('hide');
		});

		$(document).on("click", "#createKey", function() {
			$.get("/create-key", function(responseText) {
				$.each(responseText, function(index, item) { 
					if(index=="public"){
						$("#contentKey").val(JSON.stringify(item));
					}
					if(index=="private"){
						$("#hiddenKey").val(JSON.stringify(item));
					}
		        });
			});
		});
		
	</script>
</body>
</html>