package com.gxz.bus.controller;

import java.io.File;
import java.io.IOException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.gxz.bus.utils.RandomUtils;
import com.gxz.sys.utils.WebUtils;

@Controller
@RequestMapping("upload")
public class FileUploadController {
	
	@RequestMapping("fileUpload")
	@ResponseBody
	public String fileUpload(MultipartFile mf){
		String realPath = WebUtils.getCurrentHttpServletRequest().getServletContext().getRealPath("/upload/");
		String dirName = RandomUtils.createDirUseDate();
		File dirFile = new File(realPath,dirName);
		if(!dirFile.exists()){
			dirFile.mkdirs();
		}
		
		String oldName = mf.getOriginalFilename();
		String newName = RandomUtils.createFileNameUseTime(oldName);
		File destFile = new File(dirFile,newName);
		try {
			mf.transferTo(destFile);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		return "upload/"+dirName+"/"+newName;
	}

}
