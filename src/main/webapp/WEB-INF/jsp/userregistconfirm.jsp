<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<%@ include file="menu.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>ユーザ登録通知</title>
</head>
<body>
	<h2>ユーザ登録通知</h2>
	<font color="blue">以下の情報で登録完了しました。</font>
	<br />
	<font color="blue">「ユーザID」はシステムにより発番したもので、ログインに必要となりますので、記録しておいてください</font>
	<table>
		<tr>
			<td bgcolor="#a0d8ef">ユーザID</td>
			<td><s:property value="uregForm.userDto.user_id_seq" /></td>
		</tr>
		<tr>
			<td bgcolor="#a0d8ef">パスワード</td>
			<td><s:property value="uregForm.userDto.password" /></td>
		</tr>
		<tr>
			<td bgcolor="#a0d8ef">ユーザ名</td>
			<td><s:property value="uregForm.userDto.name" /></td>
		</tr>
		<tr>
			<td bgcolor="#a0d8ef">メール</td>
			<td><s:property value="uregForm.userDto.mail" /></td>
		</tr>
		<tr>
			<td bgcolor="#a0d8ef">電話番号</td>
			<td><s:property value="uregForm.userDto.tel" /></td>
		</tr>
		<tr>
			<td bgcolor="#a0d8ef">有効期限</td>
			<td><s:property value="uregForm.userDto.enddate" /></td>
		</tr>
		</table>
	<a href="./login">戻る</a>
</body>
</html>