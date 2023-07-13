<!DOCTYPE html>
<html lang="en">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
    <jsp:include page="layout/fragments.jsp"></jsp:include>
    <spring:url value="./" var="productListUrl" />
    <c:set var="currentPage" value="${productList.number}" />
    <c:set var="totalPages" value="${productList.totalPages}" />
    <c:set var="productList" value="${productList.content}" />
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
            <div class="row">
                <div class="col-xs-12 col-sm-8 col-md-6" style="width:100%;">
                    <form:form action="search" method="get">
                        <div class="input-group">
                            <input name="searchInput" type="text" class="form-control" placeholder="Search by name..." />
                            <span class="input-group-btn">
                            <button type="submit" class="btn btn-outline-primary" type="submit">Search</button>
                        </span>
                        </div>
                    </form:form>
                </div>
            </div>

            <!-- Begin Page Content -->
            <div class="container-fluid">
            <c:if test="${size == 0}">
                <p>No products in shop</p>
            </c:if>

                <%-- Hiển thị thông báo thành công (nếu có) --%>
                <c:if test="${not empty success}">
                    <p>${success}</p>
                </c:if>

                <%-- Hiển thị thông báo lỗi (nếu có) --%>
                <c:if test="${not empty error}">
                    <p>${error}</p>
                </c:if>

                <a href="/add-product" class = "btn btn-primary">Add Product</a>
            <!-- Begin Page Content -->
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th scope="col">Name</th>
                        <th scope="col">Category</th>
                        <th scope="col">Price</th>
                        <th scope="col">Quantity</th>
                        <th scope="col">Image</th>
                        <th scope="col">Update</th>
                        <th scope="col">Action</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${products}" var="products">
                        <tr>
                            <th scope="row">${products.name}</th>
                            <td>${products.category.name}</td>
                            <td>${products.costPrice}</td>
                            <td>${products.currentQuantity}</td>
                            <td>
                                <img class="my-product-image" style="height: 40px; width: 40px;" alt=""
                                     src="data:image/jpeg;base64,${products.image}">
                            </td>


                            <td><a href="/update-product/${products.id}" class="btn btn-primary">Update</a></td>
                            <td>
                                <c:choose>
                                    <c:when test="${products.deleted}">
                                        <c:url value="/enable-product/${products.id}" var="enableUrl" />
                                        <a href="${enableUrl}" class="btn btn-primary">Enable</a>
                                    </c:when>
                                    <c:otherwise>
                                        <c:url value="/delete-product/${products.id}" var="deleteUrl" />
                                        <a href="${deleteUrl}" class="btn btn-danger">Delete</a>
                                    </c:otherwise>
                                </c:choose>
                            </td>

                        </tr>
                    </c:forEach>
                    </tbody>
                </table>

                <spring:url value="./search?searchInput=${searchInput}" var="productListUrl" />
                <nav aria-label="Page navigation">
                    <ul class="pagination">
                        <li class="page-item ${currentPage == 0 ? 'disabled' : ''}">
                            <spring:url value="${productListUrl}" var="previousPageUrl">
                                <spring:param name="page" value="${currentPage - 1}" />
                            </spring:url>
                            <a class="page-link" href="${previousPageUrl}" tabindex="-1">
                                <<</a>
                        </li>
                        <c:forEach var="i" begin="0" end="${totalPages - 1}">
                            <spring:url value="${productListUrl}" var="pageUrl">
                                <spring:param name="page" value="${i}" />
                            </spring:url>
                            <li class="page-item ${currentPage == i ? 'active' : ''}">
                                <a class="page-link" href="${pageUrl}">${i + 1}</a>
                            </li>
                        </c:forEach>
                        <li class="page-item ${currentPage == totalPages - 1 ? 'disabled' : ''}">
                            <spring:url value="${productListUrl}" var="nextPageUrl">
                                <spring:param name="page" value="${currentPage + 1}" />
                            </spring:url>
                            <a class="page-link" href="${nextPageUrl}">>></a>
                        </li>
                    </ul>
                </nav>

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