package com.one.yolo.admin.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.servlet.ModelAndView;

import com.one.yolo.admin.model.OperAtorService;
import com.one.yolo.admin.model.OperAtorVO;
import com.one.yolo.category.model.CategoryService;
import com.one.yolo.category.model.CategoryVO;
import com.one.yolo.common.ExcelUtil;
import com.one.yolo.common.FileUploadWebUtil;
import com.one.yolo.common.PaginationInfo;
import com.one.yolo.common.SearchVO;
import com.one.yolo.common.Utility;
import com.one.yolo.crecla.model.ClassService;
import com.one.yolo.member.model.MemberService;
import com.one.yolo.member.model.MemberVO;
import com.one.yolo.noticeboard.model.NoticeboardService;
import com.one.yolo.noticeboard.model.NoticeboardVO;
import com.one.yolo.payment.model.PaymentService;
import com.one.yolo.upfile.model.UpfileService;
import com.one.yolo.upfile.model.UpfileVO;
import com.one.yolo.useboard.model.UseboardService;
import com.one.yolo.useboard.model.UseboardVO;


@Controller
@RequestMapping(value="/admin")
public class AdminController {

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	@Autowired
	private UseboardService useboardService;
	
	@Autowired
	private FileUploadWebUtil fileUploadWebUtil;
	
	@Autowired
	private UpfileService upFileservice;
	
	@Autowired
	private OperAtorService operAtorservice;

	@Autowired
	private CategoryService categoryservice;

	@Autowired 
	private MemberService memberService;

	@Autowired
	private NoticeboardService noticeService;

	@Autowired
	ExcelUtil excelUtil;
	
	@Autowired
	private PaymentService paymentService;

	@Autowired
	private ClassService classService;

	@RequestMapping(value="/operator.do",method=RequestMethod.GET)
	public String upfile_get(HttpSession session ,Model model){
		
		String userid = (String)session.getAttribute("userid");
		if((userid !=null && !userid.isEmpty())){
			if(!userid.equals("admin")){
				model.addAttribute("msg","잘못된 url입니다.");
				model.addAttribute("url","/adminLogin.do");
				return "common/message";
			}
		}else if(userid==null || userid.isEmpty()){
			model.addAttribute("msg","잘못된 url입니다.");
			model.addAttribute("url","/adminLogin.do");
			return "common/message";
		}
		
		logger.info("operator_get");
		List<CategoryVO> list = categoryservice.selectAll();
		List<Map<String,Object>> map = operAtorservice.selectJoin();
		model.addAttribute("list",list);
		model.addAttribute("map",map);
		return "admin/operator";
		
	}

	@RequestMapping(value="/operatorInsert.do",method=RequestMethod.GET)
	public String insertBn(Model model ){
		List<CategoryVO> list = categoryservice.selectAll();
		model.addAttribute("list",list);
		return "admin/operatorInsert";
	}

	@RequestMapping(value="/operatorInsert.do",method=RequestMethod.POST)
	public String upfile_post(HttpServletRequest request ,@ModelAttribute OperAtorVO vo,Model model){
		logger.info("upfile =={}",vo);
		UpfileVO upfilevo = upFileservice.fileUpload(request,UpfileService.UP_FILE);
		vo.setfNo(upfilevo.getfNo());
		int cnt = operAtorservice.insertOperAtor(vo);
		String msg="";
		int result = 0;
		if(cnt>0){
			msg="등록성공 !";
			result = 1;
		}else{
			msg="등록실패 !";
		}

		model.addAttribute("result",result);
		model.addAttribute("msg",msg);

		return "admin/operatorInsert";

	}




	@RequestMapping(value="/opmain.do", method=RequestMethod.GET)

	public String main_get(Model model , HttpSession session){
		logger.info("operator_get");
		String userid = (String)session.getAttribute("userid");
		if((userid !=null && !userid.isEmpty())){
			if(!userid.equals("admin")){
				model.addAttribute("msg","잘못된 url입니다.");
				model.addAttribute("url","/index2.do");
				return "common/message";
			}
		}else if(userid==null || userid.isEmpty()){
			model.addAttribute("msg","잘못된 url입니다.");
			model.addAttribute("url","/index2.do");
			return "common/message";
		}
		List<Map<String,Object>> map = operAtorservice.selectJoin();

		model.addAttribute("map",map);

		return "admin/operator";

	}

