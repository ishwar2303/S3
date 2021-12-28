<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%
	ArrayList<String> files = (ArrayList) request.getAttribute("s3Files");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>S3 Bucket</title>
<style>
div {
	display: flex;
	justify-content: flex-start;
	flex-wrap: wrap;
}
div div {
	width: 300px;
	height: 300px;
	margin: 10px;
	border-radius: 10px;
	overflow: hidden;
	box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.5);
	display: flex;
	justify-content: center;
	align-items: center;
	position: relative;
}
div div img {
	max-height: 100%;
}

div div img:hover {
	transform: scale(1.1);
	transition: all .5s ease-in-out;
}
.delete-link {
	position: absolute;
	left: 0;
	bottom: 0;
	border-top-right-radius: 5px;
	background: rgba(255, 0, 0, 0.7);
	color: white;
	z-index: 10;
	text-decoration: none;
	padding: 5px 10px;
}

</style>
</head>
<body>
	<h1 style="text-align: center;">Accessing Items from S3 Bucket using JAVA Servlet.</h1>
	<div class="item-container">
		<%
			for(String fileName : files) {
		%>
			<div>
				<img src="https://uploads-pd.s3.ap-south-1.amazonaws.com/<%= fileName %>" />
				<a class="delete-link" onclick="return confirm('This object will be permanently delete from S3 bucket')" href="/UploadToS3/delete-s3-object?objectKey=<%= fileName %>">Delete</a>
			</div>
		<%
			}
		%>
	</div>
</body>
</html>