<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>File Upload</title>
    <script src="https://kit.fontawesome.com/196c90f518.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <style>
        * {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        body {
            display: flex;
            align-items: center;
            flex-direction: column;
            padding: 100px;
        }
        form {
            box-shadow: 0px 0px 7px 0px rgba(0,0,0,0.5);
            padding: 20px;
            display: flex;
            flex-direction: column;
            justify-content: space-evenly;
            align-items: center;
            height: 300px;
            border-radius: 25px;
            width: 300px;
        }
        input:focus,
        button:focus {
            outline: none;
        }
        #file-name {
            padding: 10px;
            border: 0.5px solid rgba(0,0,0,0.3);
            border-radius: 5px;
            box-sizing: border-box;
            width: 100%;
        }
        #upload-btn {
            padding: 10px 15px;
            border-radius: 5px;
            border: none;
            background: rgba(35, 54, 231, 0.5);
            color: white;
        }
    </style>
</head>
<body>

    <form id="file-upload-form" action="upload" method="POST" enctype="multipart/form-data">
        <h3>File Upload uisng JAVA Servlet to AWS S3 Bucket</h3>
        <input id="file-name" type="text" name="description" placeholder="File Name to save on server" required="true" />
        <input type="file" name="file" multiple="true" required="true" />
        <div></div>
        <button id="upload-btn"><i class="fas fa-file-upload"></i> Upload</button>
    </form>
    
</body>
</html>