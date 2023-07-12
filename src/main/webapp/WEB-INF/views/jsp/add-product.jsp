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
                <form class="form-horizontal" action="/save-product" method="post" enctype="multipart/form-data">
                    <fieldset>
                        <!-- Form Name -->
                        <legend>ADD NEW PRODUCT</legend>
                        <!-- Text input -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="product_name">PRODUCT NAME</label>
                            <div class="col-md-4">
                                <input id="product_name" name="name" class="form-control input-md" required="" type="text">
                            </div>
                        </div>

                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="product_categories">PRODUCT CATEGORY</label>
                            <div class="col-md-4">
                                <select id="product_categories" name="category" class="form-control">
                                    <option value="null">-SELECT-</option>
                                    <c:forEach items="${categories}" var="category">
                                        <option value="${category.id}"><c:out value="${category.name}" /></option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>

                        <!-- Text input -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="description">PRODUCT DESCRIPTION</label>
                            <div class="col-md-4">
                                <input id="description" name="description" class="form-control input-md" required="" type="text">
                            </div>
                        </div>

                        <!-- Text input -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="available_quantity">AVAILABLE QUANTITY</label>
                            <div class="col-md-4">
                                <input id="available_quantity" name="currentQuantity" class="form-control input-md" required="" type="text">
                            </div>
                        </div>

                        <!-- Text input -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="price">PRICE</label>
                            <div class="col-md-4">
                                <input id="price" name="costPrice" class="form-control input-md" required="" type="text">
                            </div>
                        </div>

                        <!-- File Button -->
                        <div class="form-group">
                            <div class="col-md-4">
                                <!-- File Button -->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="imageProduct">PRODUCT IMAGE</label>
                                    <div class="col-md-4">
                                        <input id="imageProduct" name="imageProduct"  class="input-file" type="file">
                                    </div>
                                </div>
                            </div>
                        </div>

                        <button type="submit" class="btn btn-primary">Save</button>
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