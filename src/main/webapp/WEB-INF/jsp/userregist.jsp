<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>ユーザ登録</title>
</head>
<body>
<h2>ユーザ登録</h2>
<form name="registform" action="./userregistact" method="post">
	<table>
		<tr>
			<td bgcolor="#a0d8ef">ユーザ名</td>
			<td>
			<input type="text" name="uregForm.userDto.name" />
			</td>
		</tr>
		<tr>
			<td bgcolor="#a0d8ef">パスワード</td>
			<td>
			<input type="text" name="uregForm.userDto.password" />
			</td>
		</tr>
		<tr>
			<td bgcolor="#a0d8ef">メール</td>
			<td>
			<input type="text" name="uregForm.userDto.mail" />
			</td>
		</tr>
		<tr>
			<td bgcolor="#a0d8ef">電話番号</td>
			<td>
			<input type="text" name="uregForm.userDto.tel" />
			</td>
		</tr>
	</table>
	<input type="submit" value="登録"/>
</form>
</body>
</html>