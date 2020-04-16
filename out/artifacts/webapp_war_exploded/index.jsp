<%@ page import="java.util.ArrayList" %>
<%@ page import="users.Student" %>
<%@ page import="dao.DBStudent" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>My Webapp</title>
    <link rel="stylesheet" href="example.css">
  </head>
  <body>
  <h1>
    Работа с таблицей STUDENTS
  </h1>
  <div>
    <form>
      <label for = "name">Введите имя</label>
      <input type="text" id="name" name = "name" placeholder="Student name">

      <label for = "age"> Введите возраст</label>
      <input type="text" id="age" name = "age">

      <label for = "number">Введите номер группы</label>
      <input type="text" id="number" name = "number">

      <input type = "submit">
    </form>
  </div>
  <h2>
    Добавить студента
  </h2>
  <%
    String name = request.getParameter("name");
    int age = 0;
    if (null != request.getParameter("age")) age = Integer.parseInt(request.getParameter("age"));
    int groupNumber = 0;
    if (null != request.getParameter("namber")) groupNumber = Integer.parseInt(request.getParameter("namber"));
    if (null != name ) {
      new DBStudent().addStudent(new Student(name, age, groupNumber));
    }
    ArrayList<Student> student = new DBStudent().getAllStudent();
    %>
    <table id="customers">
      <tr>
        <th>ID</th>
        <th>NAME</th>
        <th>AGE</th>
        <th>GROUP</th>
      </tr>
      <%
        for (Student s: student) {
          String row = String.format("<tr><td>%d</td><td>%s</td><td>%d</td><td>%d</td></tr>",s.getId(), s.getName(), s.getAge(), s.getGroupNumber());
          out.print(row);
        }
      %>
    </table>
  </body>
</html>
