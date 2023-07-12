<!DOCTYPE html>
<html lang="en">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<head>
    <jsp:include page="layout/fragments.jsp"></jsp:include>

</head>

<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">

    <!-- Sidebar -->
    <jsp:include page="layout/sidebar.jsp"></jsp:include>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">

            <!-- Topbar -->
            <jsp:include page="layout/topsidebar.jsp"></jsp:include>
            <!-- End of Topbar -->

            <!-- Begin Page Content -->
            <div class="container-fluid">
                <form class="form-horizontal" th:action="'/update-product/' + ${productDto.id}" method="post" th:object="${productDto}"
                      enctype="multipart/form-data">
                    <fieldset>
                        <!-- Form Name -->
                        <legend>UPDATE PRODUCT</legend>
                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="product_name">PRODUCT NAME</label>
                            <div class="col-md-4">
                                <input id="product_name" name="name" class="form-control input-md" required="" type="text"
                                       value="${products.name}">
                            </div>
                        </div>

                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="product_categories">PRODUCT CATEGORY</label>
                            <div class="col-md-4">
                                <select id="product_categories" name="categories" class="form-control">
                                    <option value="null">-SELECT-</option>
                                    <c:forEach var="category" items="${categories}">
                                        <c:choose>
                                            <c:when test="${category.id == products.category}">
                                                <option value="${category.id}" selected>${category.name}</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option value="${category.id}">${category.name}</option>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                </select>
                            </div>





                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="description">PRODUCT DESCRIPTION</label>
                            <div class="col-md-4">
                                <input id="description" name="description" class="form-control input-md" required="" type="text"
                                       value="${products.description}">
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="available_quantity">AVAILABLE QUANTITY</label>
                            <div class="col-md-4">
                                <input id="available_quantity" name="available_quantity" class="form-control input-md" required=""
                                       type="text" value="${products.currentQuantity}">
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="price">PRICE</label>
                            <div class="col-md-4">
                                <input id="price" name="price" class="form-control input-md" required="" type="text"
                                       value="${products.costPrice}">
                            </div>
                        </div>
                        <!-- Text input-->
                        <div class="form-group">
                            <div class="col-md-4">
                                <!-- File Button -->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="image">PRODUCT IMAGE</label>
                                    <div class="col-md-4">
                                        <img class="my-product-image" style="height: 40px; width: 40px;" alt=""
                                             src="data:image/jpeg;base64,${products.image}">
                                        <input id="image" name="imageProduct" class="input-file" type="file">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-primary">Update</button>
                    </fieldset>
                </form>



            </div>
        </div>

        <!-- /.container-fluid -->

    </div>
    <!-- End of Main Content -->

    <!-- Footer -->
    <footer>
        <jsp:include page="layout/footer.jsp"></jsp:include>
    </footer>
    <!-- End of Footer -->

</div>
<!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->

<jsp:include page="layout/script.jsp"></jsp:include>

<!-- Page level custom scripts -->
<!-- Page level plugins -->
<script src="/resources/admin/vendor/chart.js/Chart.min.js"></script>

<!-- Page level custom scripts -->
<script src="/resources/admin/js/demo/chart-area-demo.js"></script>
<script src="/resources/admin/demo/chart-pie-demo.js"></script>

</body>

</html>