	@RequestMapping("/delBn.do")
	public String dleupdate(@RequestParam int no, HttpServletRequest request, Model model){
		logger.info("삭제 처리를 위한 update작업 int no = {}",no);
		OperAtorVO opvo = operAtorservice.selectByNo(no);
		logger.info("operator select 결과 fno ={}",opvo.getfNo());
		int fileNo = opvo.getfNo();
		UpfileVO fvo = upFileservice.selectByFno(fileNo);
		String oldFileName=fvo.getfFilename();
		logger.info("old파일 네임 = {}",oldFileName);

		//=> [2] 기존 파일이 있다면 삭제
		if(oldFileName!=null && !oldFileName.isEmpty()){
			String upPath = upFileservice.getUploadPath(request,"File");
			File oldFile = new File(upPath, oldFileName);
			if(oldFile.exists()){
				boolean bool =oldFile.delete();
				logger.info("기존 파일 삭제 여부:{}", bool);
			}
		}
		int result = operAtorservice.delupdate(no);
		upFileservice.deleteByFno(fileNo);

		String msg = "",url="/admin/opmain.do";
		if(result >0){
			msg = "삭제 완료했습니다.";
		}else{
			msg="삭제 실패";
		}

		model.addAttribute("msg",msg);
		model.addAttribute("url",url);

		return "common/message";

	}

	@RequestMapping(value="/editBn.do",method=RequestMethod.GET)
	public String edit_get(@RequestParam int no,Model model){
		logger.info("edit get 방식 - no = {}",no);
		Map<String, Object> map = operAtorservice.opjoinSelectByOpno(no);
		logger.info("select 후");
		List<CategoryVO> list = categoryservice.selectAll();

		model.addAttribute("list",list);
		model.addAttribute("map",map);

		return "admin/operatorEdit";


	}


	@RequestMapping(value="/editBn.do",method=RequestMethod.POST)
	public String edit_get(HttpServletRequest request ,@ModelAttribute OperAtorVO vo,Model model){
		UpfileVO upvo
		= upFileservice.fileUpload(request,UpfileService.UP_FILE);
		OperAtorVO opvo = operAtorservice.selectByNo(vo.getOpNo());
		UpfileVO oldupvo = upFileservice.selectByFno(opvo.getfNo());
		String msg = "";
		int result = 0;
		int cnt = 0;
		if(upvo!=null){
			String oldFileName=oldupvo.getfFilename();
			vo.setfNo(upvo.getfNo());
			logger.info("old파일 네임 = {}",oldFileName);
			//=> [2] 기존 파일이 있다면 삭제
			if(oldFileName!=null && !oldFileName.isEmpty()){
				String upPath = upFileservice.getUploadPath(request,"File");
				File oldFile = new File(upPath, oldFileName);
				if(oldFile.exists()){
					boolean bool =oldFile.delete();
					logger.info("기존 파일 삭제 여부:{}", bool);
					vo.setfNo(upvo.getfNo());
					cnt = operAtorservice.insertOperAtor(vo);
					upFileservice.deleteByFno(oldupvo.getfNo());
				}
			}

		}else{
			vo.setfNo(oldupvo.getfNo());
			cnt = operAtorservice.insertOperAtor(vo);
		}


		if(cnt>0){
			msg="수정에 성공하였습니다.";
			result=1;
		}else{
			msg ="수정에 실패하였습니다.";
		}

		model.addAttribute("msg",msg);
		model.addAttribute("result",result);

		return "admin/operatorEdit";

	}

