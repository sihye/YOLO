package com.one.yolo.common;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;

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

import com.one.yolo.upfile.model.UpfileService;

public class ExcelUtil {
	@Autowired
	UpfileService upfileService;
	private static final Logger logger = LoggerFactory.getLogger(ExcelUtil.class);
	@SuppressWarnings("deprecation")
	public String excelWrith(){
		//Excel Write
		HSSFWorkbook workbook = new HSSFWorkbook();

		HSSFSheet sheet = workbook.createSheet("회원");

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
		cell1.setCellValue("제목1");
		cell1.setCellStyle(titlestyle);

		HSSFCell cell2 = row.createCell((short)1);
		cell2.setCellValue("제목2");
		cell2.setCellStyle(titlestyle);

		HSSFCell cell3 = row.createCell((short)2);
		cell3.setCellValue("제목3");
		cell3.setCellStyle(titlestyle);


		//내용 스타일 지정
		HSSFCellStyle style = workbook.createCellStyle();
		style.setFont(font);

		//내용중 가운데 정렬 추가
		HSSFCellStyle styleCenter = workbook.createCellStyle();
		styleCenter.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		styleCenter.setFont(font);

		for (int i=0; i<5;i++){   //리스트 사이즈
		    row = sheet.createRow((short)(i+1));
		   
		    cell1 = row.createCell((short)0 );
		    cell1.setCellValue("내용1");
		    cell1.setCellStyle(styleCenter);
		    
		    cell2 = row.createCell((short)1);
		    cell2.setCellValue("내용2");
		    cell2.setCellStyle(style);
		    
		    cell3 = row.createCell((short)2);
		    cell3.setCellValue("내용3");
		    cell3.setCellStyle(style);
		    
		    
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
