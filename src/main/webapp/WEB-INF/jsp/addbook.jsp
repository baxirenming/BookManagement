<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<%@ include file="menu.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>書籍登録</title>
</head>
<body>
	<h2>書籍登録</h2>
<form name="registform" action="./addbookconfirm" method="post">
	<table>
		<tr>
			<td bgcolor="#a0d8ef">書籍名</td>
			<td>
			<input type="text" name="abForm.book.name" value="<s:property value="abForm.book.name"/>" />
			</td>
		</tr>
		<tr>
			<td bgcolor="#a0d8ef">著者名</td>
			<td>
			<input type="text" name="abForm.book.author" value="<s:property value="abForm.book.author"/>"/>
			</td>
		</tr>
		<tr>
			<td bgcolor="#a0d8ef">出版社</td>
			<td>
			<input type="text" name="abForm.book.publisher" value="<s:property value="abForm.book.publisher"/>"/>
			</td>
		</tr>
		<tr>
			<td bgcolor="#a0d8ef">内容注記</td>
			<td>
			<textarea rows="4" cols="40"  name="abForm.book.note"> <s:property value="abForm.book.note" /> </textarea>
			</td>
		</tr>
		<tr>
			<td bgcolor="#a0d8ef">ISBN</td>
			<td>
			<input type="text" name="abForm.book.isbn" value="<s:property value="abForm.book.isbn"/>"/>
			</td>
		</tr>
		<tr>
			<td bgcolor="#a0d8ef">カテゴリ区分</td>
			<td>
		    <input type="radio" name="abForm.book.category_class" value="1" />図書
		    <input type="radio" name="abForm.book.category_class" value="2" />資料
		    <input type="radio" name="abForm.book.category_class" value="3" />雑誌
		    <input type="radio" name="abForm.book.category_class" value="4" />ビデオ
			</td>
		</tr>
	</table>
	<input type="submit" value="登録"/>
</form>
</body>
</html>