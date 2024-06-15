package co.jp.mamol.myapp.dao;

import co.jp.mamol.myapp.dto.UserDto;

public interface UserDao {
	//ユーザIDにより、1件取得
	public UserDto findUserById(Integer userid);

	//ユーザ登録
	public boolean regist(UserDto user);

	//ユーザID発番
	public int getIdSeq();


}