	@RequestMapping("/operatorMember.do")
	public String operatorMember_get(@ModelAttribute SearchVO searchVo, Model model,HttpSession session){
		String userid = (String)session.getAttribute("userid");
		if((userid !=null && !userid.isEmpty())){
			if(!userid.equals("admin")){
				model.addAttribute("msg","잘못된 url입니다.");
				model.addAttribute("url","/index2.do");
				return "common/message";
			}
		}else if(userid==null || userid.isEmpty()){
			model.addAttribute("msg","잘못된 url입니다.");
			model.addAttribute("url","/index2.do");
			return "common/message";
		}
		logger.info("member 화면 보여주기 ,파라미터 searchVO={}",searchVo);
		//[1] PaginationInfo 객체 생성 
		//=> firstRecordIndex 를 계산하기 위함
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(Utility.RECORDCOUNT_PERPAGE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());

		//[2] SearchVO 값 셋팅
		searchVo.setRecordCountPerPage(Utility.RECORDCOUNT_PERPAGE);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());


		List<Map<String, Object>> alist = memberService.MemberSelectPG(searchVo);
		logger.info("회원조회결과  alist.size()={}",alist.size());

		int totalRecord =memberService.MemberSeletCount(searchVo);
		logger.info("회원 목록 조회-전체레코드 개수조회 결과, totalRecord={}",			
				totalRecord);

		pagingInfo.setTotalRecord(totalRecord);


		model.addAttribute("alist",alist);
		model.addAttribute("pagingInfo", pagingInfo);




