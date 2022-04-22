package com.myspring.gymbaro02.gym.vo;

import java.util.Date;

// gym_detail_img table
public class GymImageFileVO {
	private int img_id;
	private int gym_id;
	private String fileName;
	private String fileType;
	private int uid;
	private Date uploadDate;


	public GymImageFileVO() {}

		public GymImageFileVO(int img_id, int gym_id, String fileName, String fileType, int uid, Date uploadDate) {
			this.img_id = img_id;
			this.gym_id = gym_id;
			this.fileName = fileName;
			this.fileType = fileType;
			this.uid = uid;
			this.uploadDate = uploadDate;
		}

		public int getImg_id() {
			return img_id;
		}
		
		public void setImg_id(int img_id) {
			this.img_id = img_id;
		}
		
		public int getGym_id() {
			return gym_id;
		}
		
		public void setGym_id(int gym_id) {
			this.gym_id = gym_id;
		}
		
		public String getFileName() {
			return fileName;
		}
		
		public void setFileName(String fileName) {
			this.fileName = fileName;
		}
		
		public String getFileType() {
			return fileType;
		}
		
		public void setFileType(String fileType) {
			this.fileType = fileType;
		}
		
		public int getUid() {
			return uid;
		}
		
		public void setUid(int uid) {
			this.uid = uid;
		}
		
		public Date getUploadDate() {
			return uploadDate;
		}
		
		public void setUploadDate(Date uploadDate) {
			this.uploadDate = uploadDate;
		}

}
