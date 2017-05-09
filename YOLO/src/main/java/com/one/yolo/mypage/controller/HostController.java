package com.one.yolo.mypage.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.one.yolo.crecla.model.ClassService;
import com.one.yolo.crecla.model.ClassVO;
import com.one.yolo.crecla.model.ScheduleVO;

@Controller
@RequestMapping("/mypage/MyClass")
public class HostController {
	public static final Logger logger=LoggerFactory.getLogger(HostController.class);
	@Autowired
	public ClassService claService;
	@RequestMapping("/claSel.do")
	@ResponseBody
	public ClassVO claSel(HttpServletResponse resp, @RequestParam int cNo, Model model){
		
		logger.info("호스트 클래스 cno={}",cNo);
		ClassVO claVo=claService.selClass(cNo);
		logger.info("selcla={}",claVo);
		
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
		String sday=sdf2.format(sDay);
		Calendar c1 = Calendar.getInstance();
		Calendar c2 = Calendar.getInstance();
		//Calendar 타입으로 변경 add()메소드로 1일씩 추가해 주기위해 변경
		c1.setTime( sDay );
		c2.setTime( eDay );
		
		List<Date> dayList=new ArrayList<Date>();
		//시작날짜와 끝 날짜를 비교해, 시작날짜가 작거나 같은 경우 출력
		while( c1.compareTo( c2 ) !=1 ){
			dayList.add(c1.getTime());
			//시작날짜 + 1 일
			c1.add(Calendar.DATE, 1);			
		}
		
		String week=schVo.getScWeek();
		String[] weeks=week.split(",");
		List<String> daysList=new ArrayList<String>();
		for(Date c:dayList){
			String day=sdf2.format(c);
			String[] days=day.split("/");
			for(int i=0;i<weeks.length;i++){
				if(days[1].equals(weeks[i])){
					daysList.add(day);
				}
			}
		}
		logger.info("최종 daylist={}",daysList.size());
		model.addAttribute("sch", schVo);
		model.addAttribute("dayslist", daysList);
		
		return claVo;
	}
}
