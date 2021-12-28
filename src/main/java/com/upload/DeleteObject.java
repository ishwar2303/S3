package com.upload;

import java.io.IOException;
import java.util.Properties;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import software.amazon.awssdk.auth.credentials.AwsBasicCredentials;
import software.amazon.awssdk.auth.credentials.StaticCredentialsProvider;
import software.amazon.awssdk.services.s3.S3Client;
import software.amazon.awssdk.services.s3.model.DeleteObjectRequest;

@WebServlet("/delete-s3-object")
public class DeleteObject extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public DeleteObject() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String accessKeyId = "AKIAX6BWEJNDPKJUQ7GM";
		String secrectAccessKey = "2ivdfs77UJAgQ3ZFTvfyyVfP+cMqrLkHbL1H2p7C";
		AwsBasicCredentials awsCreds = AwsBasicCredentials.create(
				  accessKeyId,
				  secrectAccessKey);
		
		String objectKey = request.getParameter("objectKey");

		Properties props = System.getProperties();
    	props.setProperty("aws.region", "ap-south-1");
        S3Client s3 = S3Client.builder().region(null)
                .credentialsProvider(StaticCredentialsProvider.create(awsCreds))
                .build();
        DeleteObjectRequest delReq = DeleteObjectRequest.builder().bucket("uploads-pd").key(objectKey).build();
        s3.deleteObject(delReq);
        response.sendRedirect("show-bucket-items");
        
	}
}
