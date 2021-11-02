경기도청 노인상담 프로젝트

구조 
ggsc - 모니터링
apf - 실사용 되어지는 페이지 ( WEB , MOBILE )

현재 유지보수 중 

사용기술 
 
 전자정부 프레임워크 , MariaDB , JSP , JSTL , MyBatis , Tiles DesignFrameWork 
 
 미 사용 되는 레거시 코드가 생각보다 많다 .
 유지보수 특성상 필요하면 다시 활성화를 시켜야 해서 그런 거 같다 

HomePage Package만 주로 사용된다 .
다른 업무들은 거의 사용되지 않고 eGovFrameWork 의 공톰 컴포넌트 들만 주로 이용되는 듯 하다 

전자정부 프레임워크는 국가기반의 FrameWork 이기 때문에 공공기관에서 사용되는 경우가 많다 .
그래서 주로 쓰이는 공통 컴포넌트는 PageNation Class , UI , JS 등등이다 . 

FrameWork 에서도 EgovMap 이라는 전자정부 프레임워크의 컬렉션을 따로 사용한다 .

Ajax 방식은 있으나 거의 사용되는 걸 보긴 힘들고 , 왠만해선 다 모델객체로 처리한다 
JSP 페이지에서 값을 서버로 전달할때는 form 값을 주로 이용하며 VO 랑 매핑을 주로 시켜준다 .

ajax 통신이 없기에 그리드는 거의 없으며 , JSTL 표현식을 쓰는 경우들이 많다 .
즉 , 통신방법이 기본적으로 Model 객체가 주 라는 것 이다 .

보안이 상당히 강하다
Spring Security 를 주로 사용하는 것 같다 , 암호화 복호화도 기본적으로 들어가는 듯 
