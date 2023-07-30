<%@page import="com.helper.FactoryProvider"%>
<%@page import="com.entities.Note"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="all_css_js.jsp"%>
</head>
<body>

	<div class="container">
		<%@include file="navbar.jsp"%>
		<h1>Edit your Note:</h1>
		<br>


		<%
		int noteId = Integer.parseInt(request.getParameter("note_id").trim());
		Session s = FactoryProvider.getFactory().openSession();
		Note note = (Note) s.get(Note.class, noteId);
		%>

		<form action="UpdateNoteServlet" method="post">
		
		<input value="<%=note.getId() %>" name="noteId" type="hidden"/>
			<div class="form-group">
				<label for="title">Note Title</label>
				 <input name="title" 
				 required
					type="text" 
					class="form-control" 
					id="title"
					aria-describedby="emailHelp" 
					placeholder="Enter here"
					value="<%=note.getTitle() %>"
					/>

			</div>
			<div class="form-group">
				<label for="content">Note Content</label>
				<textarea name="content" id="content"
					placeholder="Enter your content here" class="form-control"
					style="height: 300px"><%=note.getContent() %>
					 </textarea>
			</div>

			<div class="container text-center">

				<button type="submit" class="btn btn-success">Save your Note</button>
			</div>


		</form>

	</div>
</body>
</html>