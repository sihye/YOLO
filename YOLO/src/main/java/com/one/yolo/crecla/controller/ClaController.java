package com.one.yolo.crecla.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.hy.herb.reboard.model.ReBoardVO;
import com.one.yolo.booking.model.BookingService;
import com.one.yolo.category.model.CategoryGroupVO;
import com.one.yolo.category.model.CategoryService;
import com.one.yolo.category.model.CategoryVO;
import com.one.yolo.classboard.model.ClassBoardService;
import com.one.yolo.classboard.model.ClassBoardVO;
import com.one.yolo.common.FileUploadWebUtil;
import com.one.yolo.common.PaginationInfo;
import com.one.yolo.common.SearchVO;
import com.one.yolo.common.Utility;
import com.one.yolo.crecla.model.ClassService;
import com.one.yolo.crecla.model.ClassVO;
import com.one.yolo.crecla.model.ScheduleVO;
import com.one.yolo.upfile.model.UpfileService;
import com.one.yolo.upfile.model.UpfileVO;

@Controller
@RequestMapping("/class")
public class ClaController {
	private static final Logger logger =LoggerFactory.getLogger(ClaController.class);
	
	@Autowired
	private CategoryService cService;
	@Autowired
	private ClassService claService;
	@Autowired
	private UpfileService uService;
	@Autowired
	private FileUploadWebUtil fileUploadWebUtil;
	@Autowired
	private ClassBoardService claBoardService;
	@Autowired
	private BookingService bookService;
	
	@Autowired
	private UpfileService upfileService;

	//클래스 생성 페이지 보여주기
	@RequestMapping(value="/clacre.do", method=RequestMethod.GET)
	public String showClaCre_get(@RequestParam(defaultValue="0", required=false)int kgNo,Model model){
		logger.info("클래스생성페이지 보여주기");
		List<CategoryGroupVO> gCateList=cService.selCateGroupAll();
		List<CategoryVO> cateList =cService.selectCateAll();
		logger.info("☆☆☆gcateList size={}",gCateList.size());
		logger.info("cateList size={}",cateList.size());
		model.addAttribute("gCateList", gCateList);
		model.addAttribute("cateList", cateList);
		return "class/creclass";
	}
	
