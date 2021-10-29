package utility;

import org.quartz.JobExecutionContext;

import ggsc.support.web.Batch;

public class doExceute extends Batch{

	@Override
	protected void doExecute(JobExecutionContext context) {
		// excute();
	}

	public String excute() {
		System.out.println("executeExcel.do 실행 ");
		return "redirect:/gnoincoundb/executeExcel.do";
	}
}
