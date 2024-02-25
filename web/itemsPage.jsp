<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Item" %>
<%@ page import="db.DBManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta charset="">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
</head>
<body>
    <div class="container">
        <%@include file="navbar.jsp"%>
        <br><br>

        <button type="submit" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
            + Добавить Задание
        </button>
        <br>

        <table class="table table-striped">
            <thead>
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Наименование</th>
                    <th scope="col">Крайний срок</th>
                    <th scope="col">Выполнено</th>
                    <th scope="col" width="10%">Детали</th>
                </tr>
            </thead>
            <tbody>
                <%
                    ArrayList<Item> itemArrayList = (ArrayList<Item>) request.getAttribute("items");
                    for(Item item:itemArrayList){
                %>

                <tr>
                    <td><%=item.getId()%></td>
                    <td><%=item.getName()%></td>
                    <td><%=item.getdedlineDate()%></td>
                    <td>
                        <% if (item.isDone()) { %>
                        <span>Да</span>
                        <% } else { %>
                        <span>Нет</span>
                        <% } %>
                    </td>
                    <td>
                        <a href="/details?id=<%=item.getId()%>" class="btn btn-dark">Детали</a>
                    </td>
                </tr>

                <%
                    }
                %>
            </tbody>
        </table>
    </div>
    <!-- Modal for button ADD NEW-->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <h4>Новое Задание</h4>
                <form action="/addTask" method="post">
                    <div class="mb-3">
                        <label for="taskName" class="form-label">Task name:</label>
                        <input type="text" class="form-control" id="taskName" name="taskName">
                    </div>
                    <div class="mb-3">
                        <label for="description" class="form-label">Description:</label>
                        <textarea class="form-control" id="description" name="description" rows="4" cols="50"></textarea>
                    </div>
                    <div class="mb-3">
                        <label for="myDate" class="form-label">Dedline:</label>
                        <input type="date" class="form-control" id="myDate" name="myDate">
                    </div>

                    <button type="submit" class="btn btn-primary">
                        Добавить
                    </button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
