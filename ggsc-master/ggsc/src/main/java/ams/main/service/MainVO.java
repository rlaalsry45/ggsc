package ams.main.service;

import java.io.Serializable;

/**
 * 템플릿 메인화면 작업 List 항목 VO(Sample 소스)
 * @author 실행환경 개발팀 JJY
 * @since 2011.08.31
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *   
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2011.08.31  JJY            최초 생성
 *
 * </pre>
 */
public class MainVO implements Serializable {

	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = -2202175699511921484L;
	
	private String pbCd;
	private int relCnt;
	private int relTot;
	private String itemNm;
	private String itemRate;
	private int cdCnt;

	
	public int getRelCnt() {
		return relCnt;
	}

	public void setRelCnt(int relCnt) {
		this.relCnt = relCnt;
	}

	public int getRelTot() {
		return relTot;
	}

	public void setRelTot(int relTot) {
		this.relTot = relTot;
	}

	public String getItemNm() {
		return itemNm;
	}

	public void setItemNm(String itemNm) {
		this.itemNm = itemNm;
	}

	public String getItemRate() {
		return itemRate;
	}

	public void setItemRate(String itemRate) {
		this.itemRate = itemRate;
	}

	public int getCdCnt() {
		return cdCnt;
	}

	public void setCdCnt(int cdCnt) {
		this.cdCnt = cdCnt;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getPbCd() {
		return pbCd;
	}

	public void setPbCd(String pbCd) {
		this.pbCd = pbCd;
	}


}