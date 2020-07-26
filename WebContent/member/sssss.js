function loginCheck() {
	if (document.logfrm.m_id.value == "") {
		alert("아이디를 입력해 주세요.");
		document.logfrm.m_id.focus();
		return;
	}
	if (document.logfrm.m_pwd.value == "") {
		alert("비밀번호를 입력해 주세요.");
		document.logfrm.m_pwd.focus();
		return;
	}
	document.logfrm.submit();
}

function memberReg() {
	document.location = "member.jsp";
}

function inputCheck() {
	if (document.regForm.m_id.value == "") {
		alert("아이디를 입력해 주세요.");
		document.regForm.m_id.focus();
		return;
	}
	if (document.regForm.m_pwd.value == "") {
		alert("비밀번호를 입력해 주세요.");
		document.regForm.m_pwd.focus();
		return;
	}
	if (document.regForm.repwd.value == "") {
		alert("비밀번호 확인을 입력해주세요");
		document.regForm.repwd.focus();
		return;
	}
	if (document.regForm.m_pwd.value != document.regForm.repwd.value) {
		alert("비밀번호를 동일하게 적어주세요.");
		document.regForm.repwd.focus();
		return;
	}
	if (document.regForm.m_birth.value == "") {
		alert("생년월일를 입력해 주세요.");
		document.regForm.m_birth.focus();
		return;
	}
	if (document.regForm.m_birth.value.length > 10) {
		alert("생년월일이 맞지 않습니다.ㅜㅜ");
		document.regForm.m_birth.focus();
		return;
	}
	if (document.regForm.m_email.value == "") {
		alert("이메일을 입력해주세요^^");
		document.regForm.m_email.focus();
		return;
	}
	var m_latitude;
	var m_longitude;
	function init() {
		window.navigator.geolocation.getCurrentPosition(current_position);
	} 

	function current_position(position) {

		m_latitude = position.coords.latitude;
		m_longitude = position.coords.longitude;

	}
	window.addEventListener("load", init);
	document.regForm.m_latitude.value = m_latitude;
	document.regForm.m_longitude.value = m_longitude;
	document.regForm.submit();
}

function idCheck(m_id) {
	if (m_id == "") {
		alert("아이디를 입력해 주세요.");
		document.regForm.m_id.focus();
	} else {
		url = "idCheck.jsp?id=" + m_id;
		window.open(url, "post", "width=300,height=200,left=999px,top=400px");
	}
}
function win_close() {

	self.close();
}

function signUp() {
	document.location.href = "sign-up.jsp";

}
function idSearch() {
	document.location.href = "idSearch.jsp";
}
// ////////////////본인확인란///////////////////
function idEmailcheck() {

	if (document.regForm2.m_id.value == "") {
		alert("아이디를 입력해 주세요.");
		document.regForm2.m_id.focus();
		return;
	}
	if (document.regForm2.m_email.value == "") {
		alert("이메일을 입력해 주세요.");
		document.regForm2.m_email.focus();
		return;
	}
	document.regForm2.submit();
}
// /////////////////본인확인란/////////////////
// ////////////////비밀번호수정///////////////////
function rewritepass() {
	if (document.Form3.m_pwd.value == "") {
		alert("비밀번호를 입력해 주세요.");
		document.Form3.m_pwd.focus();
		return;
	}
	if (document.Form3.repwd.value == "") {
		alert("비밀번호 확인을 입력해 주세요.");
		document.Form3.repwd.focus();
		return;
	}
	if (document.Form3.m_pwd.value != document.Form3.repwd.value) {
		alert("비밀번호를 동일하게 적어주세요.");
		document.Form3.repwd.focus();
		return;
	}
	document.Form3.submit();
}
// /////////////////비밀번호수정/////////////////

// //////////////////GPS///////////////////
//function GPS() {
//
//	function init() {
//		window.navigator.geolocation.getCurrentPosition(current_position);
//	}
//
//	function current_position(position) {
//
//		var m_latitude = position.coords.latitude;
//		var m_longitude = position.coords.longitude;
//
//	}
//	document.regForm.m_latitude.value = m_latitude;
//	document.regForm.m_longitude.value = m_longitude;
//	window.addEventListener("load", init);
//
//}
// //////////////////GPS///////////////////

/*
 * #유지보수
 */
// 자동정렬 다른 function 함수와 똑같은 여백으로 하면 보기에 좋습니다.
// Product
function productDetail(no) {
	document.detail.no.value = no;
	document.detail.submit();
}

// Cart
function cartUpdate(form) {
	form.flag.value = "update"
	form.submit();
}

function cartDelete(form) {
	form.flag.value = "delete";
	form.submit();
}