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
<font color="blue">以下の情報で登録します、よろしいでしょうか？</font>
<form name="registformconfirm" action="./addbookact" method="post">
	<table>
		<tr>
			<td bgcolor="#a0d8ef">書籍名</td>
			<td>
			<s:property value="abForm.book.name" />
			</td>
		</tr>
		<tr>
			<td bgcolor="#a0d8ef">著者名</td>
			<td>
			<s:property value="abForm.book.author" />
			</td>
		</tr>
		<tr>
			<td bgcolor="#a0d8ef">出版社</td>
			<td>
			<s:property value="abForm.book.publisher" />
			</td>
		</tr>
		<tr>
			<td bgcolor="#a0d8ef">内容注記</td>
			<td>
			<p style="width: 400px;"><s:property value="abForm.book.note" /></p>
			</td>
		</tr>
		<tr>
			<td bgcolor="#a0d8ef">ISBN</td>
			<td>
			<s:property value="abForm.book.isbn" />
			</td>
		</tr>
		<tr>
			<td bgcolor="#a0d8ef">カテゴリ</td>
			<td>
					    <s:if test="abForm.book.category_class == 1">
					    	<font>図書</font>
					    </s:if>
					    <s:if test="abForm.book.category_class == 2">
					    	<font>資料</font>
					    </s:if>
					    <s:if test="abForm.book.category_class == 3">
					    	<font>雑誌</font>
					    </s:if>
					    <s:if test="abForm.book.category_class == 4">
					    	<font>ビデオ</font>
					    </s:if>
			</td>
		</tr>
	</table>
	<input type="submit" value="登録"/><a href="./addbookback">戻る</a>
</form>