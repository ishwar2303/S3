package com.upload;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import software.amazon.awssdk.auth.credentials.AwsBasicCredentials;
import software.amazon.awssdk.auth.credentials.StaticCredentialsProvider;
import software.amazon.awssdk.services.s3.S3Client;
import software.amazon.awssdk.services.s3.model.ListObjectsV2Request;
import software.amazon.awssdk.services.s3.model.ListObjectsV2Response;
import software.amazon.awssdk.services.s3.model.S3Object;
import software.amazon.awssdk.services.s3.paginators.ListObjectsV2Iterable;

@WebServlet("/show-bucket-items")
public class ShowBucketObjects extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public ShowBucketObjects() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String accessKeyId = "AKIAX6BWEJNDPKJUQ7GM";
		String secrectAccessKey = "2ivdfs77UJAgQ3ZFTvfyyVfP+cMqrLkHbL1H2p7C";
		AwsBasicCredentials awsCreds = AwsBasicCredentials.create(
				  accessKeyId,
				  secrectAccessKey);
		
		Properties props = System.getProperties();
    	props.setProperty("aws.region", "ap-south-1");
        S3Client client = S3Client.builder().region(null)
                .credentialsProvider(StaticCredentialsProvider.create(awsCreds))
                .build();
        ListObjectsV2Request req = ListObjectsV2Request.builder().bucket("uploads-pd").prefix("").build();
        ListObjectsV2Iterable res = client.listObjectsV2Paginator(req);
        ArrayList<String> files = new ArrayList<String>();
        ArrayList<String> filesKeys = new ArrayList<String>();
        for (ListObjectsV2Response page : res) {
            page.contents().forEach((S3Object object) -> {
            	
                System.out.println(object.key());
                files.add(object.key());
                filesKeys.add(object.storageClassAsString());
            });
        }
        request.setAttribute("s3Files", files);
		request.getRequestDispatcher("bucket-items.jsp").forward(request, response);
	}

}
