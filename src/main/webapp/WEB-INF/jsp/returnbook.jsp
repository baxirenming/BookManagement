<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<%@ include file="menu.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>返却手続</title>
</head>
<body>
<h2>返却手続</h2>
<hr/>
	<div>
		<form name="findlendedbook" action="./returnbooksearch" method="post">
			<label>ユーザID</label> <input type="number" name="rbform.userid" />
			<input type="submit" value="検索" />
		</form>
	</div>
<hr/>
	<s:if test="rbform.bookList != null &&  rbform.bookList.size != 0">
	<h3>貸出中書籍一覧</h3>
	<font color="green">ユーザ:<s:property value="rbform.userid" />現在貸出中<s:property value="rbform.bookList.size" />件</font>
	<form name="returnbookact" action="./returnbookact" method="post">
			<table style="border-style:solid; border-color:blue;">
			<tr bgcolor="#98fb98">
				<td></td>
				<td>書籍ID</td>
				<td>書名</td>
				<td>著者名</td>
				<td>貸出日付</td>
				<td>返却期限</td>
				<td>遅延状態</td>
			</tr>
			<s:iterator value="rbform.bookList" status="rowstatus">
				<tr>
					<td>
						<input type="checkbox" name="rbform.bookList[<s:property value="#rowstatus.index"/>].checked" value="true"/>
					</td>
					<td><s:property value="book_id_seq"/>
						<input type="hidden" name="rbform.bookList[<s:property value="#rowstatus.index"/>].book_id_seq" value="<s:property value="book_id_seq" />"/>
					</td>
					<td><s:property value="name" /></td>
					<td><s:property value="author" /></td>
					<td><s:property value="lend_date" /></td>
					<td><s:property value="deadline_date" /></td>
					<td>
					<s:if test="delayed == true">
					  <font color="red">返却遅延</font>
					</s:if>
					</td>
				</tr>
			</s:iterator>
			</table>
			<input type="hidden" name="rbform.userid" value="<s:property value="rbform.userid" />"/>
			<input type="submit" value="返却実行" />
	</form>
	</s:if>
</body>
</html>