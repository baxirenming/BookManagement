<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<%@ include file="menu.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>予約照会</title>
</head>
<body>
<h2>予約照会</h2>
<font color="blue">貸出状態は「在架」の場合、図書室フロントまで貸出手続きを行ってください。</font>
<br/>
<hr/>
<br/>
<s:if test="reservedInquiryForm.bookList != null && reservedInquiryForm.bookList.size !=0">
<font color="green">予約中<s:property value="reservedInquiryForm.bookList.size" />件</font>

		<table style="border-style:solid; border-color:blue;">
			<tr bgcolor="#98fb98">
				<td>書籍ID</td>
				<td>書名</td>
				<td>著者名</td>
				<td>貸出状態</td>
				<td>貸出日付</td>
				<td>返却予定</td>
				<td>予約キャンセル</td>
			</tr>
			<s:iterator value="reservedInquiryForm.bookList">
				<tr>
					<td><s:property value="book_id_seq"/></td>
					<td><s:property value="name" /></td>
					<td><s:property value="author" /></td>
					<td>
					<s:if test="lendstatus_class == 1">
					  <font color="green">在架</font>
					</s:if>
					<s:if test="lendstatus_class == 2">
					  <font color="red">未返却</font>
					</s:if>
					</td>
					<td><s:property value="lend_date" /></td>
					<td><s:property value="deadline_date" /></td>
					<td>
						<a href="./reservecancel?reservedInquiryForm.cancle_id=<s:property value="book_id_seq"/>" >キャンセル</a>
					</td>
				</tr>
			</s:iterator>
		</table>
</s:if>
</body>