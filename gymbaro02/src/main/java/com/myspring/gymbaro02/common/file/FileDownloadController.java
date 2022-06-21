package com.myspring.gymbaro02.common.file;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import net.coobird.thumbnailator.Thumbnails;

@Controller
public class FileDownloadController {
	private static String CURR_IMAGE_REPO_PATH_GOODS = "C:\\gymbaro_img\\goods";
	private static String CURR_IMAGE_REPO_PATH_GYMS = "C:\\gymbaro_img\\gyms";
	private static String CURR_IMAGE_REPO_PATH_NOTICE = "C:\\gymbaro_img\\notice";

	@RequestMapping("/download")
	protected void download(@RequestParam("fileName") String fileName,
		                 	@RequestParam("goods_id") String goods_id,
			                 HttpServletResponse response) throws Exception {
		OutputStream out = response.getOutputStream();
		String filePath=CURR_IMAGE_REPO_PATH_GOODS+"\\"+goods_id+"\\"+fileName;
		File image=new File(filePath);

		response.setHeader("Cache-Control","no-cache");
		response.addHeader("Content-disposition", "attachment; fileName="+fileName);
		FileInputStream in=new FileInputStream(image); 
		byte[] buffer=new byte[1024*8];
		while(true){
			int count=in.read(buffer); //버퍼에 읽어들인 문자개수
			if(count==-1)  //버퍼의 마지막에 도달했는지 체크
				break;
			out.write(buffer,0,count);
		}
		in.close();
		out.close();
	}
	
	@RequestMapping("/downloadGym")
	protected void downloadGym(@RequestParam("fileName") String fileName,
		                 	@RequestParam("gym_id") String gym_id,
			                 HttpServletResponse response) throws Exception {
		OutputStream out = response.getOutputStream();
		String filePath=CURR_IMAGE_REPO_PATH_GYMS+"\\"+gym_id+"\\"+fileName;
		File image=new File(filePath);

		response.setHeader("Cache-Control","no-cache");
		response.addHeader("Content-disposition", "attachment; fileName="+fileName);
		FileInputStream in=new FileInputStream(image); 
		byte[] buffer=new byte[1024*8];
		while(true){
			int count=in.read(buffer); //버퍼에 읽어들인 문자개수
			if(count==-1)  //버퍼의 마지막에 도달했는지 체크
				break;
			out.write(buffer,0,count);
		}
		in.close();
		out.close();
	}
	
	//공지사항 이미지 다운로드
	@RequestMapping("/downloadNoticeImage")
	protected void downloadNoticeImage(@RequestParam("imageFileName") String imageFileName,
		                 	@RequestParam("noticeNo") String noticeNo,
			                 HttpServletResponse response) throws Exception {
		OutputStream out = response.getOutputStream();
		String filePath= CURR_IMAGE_REPO_PATH_NOTICE + "\\" + noticeNo + "\\" + imageFileName;
		File image = new File(filePath);

		response.setHeader("Cache-Control","no-cache");
		response.addHeader("Content-disposition", "attachment; fileName="+ imageFileName);
		FileInputStream in=new FileInputStream(image); 
		byte[] buffer=new byte[1024*8];
		while(true){
			int count=in.read(buffer);
			if(count==-1)
				break;
			out.write(buffer,0,count);
		}
		in.close();
		out.close();
	}
	
	@RequestMapping("/thumbnails.do")
	protected void thumbnails(@RequestParam("fileName") String fileName,
                            	@RequestParam("goods_id") String goods_id,
			                 HttpServletResponse response) throws Exception {
		OutputStream out = response.getOutputStream();
		String filePath=CURR_IMAGE_REPO_PATH_GOODS +"\\"+goods_id+"\\"+fileName;
		File image=new File(filePath);
		
		if (image.exists()) { 
			Thumbnails.of(image).size(400,380).outputFormat("png").toOutputStream(out);
		}
		byte[] buffer = new byte[1024 * 8];
		out.write(buffer);
		out.close();
	}
	
	@RequestMapping("/thumbnailsGym.do")
	protected void thumbnailsGym(@RequestParam("fileName") String fileName,
                            	@RequestParam("gym_id") String gym_id,
			                 HttpServletResponse response) throws Exception {
		OutputStream out = response.getOutputStream();
		String filePath=CURR_IMAGE_REPO_PATH_GYMS +"\\"+gym_id+"\\"+fileName;
		File image=new File(filePath);
		
		if (image.exists()) { 
			Thumbnails.of(image).size(400,380).outputFormat("png").toOutputStream(out);
		}
		byte[] buffer = new byte[1024 * 8];
		out.write(buffer);
		out.close();
	}
}
