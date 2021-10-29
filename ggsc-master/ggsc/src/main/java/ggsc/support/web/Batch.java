package ggsc.support.web;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.quartz.DisallowConcurrentExecution;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;


@DisallowConcurrentExecution
public abstract class Batch implements Job{
	
	
	/*@Override
	public void execute(JobExecutionContext context) throws JobExecutionException {
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@ 배치 프로그램 실행 여부 확인 @@@@@@@@@@@@@@@@@@@@@");
		// 배치 통계 DB 입력
		//resultStatsService.insertTotalResultReportList();
		try {
			smsExcelSample();
			// 배치 통계 DB 입력
			// resultStatsService.insertTotalResultReportList();
		} catch (NumberFormatException e) {
			System.out.println("배치 통계 DB 등록 구간. @@@@@@@@@@@@@");
		}
    }
	
	public void smsExcelSample() {
		System.out.println("###########배치 프로그램 쿼리 실행 #############");
	
			System.out.println("smsExcelSample 함수 실행 @@@@@@@@@@@@@@@@@@@@");
			// 배치 통계 DB 입력
			//resultStatsDAO.insertTotalResultReportList();

	}*/
	
	@Override
	public void execute(JobExecutionContext context) throws JobExecutionException {
		try {
			System.out.println("@@@@@@@@@@@@@@@@@@@@@@@ 배치 프로그램 실행 여부 확인 @@@@@@@@@@@@@@@@@@@@@");
			// resultStatsDAO.insertTotalResultReportList();
			doExecute(context);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
    }
	
	protected abstract void doExecute(JobExecutionContext context);
	
	public void executeFunc() {
		try {
			System.out.println("executeFnc");
		} catch (Exception e) {
			e.printStackTrace();
		}
		// return "redirect:/gnoincoundb/executeExcel.do";
	}
}
