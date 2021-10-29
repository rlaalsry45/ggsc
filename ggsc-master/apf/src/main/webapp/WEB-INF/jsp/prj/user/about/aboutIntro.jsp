<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
    
     <section id="page-breadcrumb">
        <div class="vertical-center sun">
             <div class="container">
                <div class="row">
                    <div class="action">
                        <div class="col-sm-12">
                            <h1 class="title">센터소개</h1>
                            <p>고령자미래설계지원센터를 소개합니다.</p>
                        </div>
                     </div>
                </div>
            </div>
        </div>
    </section>
    <!--/#page-breadcrumb-->

    <section id="" class="padding">
        <div class="container">
            <div class="row">
                 <div class="col-sm-12 txtjf">
                    <p>고령자미래설계지원센터는 한국후견협회 내의 부설기관으로서 고령자들이 신체기능이 저하하거나 판단능력이 저하할 때에도 본인이 원하는대로 생활을 계속할 수 있는 법적장치를 마련하는 법적 설계를 지원하는 센터입니다.</p>
					<p>고령자미래설계지원센터는 생명보험사회공헌위원회와 교보생명의 후원으로 「미리 준비하는 즐거운 노후」사업을 진행하고 있습니다. 「미리 준비하는 즐거운 노후」사업은 신체적, 정신적으로 매우 쇠약해지는 시점에서도 자신이 원하는 방식과 내용대로 생활할 수 있도록 보장할 수 있게끔 법적인 장치를 마련해 주고 있습니다. 미리 일상생활, 요양, 치료 등에 관하여 자신을 대신하여 의사결정을 해 줄 대리인을 정해 두는 것, 노후의 삶을 안정적으로 살아 갈 수 있게 자신의 재산 중 일정 부분을 안전하게 신탁해 두는 것이 미래를 위한 법적 설계의 핵심입니다. 미리 정한 대리인, 신탁 등은 모두 미래를 대비한 법적 설계이기 때문에 다양한 안전장치가 필요합니다. 한국후견협회 소속의 유능한 법률전문가들이 법적 설계를 직접 지원하기 때문에 미래설계가 안전하고, 잘 작동할 수 있도록 보장해 줄 수 있을 것입니다. 이 사업을 통해 후견협회는 예방하는 문화, 미리 준비하는 문화를 확산시키는 데 기여하고자 합니다. </p>
                </div>
				<div class="col-sm-12 mgT15 txtjf">
                    <p>
					미래를 미리 준비하지 못한 분들 중 신체적으로 쇠약해지고 판단능력이 떨어지면 가정법원에 신청해서 후견인을 선임해서 필요한 지원을 받을 수 있습니다. 후견협회는 후견과 관련된 지원도 합니다. 자신이 미리 법적으로 노후를 준비해 둔다면, 가정법원에 신청해서 후견인을 선임할 필요는 그만큼 줄어들기 때문에 법원이라는 사회적 자원을 효율적으로 활용하는 것에도 기여할 수 있을 것입니다. 
					이용방법은 고령자 당사자, 가족, 친족, 기타 긴밀한 관계에 있는 사람, 고령자가 입원한 병원, 지방자치단체의장이 유선 또는 이메일로 신청할 수 있습니다. 접수 후에는 고령자 당사자와 가족을 대상으로 미래설계 상담을 진행하고 고령자의 의사와 선호도가 반영될 수 있도록 적극 지원할 예정입니다. </p>
                </div>
				<div class="col-sm-12 wow fadeInDown mgT20" data-wow-duration="1000ms" data-wow-delay="0ms">
                    <p><strong>서울특별시 성동구 왕십리로 222, 305호(한양대학교 HIT)</strong></p>
                    <ul class="elements">
                        <li class="wow fadeInUp" data-wow-duration="900ms" data-wow-delay="100ms"><i class="fa fa-angle-right"></i> E-mail : koreanguardianhip@gmail.com</li>
                        <li class="wow fadeInUp" data-wow-duration="800ms" data-wow-delay="200ms"><i class="fa fa-angle-right"></i> Phone : 02-2220-4279</li>
                    </ul>
                </div>
            </div>
        </div>
    </section>
	<!--/#services-->
	
	
    <!--/#action-->
    <script type="text/javaScript" language="javascript" defer="defer">
        <!--
        /* 글 수정 화면 function */
        function fn_egov_select(id) {
        	document.listForm.selectedId.value = id;
           	document.listForm.action = "<c:url value='/updateSampleView.do'/>";
           	document.listForm.submit();
        }
        
        /* 글 등록 화면 function */
        function fn_egov_addView() {
           	document.listForm.action = "<c:url value='/addSample.do'/>";
           	document.listForm.submit();
        }
        
        /* 글 목록 화면 function */
        function fn_egov_selectList() {
        	document.listForm.action = "<c:url value='/egovSampleList.do'/>";
           	document.listForm.submit();
        }
        
        /* pagination 페이지 링크 function */
        function fn_egov_link_page(pageNo){
        	document.listForm.pageIndex.value = pageNo;
        	document.listForm.action = "<c:url value='/egovSampleList.do'/>";
           	document.listForm.submit();
        }
        
        //-->
    </script>

    