<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<%@ include file="menu.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>貸出照会</title>
</head>
<body>
<h2>貸出照会</h2>
<font color="blue">「返却遅延」の場合、早急にご返却ください。</font>
<br/>
<hr/>
<br/>
<s:if test="lendedInquiryForm.bookList != null && lendedInquiryForm.bookList.size !=0">
<font color="green">貸出中<s:property value="lendedInquiryForm.bookList.size" />件</font>
		<table style="border-style:solid; border-color:blue;">
			<tr bgcolor="#98fb98">
				<td>書籍ID</td>
				<td>書名</td>
				<td>著者名</td>
				<td>貸出日付</td>
				<td>返却期限</td>
				<td>遅延状態</td>
			</tr>
			<s:iterator value="lendedInquiryForm.bookList">
				<tr>
					<td><s:property value="book_id_seq"/></td>
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
</s:if>
</body>

