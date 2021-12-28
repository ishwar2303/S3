<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String fileName = (String) request.getAttribute("fileName");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	
	.uploaded-img {
		width: 500px;
		height: 400px;
		overflow: hidden;
		border-radius: 10px;
		box-shadow: 0px 0px 6px 0px rgba(0,0,0,0.5);
		margin-top: 20px;
	}
	.uploaded-img img {
		max-height: 100%;
		max-width: 100%;
		height: 100%;
		width: 100%;
	}
	.uploaded-img img:hover {
		transform: scale(1.1);
		transition: all .5s ease-in-out;
	}
	.upload-more-link {
		text-decoration: none;
		background: rgba(0, 0, 0, 0.7);
		color: white;
		border-radius: 7px;
		padding: 12px 20px;
	}
</style>
</head>
<body>
    <div align="center">
        <div><h3>${message}</h3></div>
        <a class="upload-more-link" href="/UploadToS3/home">Upload More</a>
        <div class="uploaded-img" >
        	<img src="https://uploads-pd.s3.ap-south-1.amazonaws.com/<%= fileName %>" alt="Not able to load"/>
    	</div>
    </div>   
</body>
</html>