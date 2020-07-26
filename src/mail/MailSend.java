package mail;

public class MailSend {

	// 
	public boolean sendIdAndEmail(String email) {
		boolean flag = false;
		MemberMgr mgr = new MemberMgr();
		String id = mgr.findId(email);
		if (id == null) {
			return flag;
		} else {
			String url = "http://192.168.0.21:8080/commaaaa/member/memberPassReWrite.jsp";// 
			String title = " C O M M A 계정 찾기입니다.\r\n";
			String content = "아이디는 " + id + "입니다. \r\n";
			content += "비밀번호를 변경하시려면 링크를 열어주세요" + " " + url;
			GmailSend.send(title, content, email);
			flag = true;
		}
		return flag; 
	} 
}
