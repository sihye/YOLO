package com.one.yolo.admin.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.one.yolo.common.CmExcelManager;
import com.one.yolo.member.model.MemberService;
import com.one.yolo.member.model.MemberVO;

@Controller
@RequestMapping("/admin")
public class ExcelContoroller{
	
	@Autowired
	MemberService service;
	
	@RequestMapping("/excelUpload.do")
	public String excelUpload(@RequestParam(value="excelFile", required=false, defaultValue="") MultipartFile excelFile,
			ModelMap model, HttpServletRequest request)throws Exception{
		try{
			String result ="";
			if(excelFile.getSize() != 0L){
				CmExcelManager excelManager =new CmExcelManager(excelFile.getInputStream());
				List<List<Object>> excelData = excelManager.readExcel();
				if(excelData.size()==0){
					result = "Data Not Found";
				}else{
					int cnt = 0;
					for(List<Object> cellData : excelData){
						if(cnt ++ ==0) continue;
						System.out.println("--엑셀 업로드--");
						System.out.println(cellData.get(0)+" - "+cellData.get(1));
						
					}
				}
			}
	}catch (Exception e) {
		e.printStackTrace();
	}
	
	return "admin/operatorMember";
	}




	@RequestMapping("/excelDownload.do")
	public @ResponseBody byte[] excelDownload(ModelMap model, HttpServletRequest request,HttpServletResponse response)throws Exception{
		List<MemberVO> listCode = service.MemberselectByAll();
		
		List<Object> header = new ArrayList<Object>();
		List<List<Object>> data = new ArrayList<List<Object>>();
		
		header.add("M_USERID");
		header.add("MG_NO2");
		header.add("M_NO");
		header.add("M_PWD");
		header.add("M_NAME");
		header.add("M_EMAIL1");
		header.add("M_EMAIL2");
		header.add("M_ADDRESS");
		header.add("M_ADDRESSDETAIL");
		header.add("M_BANKNAME");
		header.add("M_ACCOUNT");
		header.add("M_JOINDATE");
		header.add("M_LEAVEDATE");
		header.add("K_NO1");
		header.add("K_NO2");
		header.add("K_NO3");
		header.add("M_TEL1");
		header.add("M_TEL2");
		header.add("M_TEL3");
		header.add("Q_QUESTIONNO");
		header.add("M_QUESTIONANSWER");
		
		for(MemberVO vo : listCode){
			List<Object> obj = new ArrayList<Object>();
			obj.add(vo.getkNo1());
			obj.add(vo.getkNo2());
			obj.add(vo.getkNo3());
			obj.add(vo.getMgNo2());
			obj.add(vo.getmNo());
			obj.add(vo.getqQuestionno());
			obj.add(vo.getmAccount());
			obj.add(vo.getmAddress());
			obj.add(vo.getmAddressdetail());
			obj.add(vo.getmBankname());
			obj.add(vo.getmEmail1());
			obj.add(vo.getmEmail2());
			obj.add(vo.getmJoindate());
			obj.add(vo.getmLeavedate());
			obj.add(vo.getmName());
			obj.add(vo.getmPwd());
			obj.add(vo.getmQuestionanswer());
			obj.add(vo.getmTel1());
			obj.add(vo.getmTel2());
			obj.add(vo.getmTel3());
			obj.add(vo.getmUserid());
			
			data.add(obj);
		}
		CmExcelManager excelManager = new CmExcelManager(header,data);
		excelManager.setSheetName("testcode");
		excelManager.setWidth(6000);
		
		byte[] bytes=excelManager.makeExcel();
		
		response.setHeader("Content-Dispositon", "attachment; filename=codeTest.xlsx");
		response.setContentLength(bytes.length);
		response.setContentType("application/vnd.ms-excel");
		
		return bytes;
	}
}