		return "/admin/operatorMember";
	}


	@RequestMapping("/excel.do")
	public ModelAndView excel(@ModelAttribute SearchVO vo,@RequestParam String type, HttpServletRequest request){
		//ExcelUtil excel = new ExcelUtil();

		logger.info("excel 다운로드 vo={}, type{}",vo,type);
		System.out.println("type ="+type);
		String fileName = excelUtil.excelWrith(vo,type);
		String upPath = upFileservice.getUploadPath(request, UpfileService.UP_EXCEL);
		File file = new File(upPath,fileName);
		Map<String,Object> fileMap = new HashMap<String, Object>();
		fileMap.put("downFile", file);
		/*ModelAndView mav = new ModelAndView(String viewName,map model);*/

		ModelAndView mav = new ModelAndView("excelDownView",fileMap);
		return mav;
	}

	@RequestMapping("/memberSaveForm.do")
	public ModelAndView saveForm(HttpServletRequest request){		
		logger.info("Excel 폼 다운로드");
		String fileName="member저장서식(기본).xls"; 
		String upPath = upFileservice.getUploadPath(request, UpfileService.UP_EXCELSAVEFORM);
		File file = new File(upPath,fileName);
		System.out.println("file name =" + file.getName()+"**************************");
		Map<String,Object> fileMap = new HashMap<String, Object>();
		fileMap.put("downFile",file);

		ModelAndView mav = new ModelAndView("excelDownView",fileMap);
		return mav;


	}


	

	@RequestMapping("/excelup.do")
	public String excelup(HttpServletRequest request,Model model){
		logger.info("엑셀파일 읽어오기");
		UpfileVO upfilevo= upFileservice.fileUpload(request, UpfileService.UP_EXCEL);
		logger.info("업로드된 excel파일 네임 = {}",upfilevo.getfFilename());
		logger.info("vo정보 = {}",upfilevo.toString());
		String upPath = upFileservice.getUploadPath(request,UpfileService.UP_EXCEL);
		File file = new File(upPath,upfilevo.getfOriginalfilename());
		List<MemberVO> mlist = null;
		mlist = upFileservice.readExcel(file);
		System.out.println(mlist.size() +"-"+ mlist.get(0).getkNo1() +"-"+mlist.get(0).getkNo2()+"-"+mlist.get(0).getkNo3() );

		String msg="", url ="/admin/operatorMember.do";
		int cnt =0;
		for(int i =0; i<mlist.size(); i++){
			MemberVO vo = mlist.get(i);
			if(vo.getmUserid()!=null && !vo.getmUserid().isEmpty()){
				vo.setMgNo2(2);
				logger.info(vo.toString());
				cnt +=  memberService.memberInsert(vo);
			}
		}

		if(cnt>0){

			boolean bool= file.exists();
			logger.info("파일 존재 여부 bool ={}, {}",bool,file.getName());
			bool = file.delete();
			logger.info("파일 삭제 여부 bool ={},",bool);
			msg="회원 저장 완료 건수 ="+cnt;
		}else{
			file.exists();
			msg="회원 저장 실패";
		}


		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		return	"common/message";
	}

	@RequestMapping("/noticeBoard.do")
	public String noticeBoard_get(@ModelAttribute SearchVO searchVo, Model model,HttpSession session){
		String userid = (String)session.getAttribute("userid");
		if((userid !=null && !userid.isEmpty())){
			if(!userid.equals("admin")){
				model.addAttribute("msg","잘못된 url입니다.");
				model.addAttribute("url","/index2.do");
				return "common/message";
			}
		}else if(userid==null || userid.isEmpty()){
			model.addAttribute("msg","잘못된 url입니다.");
			model.addAttribute("url","/index2.do");
			return "common/message";
		}
		logger.info("notice 화면 보여주기 ,파라미터 searchVO={}",searchVo);
		//[1] PaginationInfo 객체 생성 
		//=> firstRecordIndex 를 계산하기 위함
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(Utility.RECORDCOUNT_PERPAGE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());

		//[2] SearchVO 값 셋팅
		searchVo.setRecordCountPerPage(Utility.RECORDCOUNT_PERPAGE);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());


		List<Map<String, Object>> alist = noticeService.operatorNotice(searchVo);

		logger.info("공지사항  alist.size()={}",alist.size());

		int totalRecord =noticeService.selectTotalRecord(searchVo);
		logger.info("공지사항-전체레코드 개수조회 결과, totalRecord={}",			
				totalRecord);

		pagingInfo.setTotalRecord(totalRecord);


		model.addAttribute("alist",alist);
		model.addAttribute("pagingInfo", pagingInfo);

		return "admin/noticeBoardList";
	}
	
	@RequestMapping(value="/useBoard.do")
	public String Useboardlist(@ModelAttribute UseboardVO vo , Model model){
		/*logger.info("Useboardlist화면목록 ");*/
		logger.info("Useboardlist화면목록  vo={},  type={}", vo,vo.getUbType());
		
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(Utility.RECORDCOUNT_PERPAGE);
		pagingInfo.setCurrentPage(vo.getCurrentPage());	
		
		vo.setRecordCountPerPage(Utility.RECORDCOUNT_PERPAGE);
		vo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		List<UseboardVO> uList = useboardService.selectUseboard(vo);
		logger.info("조회 결과 uList.size()={}", uList.size());
		logger.info("조회 결과 uList={}", uList);
		
		int totalRecord =useboardService.selectTotalRecord(vo);
		logger.info("조회 전체레코드 개수조회 결과, totalRecord={}",
				totalRecord);
		
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("uList",uList);
		model.addAttribute("pagingInfo",pagingInfo);
		
		return "admin/useBoardList";
	}

	@RequestMapping("/operatorHost.do")
	public String operatorHost_get(@ModelAttribute SearchVO searchVo, Model model,HttpSession session){
		String userid = (String)session.getAttribute("userid");
		if((userid !=null && !userid.isEmpty())){
			if(!userid.equals("admin")){
				model.addAttribute("msg","잘못된 url입니다.");
				model.addAttribute("url","/index2.do");
				return "common/message";
			}
		}else if(userid==null || userid.isEmpty()){
			model.addAttribute("msg","잘못된 url입니다.");
			model.addAttribute("url","/index2.do");
			return "common/message";
		}
		logger.info("host 화면 보여주기 ,파라미터 searchVO={}",searchVo);
		//[1] PaginationInfo 객체 생성 
		//=> firstRecordIndex 를 계산하기 위함
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(Utility.RECORDCOUNT_PERPAGE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());

		//[2] SearchVO 값 셋팅
		searchVo.setRecordCountPerPage(Utility.RECORDCOUNT_PERPAGE);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());


		List<Map<String, Object>> alist = memberService.HostSelectPG(searchVo);
		logger.info("호스트조회결과  alist.size()={}",alist.size());

		int totalRecord =memberService.HostSeletCount(searchVo);
		logger.info("호스트 목록 조회-전체레코드 개수조회 결과, totalRecord={}",			
				totalRecord);

		pagingInfo.setTotalRecord(totalRecord);


		model.addAttribute("alist",alist);
		model.addAttribute("pagingInfo", pagingInfo);


		return "admin/operatorHost";
	}

	@RequestMapping("/excelupHost.do")
	public String excelupHost(HttpServletRequest request,Model model){
		logger.info("엑셀파일 읽어오기");
		UpfileVO upfilevo= upFileservice.fileUpload(request, UpfileService.UP_EXCEL);
		logger.info("업로드된 excel파일 네임 = {}",upfilevo.getfFilename());
		String upPath = upFileservice.getUploadPath(request,UpfileService.UP_EXCEL);
		File file = new File(upPath,upfilevo.getfOriginalfilename());
		List<MemberVO> mlist = null;
		mlist = upFileservice.readExcelHost(file);

		String msg="", url ="/admin/operatorHost.do";
		int cnt =0;
		for(int i =0; i<mlist.size(); i++){
			MemberVO vo = mlist.get(i);
			if(vo.getmUserid()!=null && !vo.getmUserid().isEmpty()){
				vo.setMgNo2(3);
				logger.info(vo.toString());
				cnt +=  memberService.hostInsert(vo);
			}
		}

		if(cnt>0){

			boolean bool= file.exists();
			logger.info("파일 존재 여부 bool ={}, {}",bool,file.getName());
			bool = file.delete();
			logger.info("파일 삭제 여부 bool ={},",bool);
			msg="회원 저장 완료 건수 ="+cnt;
		}else{
			file.exists();
			msg="회원 저장 실패";
		}


		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		return	"common/message";
	}


	@RequestMapping("/hostForm.do")
	public ModelAndView hostform(HttpServletRequest request){		
		logger.info("Excel host 폼 다운로드");
		String fileName="host저장서식(기본).xls"; 
		String upPath = upFileservice.getUploadPath(request, UpfileService.UP_EXCELSAVEFORM);
		File file = new File(upPath,fileName);
		System.out.println("file name =" + file.getName()+"**************************");
		Map<String,Object> fileMap = new HashMap<String, Object>();
		fileMap.put("downFile",file);

		ModelAndView mav = new ModelAndView("excelDownView",fileMap);
		return mav;


	}

	@RequestMapping("/operatorBadClass.do")
	public String opBadClass(@ModelAttribute SearchVO searchVo, Model model, HttpSession session){
		String userid = (String)session.getAttribute("userid");
		if((userid !=null && !userid.isEmpty())){
			if(!userid.equals("admin")){
				model.addAttribute("msg","잘못된 url입니다.");
				model.addAttribute("url","/index2.do");
				return "common/message";
			}
		}else if(userid==null || userid.isEmpty()){
			model.addAttribute("msg","잘못된 url입니다.");
			model.addAttribute("url","/index2.do");
			return "common/message";
		}

		logger.info("BadClass 화면 보여주기 ,파라미터 searchVO={}",searchVo);
		//[1] PaginationInfo 객체 생성 
		//=> firstRecordIndex 를 계산하기 위함
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(Utility.RECORDCOUNT_PERPAGE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());

		//[2] SearchVO 값 셋팅
		searchVo.setRecordCountPerPage(Utility.RECORDCOUNT_PERPAGE);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());

		List<Map<String, Object>> alist = classService.badClassView(searchVo); 

		logger.info("신고클래스  alist.size()={}",alist.size());

		int totalRecord = classService.badClassCount(searchVo);
		logger.info("신고 클래스 갯수, totalRecord={}",			
				totalRecord);

		pagingInfo.setTotalRecord(totalRecord);


		model.addAttribute("alist",alist);
		model.addAttribute("pagingInfo", pagingInfo);



		return "admin/operatorBadClass";
	}


	@RequestMapping("/editBadclass.do")
	public String delBadclass(@RequestParam int cNo , @RequestParam String type ,Model model){
		int result = classService.editBadClass(cNo, type);

		String msg = "", url="/admin/operatorBadClass.do";
		if(result>0){
			msg= "선택하신 신고클래스 삭제 완료 되었습니다.";
		}else{
			msg="선택하신 신고클래스 삭제 실패 되었습니다.";
		}

		model.addAttribute("msg",msg);
		model.addAttribute("url",url);

		return "common/message";
	}

	@RequestMapping("/badClassDetail.do")
	public String badDetail(@RequestParam int cno,Model model){
		logger.info("detail");
		Map<String, Object> map = classService.selectBadClassByCno(cno);

		model.addAttribute("map",map);
		return "admin/badClassDetail";
	}
	
	@RequestMapping("/payment.do")
	public String payment(@ModelAttribute SearchVO searchVo,Model model, HttpSession session){
		String userid = (String)session.getAttribute("userid");
		if((userid !=null && !userid.isEmpty())){
			if(!userid.equals("admin")){
				model.addAttribute("msg","잘못된 url입니다.");
				model.addAttribute("url","/index2.do");
				return "common/message";
			}
		}else if(userid==null || userid.isEmpty()){
			model.addAttribute("msg","잘못된 url입니다.");
			model.addAttribute("url","/index2.do");
			return "common/message";
		}
		logger.info("결재 내역 보여주기 SearchVO ={}",searchVo);
		
		//[1] PaginationInfo 객체 생성 
				//=> firstRecordIndex 를 계산하기 위함
				PaginationInfo pagingInfo = new PaginationInfo();
				pagingInfo.setBlockSize(Utility.BLOCKSIZE);
				pagingInfo.setRecordCountPerPage(Utility.RECORDCOUNT_PERPAGE);
				pagingInfo.setCurrentPage(searchVo.getCurrentPage());

				//[2] SearchVO 값 셋팅
				searchVo.setRecordCountPerPage(Utility.RECORDCOUNT_PERPAGE);
				searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());

				List<Map<String, Object>> alist = paymentService.selectPaymentView(searchVo);
				logger.info("결재내역  alist.size()={}",alist.size());

				int totalRecord = paymentService.selectPaymentViewCount(searchVo);
				logger.info("결재내역 갯수, totalRecord={}",			
						totalRecord);

				pagingInfo.setTotalRecord(totalRecord);


				model.addAttribute("alist",alist);
				model.addAttribute("pagingInfo", pagingInfo);



				return "admin/payment";
	}
	
	@RequestMapping("/paymentcancel.do")
	public String paymentcancel(@ModelAttribute SearchVO searchVo,@RequestParam(value="pmNo",required=false, defaultValue="0") int pmNo, Model model,HttpSession session){
		String userid = (String)session.getAttribute("userid");
		if((userid !=null && !userid.isEmpty())){
			if(!userid.equals("admin")){
				model.addAttribute("msg","잘못된 url입니다.");
				model.addAttribute("url","/index2.do");
				return "common/message";
			}
		}else if(userid==null || userid.isEmpty()){
			model.addAttribute("msg","잘못된 url입니다.");
			model.addAttribute("url","/index2.do");
			return "common/message";
		}
		logger.info("결재 취소 내역 보여주기 SearchVO ={}",searchVo);
		logger.info("결재 취소 내역 pmNo={}",pmNo);
		//[1] PaginationInfo 객체 생성 
				//=> firstRecordIndex 를 계산하기 위함
				PaginationInfo pagingInfo = new PaginationInfo();
				pagingInfo.setBlockSize(Utility.BLOCKSIZE);
				pagingInfo.setRecordCountPerPage(Utility.RECORDCOUNT_PERPAGE);
				pagingInfo.setCurrentPage(searchVo.getCurrentPage());

				//[2] SearchVO 값 셋팅
				searchVo.setRecordCountPerPage(Utility.RECORDCOUNT_PERPAGE);
				searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
				
				if(pmNo!=0){
					searchVo.setSearchKeyword(pmNo+"");
					searchVo.setSearchCondition("PM_NO");
				}
				
				List<Map<String, Object>> alist = paymentService.selectPaymentCancelView(searchVo);
				logger.info("결재취소내역  alist.size()={}",alist.size());

				int totalRecord = paymentService.selectPaymentCancelViewCount(searchVo);
				logger.info("결재취소내역 갯수, totalRecord={}",			
						totalRecord);

				pagingInfo.setTotalRecord(totalRecord);


				model.addAttribute("alist",alist);
				model.addAttribute("pagingInfo", pagingInfo);



				return "admin/paymentcancel";
	}
	
	@RequestMapping("/memberDetail.do")
	public String memberDetail(@RequestParam String mUserid,Model model){
		
		logger.info("멤버 디테일 userid = {}",mUserid);
		MemberVO memberVo = memberService.selectByUserid(mUserid);
		
		model.addAttribute("memberVo",memberVo);
		
		return "admin/memberDetail";
	}
	
	
	@RequestMapping(value="/memberDelPage.do", method=RequestMethod.GET)
	public String memberDel_get(@RequestParam String mUserid,Model model){
		logger.info("삭제 파라미터 mUserid = {}",mUserid);
		model.addAttribute("mUserid",mUserid);
		return "admin/memberDelPage";
	}
	
	
	@RequestMapping(value="/memberDelPage.do", method=RequestMethod.POST)
	public String memberDel_post(@ModelAttribute MemberVO memberVo, Model model){
		logger.info("member삭제 파라미터 memberVo ={}",memberVo);
		int cnt = memberService.memberOut(memberVo);
		String msg="",url="/admin/operatorMember.do";
		if(cnt>0){
			msg="삭제처리 완료 되었습니다.";
		}else{
			msg="삭제처리에 실패했습니다.";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";

	}
	
	@RequestMapping(value="/memberEdit.do" ,method=RequestMethod.GET)
		public String memberEdit_get(@RequestParam String mUserid , Model model){
		logger.info("멤버 디테일 userid = {}",mUserid);
		MemberVO memberVo = memberService.selectByUserid(mUserid);
		
		model.addAttribute("memberVo",memberVo);
		
		return "admin/memberEdit";
	}
	
	
	
	@RequestMapping(value="/memberEdit.do" ,method=RequestMethod.POST)
	public String memberEdit_get(@ModelAttribute MemberVO memberVo , Model model){
	logger.info("멤버 edit vo = {}, id={}",memberVo,memberVo.getmUserid());
	if(memberVo.getmEmail1()==null||memberVo.getmEmail1().isEmpty()||memberVo.getmEmail2()==null||memberVo.getmEmail2().isEmpty()){
		memberVo.setmEmail1("");
		memberVo.setmEmail2("");
	}
	
	
	int cnt = memberService.operatorMemberUpdate(memberVo);

	String msg="",url="/admin/memberDetail.do?mUserid="+memberVo.getmUserid();
	
	if(cnt>0){
		msg="회원정보 수정 완료";
	}else{
		msg="회원정보 수정 실패";
	}
	
	model.addAttribute("msg",msg);
	model.addAttribute("url",url);
	return "common/message";
	}
	
	@RequestMapping("/hostDetail.do")
	public String hostDetail(@RequestParam String mUserid,Model model){
		
		logger.info("호스트 디테일 userid = {}",mUserid);
		MemberVO memberVo = memberService.selectByUserid(mUserid);
		
		model.addAttribute("memberVo",memberVo);
		
		return "admin/hostDetail";
	}
	
	@RequestMapping(value="/hostEdit.do" ,method=RequestMethod.GET)
	public String hostEdit_get(@RequestParam String mUserid , Model model){
	logger.info("호스트 디테일 userid = {}",mUserid);
	MemberVO memberVo = memberService.selectByUserid(mUserid);
	
	model.addAttribute("memberVo",memberVo);
	
	return "admin/hostEdit";
	}
	
	@RequestMapping(value="/hostEdit.do" ,method=RequestMethod.POST)
	public String hostEdit_get(@ModelAttribute MemberVO memberVo , Model model){
	logger.info("멤버 edit vo = {}, id={}",memberVo,memberVo.getmUserid());
	if(memberVo.getmEmail1()==null||memberVo.getmEmail1().isEmpty()||memberVo.getmEmail2()==null||memberVo.getmEmail2().isEmpty()){
		memberVo.setmEmail1("");
		memberVo.setmEmail2("");
	}
	
	
	int cnt = memberService.operatorHostUpdate(memberVo);

	String msg="",url="/admin/hostDetail.do?mUserid="+memberVo.getmUserid();
	
	if(cnt>0){
		msg="회원정보 수정 완료";
	}else{
		msg="회원정보 수정 실패";
	}
	
	model.addAttribute("msg",msg);
	model.addAttribute("url",url);
	return "common/message";
	}
	
}






