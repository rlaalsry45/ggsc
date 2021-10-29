package utility;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.scheduling.quartz.QuartzJobBean;

/**
 *스케쥴 Job 실행 클래스
 */
public class CloudJobExecutor extends QuartzJobBean {

	@Override
	protected void executeInternal(JobExecutionContext arg0) throws JobExecutionException {
		// TODO Auto-generated method stub
		// 실제 수행할 로직..
		System.out.println("배치 test 로직 실행 여부 확인 @@@@@@@@@@@@@@@@@@@@@@@@@@@@");
	}

}