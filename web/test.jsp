
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="shortcut icon" href="images/favicon.png" type="image/x-icon">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;600;700&display=swap" rel="stylesheet">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/owl.theme.default.min.css">
        <link rel="stylesheet" href="css/animate.css">
        <link rel="stylesheet" href="css/style.css">

        <title>Jobster - Company dashboard - Accounts</title>
  <title>Document</title>
</head>
<body>

<table>
  <thead>
    <tr>
      <th>#</th>
      <th>Image</th>
      <th>Name</th>
      <th>Username</th>
      <th>Status</th>
      <th>Action</th>
    </tr>

  </thead>
  <tbody>
      <c:forEach var="item" items="${requestScope.accounts}" varStatus="cnt">
    <tr>
        
        <td>${cnt.count}</td>
        <td>${item.imgUrl}</td>
        <<td>${item.name}</td>
      <td>${item.username}</td>
      
      <td><c:choose>
        <c:when test="${item.statusId == 1}">
          INACTIVE
        </c:when>
        <c:when test="${item.statusId == 2}">
          ACTIVE
        </c:when>
        <c:when test="${item.statusId == 3}">
          BLOCKED
        </c:when>
        <c:when test="${item.statusId == 4}">
          DELETED
        </c:when>
        <c:otherwise>
          UNKNOWN
        </c:otherwise>
      </c:choose></td>
      
      <td><div class="pxp-dashboard-table-options">
                <ul class="list-unstyled">
                    <li><button title="View details"><span class="fa fa-eye"></span></button></li>
                    <c:choose>
                        <c:when test="${item.statusId == 1}">
                          INACTIVE
                        </c:when>
                        <c:when test="${item.statusId == 2}">
                          ACTIVE
                        </c:when>
                        <c:when test="${item.statusId == 3}">
                          BLOCKED
                        </c:when>
                        <c:when test="${item.statusId == 4}">
                          DELETED
                        </c:when>
                        <c:otherwise>
                          UNKNOWN
                        </c:otherwise>
                      </c:choose>
                    <li><button type="button" data-username="${item.username}" data-bs-toggle="modal" data-bs-target="#banAccountModal" title="Ban" class="btn-ban"><span class="fa fa-ban"></span></button></li>
                    <li><button type="button" data-username="${item.username}" data-bs-toggle="modal" data-bs-target="#deleteAccountModal" title="Delete" class="btn-delete"><span class="fa fa-trash-o"></span></button></li>
                </ul>
            </div></td>
    </tr>
    </c:forEach>
  </tbody>
</table>
    <!-- Modal Delete Account -->
<div class="modal " id="deleteAccountModal" tabindex="-1" aria-labelledby="deleteAccountModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <form method="POST" action="deleteAccount">
        <div class="modal-header">
          <h5 class="modal-title" id="deleteAccountModalLabel">Xác Nhận Xóa Tài Khoản</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <p>Bạn có chắc chắn muốn xóa tài khoản này không?</p>
          <input type="hidden" name="username" id="deleteUsername">
          <input type="password" class="form-control" name="adminPassword" placeholder="Nhập mật khẩu admin" required>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
          <button type="submit" class="btn btn-danger">Xóa Tài Khoản</button>
        </div>
      </form>
    </div>
  </div>
</div>
<!-- Modal Ban Account -->
<div class="modal fade" id="banAccountModal" tabindex="-1" aria-labelledby="banAccountModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="banAccountModalLabel">Cấm Tài Khoản</h5>
        <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <label for="banDurationValue">Thời gian cấm:</label>
        <div class="input-group">
            <input type="number" class="form-control" id="banDurationValue" name="banDurationValue" min="1" step="1" required>
            <select class="form-select" id="banDurationUnit" name="banDurationUnit">
                <option value="minutes">Phút</option>
                <option value="hours">Giờ</option>
                <option value="days">Ngày</option>
                <option value="months">Tháng</option>
                <option value="years">Năm</option>
            </select>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
        <button type="submit" class="btn btn-warning" ">Cấm Tài Khoản</button>
      </div>
    </div>
  </div>
</div>
<script src="js/jquery-3.4.1.min.js"></script>
        <script src="js/bootstrap.bundle.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/nav.js"></script>
        <script src="js/Chart.min.js"></script>
        <script src="js/main.js"></script>


</body>

</html>