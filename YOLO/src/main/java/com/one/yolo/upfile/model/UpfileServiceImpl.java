package com.one.yolo.upfile.model;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.one.yolo.category.model.CategoryService;
import com.one.yolo.category.model.CategoryVO;
import com.one.yolo.member.model.MemberVO;
import com.one.yolo.question.model.QuestionService;
import com.one.yolo.question.model.QuestionVO;



@Service
public class UpfileServiceImpl implements UpfileService{

	private static final Logger logger = LoggerFactory.getLogger(UpfileServiceImpl.class);

	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private QuestionService qService;
	
	@Autowired
	private UpfileDAO dao;

	@Resource(name="fileUploadProperties")
	private Properties fileProperties;


	@Override
	public int insertUpfile(UpfileVO vo) {
		return dao.insertUpfile(vo);
	}

	@Override
	public UpfileVO selectByOname(String fileName) {
		return dao.selectByOname(fileName);
	}

	public UpfileVO fileUpload(HttpServletRequest request , String uptype){
		System.out.println("파일 업로드 시작");
		MultipartHttpServletRequest multiRequest =(MultipartHttpServletRequest) request;
		Map<String,MultipartFile> fileMap=multiRequest.getFileMap();
		Iterator<String> iter= fileMap.keySet().iterator();
		UpfileVO vo = null;
		while(iter.hasNext()){
			String key = iter.next();
			MultipartFile tempFile = fileMap.get(key);
			//첨부파일 있을경우
			if(!tempFile.isEmpty()){
				String originalFileName = tempFile.getOriginalFilename();
				String fileName="";
				if(uptype.equals(UpfileService.UP_FILE)){
					fileName = getUniqueFileName(originalFileName);
				}else{
					fileName = tempFile.getOriginalFilename();
				}
				long fileSize = tempFile.getSize();				
				String savePath = getUploadPath(request,uptype);
				File file = new File(savePath,fileName);
				System.out.println(originalFileName+" - "+fileName+"-"+fileSize+"-"+uptype);

				try {
					tempFile.transferTo(file);
					logger.info("저장장소 ={},파일이름={}",savePath,fileName);

					vo = new UpfileVO();
					vo.setfFilename(fileName);
					vo.setfOriginalfilename(originalFileName);
					vo.setfFilesize(fileSize);
					if(uptype.equals(UpfileService.UP_FILE)){
						int cnt = insertUpfile(vo);
						if(cnt>0){
							System.out.println("cnt 0 보다 큼 진입");
							vo= new UpfileVO();
							System.out.println("오리지널 파일 네임 ="+originalFileName);
							vo=selectByOname(fileName);
							System.out.println("select 후에  no확인"+vo.getfNo());
						}
					}

				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}//while
		System.out.println("파일 업로드 끝");
		return vo;

	}

	public String getUploadPath(HttpServletRequest request,String uptype){
		String type = fileProperties.getProperty("file.upload.type");

		String upPath="";
		if(type.equals("test")){
			if(uptype.equals("File")){
				upPath=fileProperties.getProperty("file.upload.path.test");
			}else if(uptype.equals("Excel")){
				upPath=fileProperties.getProperty("excel.upload.path.test");
			}else if(uptype.equals("Saveform")){
				upPath=fileProperties.getProperty("saveform.upload.path.test");
			}
		}else{
			String dir = fileProperties.getProperty("file.upload.path");
			upPath=
					request.getSession().getServletContext().getRealPath(dir);
		}
		return upPath;
	}




	public String getUniqueFileName(String fName){
		int lastIndex = fName.lastIndexOf(".");
		fName =fName.substring(0,lastIndex)+"_"+getCurrentTime()+fName.substring(lastIndex);
		return fName;
	}

	public String getCurrentTime(){
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		return sdf.format(date);
	}

	@Override
	public UpfileVO selectByFno(int no) {
		return dao.selectByFno(no);
	}

	@Override
	public int deleteByFno(int no) {
		return dao.deleteByFno(no);
	}


	@Override
	public List<MemberVO> readExcel(File file) {
		List<MemberVO> list = new ArrayList<MemberVO>();
		List<CategoryVO> categoryList = categoryService.selectAll();
		System.out.println("cLIst ="+categoryList.size());
		List<QuestionVO> qlist = qService.selectAll();
		System.out.println("qlist ="+qlist.size());
		//파일을 읽기위해 엑셀파일을 가져온다
		
		FileInputStream fis;
		try {
			fis = new FileInputStream(file);
			HSSFWorkbook workbook=new HSSFWorkbook(fis);
			
			int rowindex=0;
			int columnindex=0;
			//시트 수 (첫번째에만 존재하므로 0을 준다)
			//만약 각 시트를 읽기위해서는 FOR문을 한번더 돌려준다
			HSSFSheet sheet=workbook.getSheetAt(0);
			//행의 수
			int rows=sheet.getPhysicalNumberOfRows();
			for(rowindex=1;rowindex<=rows;rowindex++){
			    //행을 읽는다
			    HSSFRow row=sheet.getRow(rowindex);
			    if(row !=null){
			        //셀의 수
			        int cells=row.getPhysicalNumberOfCells()+1;
			        MemberVO  vo = new MemberVO();
			        for(columnindex=0;columnindex<=cells;columnindex++){
			            //셀값을 읽는다
			            HSSFCell cell=row.getCell(columnindex);
			            String value="";
			                //타입별로 내용 읽기
			          
			                switch(columnindex){
			                case 0://아이디
			                	if(cell!=null){
			                		value=cell.getStringCellValue()+"";
			                	}
			                    vo.setmUserid(value);
			                    continue;
			                case 1://비밀번호
			                	if(cell!=null){
			                		value=cell.getStringCellValue()+"";
			                	}
			                    vo.setmPwd(value);
			                    continue;   
			                case 2://이름
			                	if(cell!=null){
			                		value=cell.getStringCellValue()+"";
			                	}
			                	 vo.setmName(value);
			                	 continue;
			                case 3://핸드폰
			                		if(cell!=null){
			                		value=cell.getStringCellValue();
			                		String tel []= new String[3];
			                		if(value!=null){
			                		tel = value.split("-");
			                		System.out.println("size = "+tel.length +", tel value="+cell.getStringCellValue());
			                		}
			                		vo.setmTel1(tel[0]);
			                		vo.setmTel2(tel[1]);
			                		vo.setmTel3(tel[2]);	
			                		}
			                		continue;
			                case 4://이메일
			                	if(cell!=null){
			                		value=cell.getStringCellValue()+"";
			                		String email[]={"",""};
			                		if(value!=null && !value.isEmpty()){
				                		email = value.split("@");
			                		}
			                		vo.setmEmail1(email[0]);
			                		vo.setmEmail2(email[1]);
			                	}
			                		continue;
			                case 5://주소
			                	if(cell!=null){
			                		value=cell.getStringCellValue()+"";
			                		System.out.println(value+"= addr");
			                		String addr[] =new String[2];
			                		if(value!=null && !value.isEmpty()){
			                			addr = value.split("/");
			                			System.out.println("size = "+addr.length +", addr value="+value);
			                		}
			                		vo.setmAddress(addr[0]);
			                		vo.setmAddressdetail(addr[1]);
			                	}
			                		continue;
			                case 6://관심1
			                		if(cell !=null){
			                		value=cell.getStringCellValue()+"";
			                		
			                		if(value!=null && !value.isEmpty()){
			                		int kno;
			                		for(int i=0; i<categoryList.size();i++){
			                			CategoryVO cvo = categoryList.get(i);
			                			if(cvo.getkName().equals(value)){
			                				kno=cvo.getkNo();
			                				System.out.println("Kno="+kno);
			                				vo.setkNo1(kno);
			                			}
			                			}
			                		}
			                		}
			                	
			                		continue;
			                case 7://관심2
			                		if(cell !=null){
			                			value=cell.getStringCellValue()+"";
			                		
			                		if(value!=null && !value.isEmpty()){
			                		int kno1;
			                		for(int i=0; i<categoryList.size();i++){
			                			CategoryVO cvo = categoryList.get(i);
			                			if(cvo.getkName().equals(value)){
			                				kno1=cvo.getkNo();
			                				System.out.println("Kno="+kno1);
			                				vo.setkNo2(kno1);
			                			}
			                		}
			                		}
			                		}
			                
			                
			                		
			                	
			                		continue;
			                case 8://관심3
			                	if(cell !=null){
			                		value=cell.getStringCellValue()+"";
			                		if(value!=null && !value.isEmpty()){
			                		int kno11;
			                		for(int i=0; i<categoryList.size();i++){
			                			CategoryVO cvo = categoryList.get(i);
			                			if(cvo.getkName().equals(value)){
			                				kno11=cvo.getkNo();
			                				System.out.println("Kno="+kno11);
			                				vo.setkNo3(kno11);
			                			}
			                		}
			                	}
			                	}
			                	
			                		continue;
			                case 9://질문
			                		value=cell.getStringCellValue()+"";
			                		for(int i=0; i<qlist.size();i++){
			                			QuestionVO qvo = qlist.get(i);
			                			if(qvo.getqQuestionname().equals(value)){
			                				vo.setqQuestionno(qvo.getqQuestionno());
			                				System.out.println("qno="+vo.getqQuestionno());
			                			}
			                		}
			                
			                		continue;
			                case 10://답
			                		value=cell.getStringCellValue()+"";	
			                	  	vo.setmQuestionanswer(value);
			                	  	System.out.println("qan ="+vo.getmQuestionanswer());
			                	  	continue;
			                
			                case 11://생년월일
			                		value=(int)cell.getNumericCellValue()+"";
			                		vo.setmBirth(value);
			                		System.out.println("생년월일 = "+vo.getmBirth());
			                		continue;
			                		
			                case 12://성별
			                	value=cell.getStringCellValue()+"";
			                	if(value.equals("남")){
			                		vo.setmGender("M");
			                	}else{
			                		vo.setmGender("F");
			                	}
			                	continue;
			                }
			              
			                	
				            System.out.println("각 셀 내용 :"+value);
			            }
			        list.add(vo);
			        }
			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;

	}

	@Override
	public List<MemberVO> readExcelHost(File file) {
		List<MemberVO> list = new ArrayList<MemberVO>();
		List<CategoryVO> categoryList = categoryService.selectAll();
		System.out.println("cLIst ="+categoryList.size());
		List<QuestionVO> qlist = qService.selectAll();
		System.out.println("qlist ="+qlist.size());
		//파일을 읽기위해 엑셀파일을 가져온다
		
		FileInputStream fis;
		try {
			fis = new FileInputStream(file);
			HSSFWorkbook workbook=new HSSFWorkbook(fis);
			
			int rowindex=0;
			int columnindex=0;
			//시트 수 (첫번째에만 존재하므로 0을 준다)
			//만약 각 시트를 읽기위해서는 FOR문을 한번더 돌려준다
			HSSFSheet sheet=workbook.getSheetAt(0);
			//행의 수
			int rows=sheet.getPhysicalNumberOfRows();
			for(rowindex=1;rowindex<=rows;rowindex++){
			    //행을 읽는다
			    HSSFRow row=sheet.getRow(rowindex);
			    if(row !=null){
			        //셀의 수
			        int cells=row.getPhysicalNumberOfCells()+1;
			        MemberVO  vo = new MemberVO();
			        for(columnindex=0;columnindex<=cells;columnindex++){
			            //셀값을 읽는다
			            HSSFCell cell=row.getCell(columnindex);
			            String value="";
			                //타입별로 내용 읽기
			          
			                switch(columnindex){
			                case 0://아이디
			                	if(cell!=null){
			                		value=cell.getStringCellValue()+"";
			                	}
			                    vo.setmUserid(value);
			                    continue;
			                case 1://비밀번호
			                	if(cell!=null){
			                		value=cell.getStringCellValue()+"";
			                	}
			                    vo.setmPwd(value);
			                    continue;   
			                case 2://이름
			                	if(cell!=null){
			                		value=cell.getStringCellValue()+"";
			                	}
			                	 vo.setmName(value);
			                	 continue;
			                case 3://핸드폰
			                		if(cell!=null){
			                		value=cell.getStringCellValue();
			                		String tel []= new String[3];
			                		if(value!=null){
				                		tel = value.split("-");
				                		System.out.println("size = "+tel.length +", tel value="+cell.getStringCellValue());
			                		}
			                		vo.setmTel1(tel[0]);
			                		vo.setmTel2(tel[1]);
			                		vo.setmTel3(tel[2]);	
			                		}
			                		continue;
			                case 4://이메일
			                	if(cell!=null){
			                		value=cell.getStringCellValue()+"";
			                		String email[]={"",""};
			                		if(value!=null && !value.isEmpty()){
				                		email = value.split("@");
			                		}
			                		vo.setmEmail1(email[0]);
			                		vo.setmEmail2(email[1]);
			                	}
			                		continue;
			                case 5://주소
			                	if(cell!=null){
			                		value=cell.getStringCellValue()+"";
			                		System.out.println(value+"= addr");
			                		String addr[] =new String[2];
			                		if(value!=null && !value.isEmpty()){
			                			addr = value.split("/");
			                			System.out.println("size = "+addr.length +", addr value="+value);
			                		}
			                		vo.setmAddress(addr[0]);
			                		vo.setmAddressdetail(addr[1]);
			                	}
			                		continue;
			                case 6://관심1
			                		if(cell !=null){
			                		value=cell.getStringCellValue()+"";
			                		
			                		if(value!=null && !value.isEmpty()){
			                		int kno;
			                		for(int i=0; i<categoryList.size();i++){
			                			CategoryVO cvo = categoryList.get(i);
			                			if(cvo.getkName().equals(value)){
			                				kno=cvo.getkNo();
			                				System.out.println("Kno="+kno);
			                				vo.setkNo1(kno);
			                			}
			                			}
			                		}
			                		}
			                	
			                		continue;
			                case 7://관심2
			                		if(cell !=null){
			                			value=cell.getStringCellValue()+"";
			                		
			                		if(value!=null && !value.isEmpty()){
			                		int kno1;
			                		for(int i=0; i<categoryList.size();i++){
			                			CategoryVO cvo = categoryList.get(i);
			                			if(cvo.getkName().equals(value)){
			                				kno1=cvo.getkNo();
			                				System.out.println("Kno="+kno1);
			                				vo.setkNo2(kno1);
			                			}
			                		}
			                		}
			                		}
			                
			                
			                		
			                	
			                		continue;
			                case 8://관심3
			                	if(cell !=null){
			                		value=cell.getStringCellValue()+"";
			                		if(value!=null && !value.isEmpty()){
			                		int kno11;
			                		for(int i=0; i<categoryList.size();i++){
			                			CategoryVO cvo = categoryList.get(i);
			                			if(cvo.getkName().equals(value)){
			                				kno11=cvo.getkNo();
			                				System.out.println("Kno="+kno11);
			                				vo.setkNo3(kno11);
			                			}
			                		}
			                	}
			                	}
			                	
			                		continue;
			                case 9://질문
			                		value=cell.getStringCellValue()+"";
			                		for(int i=0; i<qlist.size();i++){
			                			QuestionVO qvo = qlist.get(i);
			                			if(qvo.getqQuestionname().equals(value)){
			                				vo.setqQuestionno(qvo.getqQuestionno());
			                				System.out.println("qno="+vo.getqQuestionno());
			                			}
			                		}
			                
			                		continue;
			                case 10://답
			                		value=cell.getStringCellValue()+"";	
			                	  	vo.setmQuestionanswer(value);
			                	  	System.out.println("qan ="+vo.getmQuestionanswer());
			                	  	continue;
			                case 11:
		                    	value=cell.getStringCellValue()+"";
		                    	vo.setmBankname(value);
		                	continue;
		                	
			                case 12:
	                    	value=cell.getStringCellValue()+"";
	                    	vo.setmAccount(value);
	                    	continue;	
	                    	
			                case 13:
		                    	value=(int)cell.getNumericCellValue()+"";
		                    	vo.setmBirth(value);
		                    	continue;	 
		                    	
			                case 14:
			                	value=cell.getStringCellValue()+"";
			                	if(value.equals("남")){
			                		vo.setmGender("M");
			                	}else{
			                		vo.setmGender("F");
			                	}
			                	continue;	  	
	                    	
			                }
				            System.out.println("각 셀 내용 :"+value);
			            }
			        list.add(vo);
			        }
			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;

			        
		
	}
	
	
	


}
