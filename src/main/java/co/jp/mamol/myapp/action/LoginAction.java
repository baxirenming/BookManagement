package co.jp.mamol.myapp.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import co.jp.mamol.myapp.dto.UserDto;
import co.jp.mamol.myapp.form.LoginForm;
import co.jp.mamol.myapp.service.LoginService;
/*
 * M0099ログイン画面
 */
@Results({
		@Result(name = "login", location = "/WEB-INF/jsp/login.jsp"),
		@Result(name = "lendinquiry", location = "./lendinquiry",type="redirect"),
		@Result(name = "lendbook", location = "./lendbook" ,type="redirect")
})
public class LoginAction extends BaseAction{
	private LoginForm loginForm = new LoginForm();

	@Autowired
	LoginService loginService;

	@Action("/login")
	public String init() {
		return "login";
	}

	@Action("/loginact")
	public String login() {
	    //入力チェック
		if(loginForm.getId()== null ||loginForm.getId().equals("") ) {
			setMessage("ユーザIDを入力してください。", false);
			return "login";
		}else if(loginForm.getPassword()== null ||loginForm.getPassword().equals("")) {
			setMessage("パスワードを入力してください。", false);
			return "login";
		}
		//ユーザ情報チェック
		UserDto userDto = loginService.findUser(Integer.parseInt(loginForm.getId()));

		if(userDto == null) {
			setMessage("ユーザが存在しません。", false);
			return "login";
		}else if(!userDto.getPassword().equals(loginForm.getPassword())) {
			setMessage("パスワードが正しくありません。", false);
			return "login";
		}

		//ユーザ情報をsessionに格納
		setLoginInfo(userDto);

		if(userDto.getRole_class().equals("2")) {
			return "lendbook";
		}else {
			return "lendinquiry";
		}
	}

	public LoginForm getLoginForm() {
		return loginForm;
	}

	public void setLoginForm(LoginForm loginForm) {
		this.loginForm = loginForm;
	}

}
