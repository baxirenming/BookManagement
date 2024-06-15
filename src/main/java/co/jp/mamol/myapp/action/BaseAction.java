package co.jp.mamol.myapp.action;

import java.util.Map;

import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

import co.jp.mamol.myapp.dto.UserDto;

@Results({
		@Result(name = "error", location = "/WEB-INF/jsp/error.jsp")
})
public class BaseAction extends ActionSupport implements SessionAware {
	private Map<String, Object> session;

	private String message;

	private boolean messageflag;

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	//セッション取得
	public Map<String, Object> getSession() {
		return session;
	}

	//権限チェック(一般ユーザ)
	public boolean checkNomalUser() {
		UserDto loginInfo = (UserDto) session.get("loginInfo");
		if (loginInfo != null && loginInfo.getRole_class().equals("1")) {
			return true;
		}
		return false;
	}

	//権限チェック(管理員)
	public boolean checkAdmin() {
		UserDto loginInfo = (UserDto) session.get("loginInfo");
		if (loginInfo != null && loginInfo.getRole_class().equals("2")) {
			return true;
		}
		return false;
	}

	//ログインユーザ情報取得
	public UserDto getLoginUser() {
		UserDto loginInfo = (UserDto) session.get("loginInfo");
		return loginInfo;
	}

	//ログインユーザ情報設定
	public void setLoginInfo(UserDto loginInfo) {
		session.put("loginInfo", loginInfo);
	}

	//表示メッセージ取得
	public String getMessage() {
		return message;
	}

	//表示メッセージ設定
	public void setMessage(String message, boolean messageflag) {
		this.message = message;
		this.messageflag = messageflag;
	}

	public boolean isMessageflag() {
		return messageflag;
	}
}
