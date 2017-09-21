<%@ page contentType="text/html; charset=UTF-8" %> 
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px;
  text-align: center; 
}
</style> 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample6_address').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('sample6_address2').focus();
            }
        }).open();
    }
</script>
<script type = "text/javascript">
function inputCheck(f){
	if(f.id.value==""){
		alert("아이디를 입력하세요 ^오^");
		f.id.focus();
		return false;
	}
	if(f.passwd.value==""){
		alert("비밀번호를 입력하세요 ^오^");
		f.passwd.focus();
		return false;
	}
	if(f.repasswd.value==""){
		alert("비밀번호를 확인하세요 ^오^");
		f.repasswd.focus();
		return false;
	}
	if(f.passwd.value!=f.repasswd.value){
		alert("비밀번호가 일치하지 않습니다. 다시 입력하세요.");
		f.repasswd.value="";
		f.repasswd.focus();
		return false;
	}
	if(f.mname.value==""){
		alert("이름을 입력하세요.");
		f.mname.focus();
		return false;
	}
	if(f.email.value==""){
		alert("e-mail을 입력하세요.");
		f.email.focus();
		return false;
	}
	if(f.job.selectedIndex==0){
		alert("직업을 선택하세요.");
		f.job.focus();
		return false;
	}
}

function idCheck(id){
	if(id==""){
		alert("아이디를 입력하세요");
		document.frm.id.focus();
	}else{
		var url = "id_Proc.jsp"
		url += "?id="+id;
		
		wr=window.open(url,"아이디검색","width=550,height=500");
		wr.moveTo((window.screen.width-550)/2,(window.screen.height-500)/2);
	}
}
	function emailCheck(email){
		if(email==""){
			alert("email을 입력하세요");
			document.frm.email.focus();
		}else{
			var url = "email_Proc.jsp"
			url += "?email="+email;
			
			wr=window.open(url,"email검색","width=550,height=500");
			wr.moveTo((window.screen.width-550)/2,(window.screen.height-500)/2);
		}	

}
</script>

</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">회원가입</DIV>
 
<FORM name='frm' 
	  method='POST' 
	  enctype="multipart/form-data"
	  action='./prcreateProc.jsp'
	  onsubmit = "return inputCheck(this)">
  <TABLE class="table table-hover">
    <TR>
      <TH>사진</TH>
      <TD><input type="file" name="fname" accept=".jpg,.png,.gif"></TD>
      <TD>jpg,png,gif 파일만!</TD>
    </TR>
    <TR>
      <TH>*아이디</TH>
      <TD>
      	<input type="text" name="id" size="15">
      	<button type="button" onclick="idCheck(document.frm.id.value)">ID중복확인</button>
      </TD>
      <TD>*는 필수입력.</TD>
    </TR>
    <TR>
      <TH>*비밀번호</TH>
      <TD><input type="password" name="passwd" size="15"></TD>
      <TD>*는 필수입력.</TD>
    </TR>
    <TR>
      <TH>*비밀번호 확인</TH>
      <TD><input type="password" name="repasswd" size="15"></TD>
      <TD>비밀번호를 확인합니다.</TD>
    </TR>
    <TR>
      <TH>*이름</TH>
      <TD><input type="text" name="mname" size="15"></TD>
      <TD>*고객실명을 적어주세요</TD>
    </TR>
    <TR>
      <TH>전화번호</TH>
    	 <TD><input type="text" name="tel" size="15"></TD>
      <TD></TD>
    </TR>
    <TR>
      <TH>*e-mail</TH>
      <TD><input type="text" name="email" size="25">
   	  <button type="button" onclick="emailCheck(document.frm.email.value)">e-mail중복확인</button>
      </TD>
      <td>*는 필수입력.</td>
    </TR>
    <TR>
      <TH>우편번호</TH>
      <TD>
   		 <input type="text" name="zipcode" id="sample6_postcode" size="7" placeholder="우편번호">
   	 	 <button type="button" onclick="sample6_execDaumPostcode()">우편번호찾기</button>
      </TD>
      <td></td>
    </TR>
    <TR>
      <TH>주소</TH>
      <TD>
      	 <input type="text" name="address1" size="40" id="sample6_address"  placeholder="주소"><br>
     	 <input type="text" name="address2" size="40" id="sample6_address2"  placeholder="상세주소">
      </TD>
      <td></td>
    </TR>
    <TR>
      <TH>*직업</TH>
      <TD>
      <select name="job">
      	<option selected>선택하세요</option>
      	<option value = "A01">회사원</option>
      	<option value = "A02">학생</option>
      	<option value = "A03">주부</option>
      	<option value = "A04">갓수</option>
      	<option value = "A05">전산관련직</option>
      	<option value = "A06">연구전문직</option>
      	<option value = "A07">공무원</option>
      	<option value = "A08">의사</option>
      	<option value = "A09">예술가</option>
      	<option value = "A10">법조인</option>
      </select>
      </TD>
      <td>직업을 선택하세요</td>
    </TR>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='회원가입'>
    <input type='reset' value='취소'>
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 