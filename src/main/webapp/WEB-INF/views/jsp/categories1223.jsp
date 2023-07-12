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
                <!-- Begin Page Content -->
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleAddCategoryModal"
                        data-whatever="@mdo">Add new category
                </button>

                <c:if test="${size == 0}">
                    <p>No category</p>
                </c:if>
                <!-- Begin Page Content -->
                <c:if test="${size > 0}">
                    <c:if test="${not empty success}">
                        <p>${success}</p>
                    </c:if>


                    <c:if test="${not empty error}">
                        <p>${error}</p>
                    </c:if>
                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th scope="col">Category Index</th>
                            <th scope="col">Category Name</th>
                            <th scope="col">Update Name</th>
                            <th scope="col">Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${categories}" var="category">
                            <tr>
                                <th scope="row">${category.id}</th>
                                <td>${category.name}</td>
                                <td>
                                    <a id="editButton" href="findById?id=${category.id}" class="btn btn-primary">Update</a>
                                </td>
                                <td>
                                    <c:if test="${category.deleted}">
                                        <a href="/enable-category?id=${category.id}" class="btn btn-primary">Enable</a>
                                    </c:if>
                                    <c:if test="${!category.deleted}">
                                        <a href="/delete-category?id=${category.id}" class="btn btn-danger">Delete</a>
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </c:if>
                <!-- Footer -->
                <jsp:include page="layout/footer.jsp"></jsp:include>
                <!-- End of Footer -->
                <!-- End of Main Content -->



            </div>
            <!-- End of Content Wrapper -->

        </div>
        <!-- End of Page Wrapper -->

        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fas fa-angle-up"></i>
        </a>

        <!--Add Categories Modal-->
        <div class="modal fade" id="exampleAddCategoryModal" tabindex="-1" role="dialog"
             aria-labelledby="exampleAddCategoryModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleAddCategoryModalLabel">New Category</h5>
                    </div>
                    <div class="modal-body">
                        <form action="save-category" method="post">
                            <div class="form-group">
                                <label for="name" class="col-form-label">Category Name:</label>
                                <input type="text" class="form-control" id="name" name="name">
                            </div>
                            <div class="modal-footer">
                                <button type="submit" class="btn btn-primary">Save</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!--End-->

        <!-- Edit Category Modal -->
        <div class="modal fade" id="editModal" tabindex="-1" role="dialog"
             aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Edit category</h5>
                    </div>
                    <div class="modal-body">
                        <form action="/update-category" method="PUT">
                            <div class="form-group">
                                <label for="idEdit" class="col-form-label">ID
                                </label> <input type="text" class="form-control" id="idEdit" name="id" readonly>
                            </div>
                            <div class="form-group">
                                <label for="nameEdit" class="col-form-label">Category
                                    Name</label> <input type="text" class="form-control" id="nameEdit" name="name">
                            </div>
                            <button type="submit" class="btn btn-primary">Save</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
            <!-- /.container-fluid -->



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