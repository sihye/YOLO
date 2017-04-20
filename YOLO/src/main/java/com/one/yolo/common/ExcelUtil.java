package com.one.yolo.common;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.one.yolo.member.model.MemberService;
import com.one.yolo.upfile.model.UpfileService;

@Component
public class ExcelUtil {
	@Autowired
	UpfileService upfileService;
	@Autowired
	MemberService memberService;
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	private static final Logger logger = LoggerFactory.getLogger(ExcelUtil.class);
	@SuppressWarnings("deprecation")
	public String excelWrith(SearchVO vo){
		//Excel Write
		HSSFWorkbook workbook = new HSSFWorkbook();
		System.out.println("++++++++++++++++++++++++++++맵실행 전");
		List<Map<String,Object>> mMap = memberService.ExcelMemberView(vo);
		System.out.println("++++++++++++++++++++++++++++맵실행 후");
		
		HSSFSheet sheet = workbook.createSheet("회원");

		sheet.setColumnWidth((short)0, (short)4000); // 1000이 열 너비 3.14
		sheet.setColumnWidth((short)1, (short)4000); // 1000이 열 너비 3.14
		sheet.setColumnWidth((short)2, (short)4000); // 1000이 열 너비 3.14
		sheet.setColumnWidth((short)3, (short)4000); // 1000이 열 너비 3.14
		sheet.setColumnWidth((short)4, (short)7000); // 1000이 열 너비 3.14
		sheet.setColumnWidth((short)5, (short)10000); // 1000이 열 너비 3.14
		sheet.setColumnWidth((short)6, (short)7000); // 1000이 열 너비 3.14
		sheet.setColumnWidth((short)7, (short)7000); // 1000이 열 너비 3.14
		sheet.setColumnWidth((short)8, (short)7000); // 1000이 열 너비 3.14
		sheet.setColumnWidth((short)9, (short)7000); // 1000이 열 너비 3.14

		//Font 설정.
		HSSFFont font = workbook.createFont();
		font.setFontName(HSSFFont.FONT_ARIAL);

		//제목의 스타일 지정
		HSSFCellStyle titlestyle = workbook.createCellStyle();
		titlestyle.setFillForegroundColor(HSSFColor.SKY_BLUE.index);
		titlestyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
		titlestyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		titlestyle.setFont(font);

		//Row 생성
		HSSFRow row = sheet.createRow((short)0);
		//Cell 생성
		HSSFCell cell1 = row.createCell((short)0 );
		cell1.setCellValue("NO");
		cell1.setCellStyle(titlestyle);
		

		HSSFCell cell2 = row.createCell((short)1);
		cell2.setCellValue("아이디");
		cell2.setCellStyle(titlestyle);

		HSSFCell cell3 = row.createCell((short)2);
		cell3.setCellValue("이름");
		cell3.setCellStyle(titlestyle);
		
		HSSFCell cell4 = row.createCell((short)3);
		cell4.setCellValue("핸드폰");
		cell4.setCellStyle(titlestyle);
		
		HSSFCell cell5 = row.createCell((short)4);
		cell5.setCellValue("EMAIL");
		cell5.setCellStyle(titlestyle);
		
		HSSFCell cell6 = row.createCell((short)5);
		cell6.setCellValue("주소");
		cell6.setCellStyle(titlestyle);
		
		HSSFCell cell7 = row.createCell((short)6);
		cell7.setCellValue("가입일자");
		cell7.setCellStyle(titlestyle);
		
		HSSFCell cell8 = row.createCell((short)7);
		cell8.setCellValue("관심카테고리1");
		cell8.setCellStyle(titlestyle);
		
		HSSFCell cell9 = row.createCell((short)8);
		cell9.setCellValue("관심카테고리2");
		cell9.setCellStyle(titlestyle);
		
		HSSFCell cell10 = row.createCell((short)9);
		cell10.setCellValue("관심카테고리3");
		cell10.setCellStyle(titlestyle);
		

		//내용 스타일 지정
		HSSFCellStyle style = workbook.createCellStyle();
		style.setFont(font);

		//내용중 가운데 정렬 추가
		HSSFCellStyle styleCenter = workbook.createCellStyle();
		styleCenter.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		styleCenter.setFont(font);

	
		
		for (int i=0; i<mMap.size(); i++){   //리스트 사이즈
			Map<String, Object> map = mMap.get(i);
		    row = sheet.createRow((short)(i+1));
		   
		    cell1 = row.createCell((short)0 );
		    cell1.setCellValue(map.get("M_NO")+"");
		    cell1.setCellStyle(styleCenter);
		    
		    cell2 = row.createCell((short)1);
		    cell2.setCellValue(map.get("M_USERID")+"");
		    cell2.setCellStyle(styleCenter);
		    
		    cell3 = row.createCell((short)2);
		    cell3.setCellValue(map.get("M_NAME")+"");
		    cell3.setCellStyle(styleCenter);
		    
		    cell4 = row.createCell((short)3);
		    if(map.get("M_TEL1")!= null){
		    	cell4.setCellValue(map.get("M_TEL1")+"-"+map.get("M_TEL2")+"-"+map.get("M_TEL3"));
		    }else{
		    	cell4.setCellValue("");
		    }
		    cell4.setCellStyle(styleCenter);
	
		    
		    cell5 = row.createCell((short)4);
		    if(map.get("M_EMAIL1")!=null){
		    	cell5.setCellValue(map.get("M_EMAIL1")+"@"+map.get("M_EMAIL2"));
		    }else{
		    	cell5.setCellValue("");
		    }
		    
		    cell5.setCellStyle(styleCenter);
		    
		    cell6 = row.createCell((short)5);
		    if(map.get("M_ADDRESS")!=null){
		    	if(map.get("M_ADDRESSDETAIL")!=null){
		    		cell6.setCellValue(map.get("M_ADDRESS")+" "+map.get("M_ADDRESSDETAIL"));
		    	}else{
		    		cell6.setCellValue(map.get("M_ADDRESS")+"");
		    	}
		    }else{
		    	cell6.setCellValue("");
		    }
		    cell6.setCellStyle(styleCenter);
		    
		    
		    
		    cell7 = row.createCell((short)6);
		    cell7.setCellValue(sdf.format(map.get("M_JOINDATE")));
		    cell7.setCellStyle(styleCenter);
		    
		    
		    
		    cell8 = row.createCell((short)7);
		    if(map.get("K_1")!=null){
		    	cell8.setCellValue(map.get("K_1")+"");
		    }else{
		    	cell8.setCellValue("");
		    }
		    cell8.setCellStyle(styleCenter);
		    
		    
		    cell9 = row.createCell((short)8);
		    if(map.get("K_2")!=null){
		    	cell9.setCellValue(map.get("K_2")+"");
		    }else{
		    	cell9.setCellValue("");
		    }
		    cell9.setCellStyle(styleCenter);
		    
		    
		    cell10 = row.createCell((short)9);
		    if(map.get("K_3")!=null){
		    	cell10.setCellValue(map.get("K_3")+"");
		    }else{
		    	cell10.setCellValue("");
		    }
		    cell10.setCellStyle(styleCenter);
		   
		    
		}

		// 실제 저장될 파일 이름
		String realName = "member.xls";
		
		
		// 실제로 저장될 파일 풀 경로
		
		File file = new File("D:\\my_github\\YOLO\\YOLO\\src\\main\\webapp\\excel" +"/", realName);

		//엑셀 파일을 만듬
		FileOutputStream fileOutput;
		try {
			fileOutput = new FileOutputStream(file);
			workbook.write(fileOutput);
			fileOutput.close();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		logger.info("Excel File 생성 OK");

		return realName;
		
	}
}