	//클래스 인서트
	@RequestMapping(value="/clacre.do", method=RequestMethod.POST)
	public String insertCla(HttpSession session,HttpServletRequest req,@ModelAttribute ScheduleVO sVO , @ModelAttribute ClassVO vo, Model model){
		logger.info("클래스 insert param vo={}",vo);
		String userid=(String)session.getAttribute("userid");		
		logger.info("session userid={}",userid);
		vo.setmUserid(userid);
		vo.setmUserid("test");
		//파일 업로드 처리
		List<Map<String, Object>> fileList= fileUploadWebUtil.fileUpload(req, FileUploadWebUtil.IMAGE_UPLOAD);
		logger.info("업로드 이미지 filelist size={}",fileList.size());
		
		//업로드 완료된 경우
		String imgUrl[]=new String [fileList.size()];
		if(fileList!=null&&!fileList.isEmpty()){
			for(int i=0;i<fileList.size();i++){
				Map<String, Object> map=fileList.get(i);
				imgUrl[i]=(String)map.get("fileName");
				logger.info("저장 img name={}",(String)map.get("fileName"));
			}
			//img url vo setting
			if(fileList.size()==1){
				vo.setcMainimg(imgUrl[0]);
				vo.setcDetailimg1("");
				vo.setcDetailimg2("");
				vo.setcDetailimg3("");
			}else if(fileList.size()==2){
				vo.setcMainimg(imgUrl[0]);
				vo.setcDetailimg1(imgUrl[1]);
				vo.setcDetailimg2("");
				vo.setcDetailimg3("");
			}else if(fileList.size()==3){
				vo.setcMainimg(imgUrl[0]);
				vo.setcDetailimg1(imgUrl[1]);
				vo.setcDetailimg2(imgUrl[2]);
				vo.setcDetailimg3("");
			}else{
				vo.setcMainimg(imgUrl[0]);
				vo.setcDetailimg1(imgUrl[1]);
				vo.setcDetailimg2(imgUrl[2]);
				vo.setcDetailimg3(imgUrl[3]);
			}
		}		
		logger.info("cla inset param vo(셋팅완료)={}",vo);

		int cnt=claService.claInsert(vo,sVO);
		String msg="",url="/class/clacre.do";
		if(cnt>0){
			
				msg="클래스 등록 성공!";
				url="/index2.do";
						
		}else{
			msg="클래스 등록 실패! 다시 시도해 주세요 ^^";		
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "common/message";
	}
	


	@RequestMapping("/claDetail.do")
	public String claDetail(@RequestParam int cNo,@RequestParam(value="boardtype",required=false, defaultValue="") String boardtype,@ModelAttribute ClassBoardVO claboardvo ,HttpSession session, Model model, HttpServletResponse response){
		String userid=(String)session.getAttribute("userid");
	
		logger.info("클래스 디테일 파람no={}, session userid={}",cNo,userid);
		if(boardtype.isEmpty() || boardtype.equals("")){
			boardtype="main";
		}
		logger.info("type ={}",boardtype);
		claboardvo.setcNo(cNo);
		logger.info("classBoard VO= {}",claboardvo);
		//디테일 조회수 증가
		int cnt=claService.hitUpdate(cNo);
		logger.info("hit update cnt={}",cnt);
		//최근본 클래스
		String claNo = Integer.toString(cNo);
		Cookie cookie =new Cookie("classNo"+userid+claNo,claNo);
		cookie.setPath("/");
		cookie.setMaxAge(60*60*24);
		response.addCookie(cookie);
		
		//페이징 처리
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(Utility.RECORDCOUNT_PERPAGE);
		pagingInfo.setCurrentPage(claboardvo.getCurrentPage());
	
		claboardvo.setRecordCountPerPage(Utility.RECORDCOUNT_PERPAGE);
		claboardvo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		List<ClassBoardVO> claBoardList = claBoardService.selectClassBoard(claboardvo);
		logger.info("클래스  classList.size()={}",claBoardList.size());
		int totalRecord = claBoardService.selectClassBoardCount(claboardvo);
		logger.info("클래스 board 목록 조회-전체레코드 개수조회 결과, totalRecord={}",			
				totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		
		
		ClassVO vo=claService.selClass(cNo);	
		String kName=cService.selCateNameByNo(vo.getkNo());
		
		//회원이 관심있을만한 클래스
		userid="hong";
		List<ClassVO> alist=claService.selInterCla(userid);
		model.addAttribute("inClaList",	alist);
		logger.info("관심클래스 list size={}",alist.size());
		
		//클래스 스케줄
		ScheduleVO schVo=claService.selSch(cNo);
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		Date sDay= new Date();
		Date eDay= new Date();

		try {
			sDay=sdf.parse(schVo.getScStartdate());
			eDay=sdf.parse(schVo.getScEnddate());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		SimpleDateFormat sdf2=new SimpleDateFormat("yyyy-MM-dd/E");
		logger.info(sdf2.format(sDay));
		String sday=sdf2.format(sDay);
		Calendar c1 = Calendar.getInstance();
		Calendar c2 = Calendar.getInstance();
		//Calendar 타입으로 변경 add()메소드로 1일씩 추가해 주기위해 변경
		c1.setTime( sDay );
		c2.setTime( eDay );
		logger.info("c1={},c2={}",sdf2.format(c1.getTime()),sdf2.format(c2.getTime()));
		List<Date> dayList=new ArrayList<Date>();
		//시작날짜와 끝 날짜를 비교해, 시작날짜가 작거나 같은 경우 출력
		while( c1.compareTo( c2 ) !=1 ){
			dayList.add(c1.getTime());
			logger.info("while add={}",sdf2.format(c1.getTime()));
			//시작날짜 + 1 일
			c1.add(Calendar.DATE, 1);
			logger.info("while +1={}",sdf2.format(c1.getTime()));
			
		}
		for(int i=0;i<dayList.size();i++){
			logger.info("for=>> daylist={}",sdf2.format(dayList.get(i).getTime()));
		}

		logger.info("daylist size={}",dayList.size());
		String week=schVo.getScWeek();
		logger.info("week={}",week);
		String[] weeks=week.split(",");
		logger.info("weeks[0]={}, size={}",weeks[0], weeks.length);
		List<String> daysList=new ArrayList<String>();
		for(Date c:dayList){
			String day=sdf2.format(c);
			logger.info("tostring day={}",day);
			String[] days=day.split("/");
			logger.info("days[1]={}",days[1]);
			for(int i=0;i<weeks.length;i++){
				logger.info("weeks[i]={}",weeks[i]);
				if(days[1].equals(weeks[i])){
					daysList.add(day);
					logger.info("add되는 day={}",day);
				}
			}
		}
		logger.info("최종 daylist={}",daysList.size());
		
		//신청자 수
		int bookNum=bookService.bookNum(schVo.getScNo());
		
		
		
		model.addAttribute("inClaList",	alist);
		model.addAttribute("claVo", vo);
		model.addAttribute("kName", kName);
		model.addAttribute("claBoardList",claBoardList);
		model.addAttribute("pagingInfo",pagingInfo);
		model.addAttribute("boardType",boardtype);
		model.addAttribute("sch", schVo);
		model.addAttribute("dayslist", daysList);
		model.addAttribute("bookNum", bookNum);
		return "class/classDetail";
	}
	

	@RequestMapping("classCre.do")
	public void test(){
		logger.info("test확인");

	}
	
	@RequestMapping(value="/searchClass.do", method=RequestMethod.POST)
	public String searchClass(@RequestParam String search, Model model){
		logger.info("클래스 검색 페이지 검색어={}",search);
		
		List<CategoryGroupVO> gCateList=cService.selCateGroupAll();
		List<CategoryVO> cateList =cService.selectCateAll();
		logger.info("☆☆☆gcateList size={}",gCateList.size());
		
		model.addAttribute("gCateList", gCateList);
		model.addAttribute("cateList", cateList);
		model.addAttribute("search", search);
		
		return "class/searchClass";
	}
	
	@RequestMapping(value ="/classBoardWrith.do", method=RequestMethod.GET)
	public String classBoardWrith(HttpSession session,@RequestParam int cNo,Model model){
		String userid=(String)session.getAttribute("userid");
		logger.info("classBoardWrith 화면 보여주기 userid={}, cNo={},",userid,cNo);
		model.addAttribute("userid",userid);
		model.addAttribute("cNo",cNo);
		return "class/classBoardWrith";
		
	}
	@RequestMapping(value ="/classBoardWrith.do", method=RequestMethod.POST)
	public String classBoardWrith_post(HttpSession session,@ModelAttribute ClassBoardVO claVo ,HttpServletRequest request, Model model){
		logger.info("클래스 insert param vo={}",claVo);
		claVo.setfNo1(0);
		claVo.setfNo2(0);
		claVo.setfNo3(0);
		String userid=(String)session.getAttribute("userid");		
		logger.info("session userid={}",userid);
		claVo.setmUserid(userid);
		//파일 업로드 처리
		List<Map<String, Object>> fileList= fileUploadWebUtil.fileUpload(request, FileUploadWebUtil.IMAGE_UPLOAD);
		logger.info("업로드 이미지 filelist size={}",fileList.size());
		
		
		List<UpfileVO> upfileList = new ArrayList<UpfileVO>();
		if(fileList !=null && !fileList.isEmpty()){
			for(int i =0; i<fileList.size(); i++){
				UpfileVO fvo = new UpfileVO();
				fvo.setfFilename((String)fileList.get(i).get("fileName"));
				logger.info("filesize ={}",(Long)fileList.get(i).get("fileSize"));
				fvo.setfFilesize((Long) fileList.get(i).get("fileSize"));
				fvo.setfOriginalfilename((String)fileList.get(i).get("originalFileName"));
				upfileList.add(fvo);
				upfileService.insertUpfile(fvo);
			}
			
			if(!upfileList.isEmpty() && upfileList != null){
				for(int i=0; i<upfileList.size(); i++){
					UpfileVO upvo = new UpfileVO();
					if(i==0){
						upvo=upfileService.selectByOname(upfileList.get(i).getfFilename());
						logger.info("fno1={}",upvo.getfNo());
						claVo.setfNo1(upvo.getfNo());
					}else if(i==1){
						upvo=upfileService.selectByOname(upfileList.get(i).getfFilename());
						logger.info("fno2={}",upvo.getfNo());
						claVo.setfNo2(upvo.getfNo());
					}else if(i==2){
						upvo=upfileService.selectByOname(upfileList.get(i).getfFilename());
						logger.info("fno1={}",upvo.getfNo());
						claVo.setfNo3(upvo.getfNo());
					}
				}//for
			}
		}
		logger.info("calVo 값 = {}",claVo);
		int cnt = claBoardService.insertClassBoard(claVo);
		
		//업로드 완료된 경우
		String msg = "", url="/class/claDetail.do?boardtype=cb&cNo="+claVo.getcNo();
		if(cnt>0){
			msg = "등록완료";
		}else{
			msg="등록실패";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "common/message";
	}
	@RequestMapping("/boardDetail.do")
	public String boardDetail(){
		logger.info("글 상세보기, 파라미터");


		return "class/boardDetail";

	}
}
