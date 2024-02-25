<%@ page import="model.Item" %><%--
  Created by IntelliJ IDEA.
  User: zhansayakulbaeva
  Date: 03.02.2024
  Time: 20:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
</head>
<body>
<div class="container">
    <%@include file="navbar.jsp"%>
    <br><br>
    <%
        Item item = (Item) request.getAttribute("item");
    %>
    <form action="/updateTask" method="post" class="container mt-5">
        <input type="hidden" name="id" value="<%=item.getId()%>">

        <div class="mb-3">
            <label for="taskName" class="form-label">Task name:</label>
            <input type="text" class="form-control" id="taskName" name="taskName" value="<%=item.getName()%>">
        </div>
        <div class="mb-3">
            <label for="description" class="form-label">Description:</label>
            <textarea class="form-control" id="description" name="description" rows="4" cols="50"><%=item.getdescription()%></textarea>
        </div>
        <div class="mb-3">
            <label for="myDate" class="form-label">Dedline:</label>
            <input type="date" class="form-control" id="myDate" name="myDate" value="<%=item.getdedlineDate()%>">
        </div>
        <div class="mb-3 form-check">
            <input type="checkbox" class="form-check-input" id="isDone" name="isDone" <% if(item.isDone()) { %> checked <% } %>>
            <label class="form-check-label" for="isDone">IsDone</label>
        </div>
        <div class="mb-3">
            <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal">
                Удалить
            </button>
            <button type="submit" class="btn btn-primary">
                Сохранить
            </button>
        </div>
    </form>
    <!-- Modal for button DELETE-->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form action="/deleteItem" method="post">
                    <div class="modal-body">
                        <input type="hidden" name="id" value="<%=item.getId()%>">
                        <h1 style="text-align: center">ARE YOU SURE?</h1>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">NO</button>
                        <button type="submit" class="btn btn-primary">YES</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
