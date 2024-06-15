<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<%@ include file="menu.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>蔵書検索・予約申請</title>
</head>
<body>
	<h2>蔵書検索</h2>
	<hr />
	<font color="blue"><s:property value="bookSearchForm.message" /></font>
	<form name="bookSearchForm" action="./bookSearchAct" method="post">
	<table>
		<tr>
			<td bgcolor="#a0d8ef"><label>書籍名</label></td>
			<td><input type="text" name="bookSearchForm.con.name" /></td>
		</tr>
		<tr>
			<td bgcolor="#a0d8ef"><label>著者名</label></td>
			<td><input type="text" name="bookSearchForm.con.author"/></td>
		</tr>
		<tr>
			<td bgcolor="#a0d8ef"><label>ISBN</label></td>
			<td><input type="text" name="bookSearchForm.con.isbn" /></td>
		</tr>
		<tr>
		    <td bgcolor="#a0d8ef"><label>カテゴリ</label></td>
		    <td>
		          <select name="bookSearchForm.con.category_class">
		          	<option value="0">未設定</option>
		          	<option value="1">図書</option>
		          	<option value="2">資料</option>
		          	<option value="3">雑誌</option>
		          	<option value="4">ビデオ</option>
		          </select>
		    </td>
		</tr>
		<tr>
		    <td bgcolor="#a0d8ef"><label>貸出状態</label></td>
		    <td>
		          <select name="bookSearchForm.con.lendstatus_class">
		          	<option value="0">未設定</option>
		          	<option value="1">在架</option>
		          	<option value="2">貸出中</option>
		          </select>
		    </td>
		</tr>
				<tr>
		    <td bgcolor="#a0d8ef"><label>予約状態</label></td>
		    <td>
		          <select name="bookSearchForm.con.res_status_class">
		          	<option value="0">未設定</option>
		          	<option value="1">予約なし</option>
		          	<option value="2">予約あり</option>
		          </select>
		    </td>
		</tr>
	</table>
	<input type="submit" value="検索" />
	</form>
<hr/>
	<s:if test="bookSearchForm.bookList != null && bookSearchForm.bookList.size !=0">
	<div id="pagetitle">
		page:
		<s:property value="bookSearchForm.pageNo"/>
		/
		<s:property value="bookSearchForm.totalPage"/>
		<s:if test="bookSearchForm.pageNo > 1">
			<a href="./bookSearchPaging?bookSearchForm.pageNo=<s:property value="bookSearchForm.pageNo-1"/>">前へ</a>
		</s:if>
		<s:if test="bookSearchForm.pageNo<bookSearchForm.totalPage">
			<a href="./bookSearchPaging?bookSearchForm.pageNo=<s:property value="bookSearchForm.pageNo+1"/>">次へ</a>
		</s:if>
	</div>
	<table style="border-style:solid; border-color:blue;">
		<tr bgcolor="#98fb98">
			<td>書籍ID</td>
			<td>書籍名</td>
			<td>著者名</td>
			<td>ISBN</td>
			<td>カテゴリ</td>
			<td>貸出状態</td>
			<td>予約状態</td>
			<td>予約</td>
		</tr>
		<s:iterator value="bookSearchForm.bookList">
				<tr>
					<td><s:property value="book_id_seq"/></td>
					<td><s:property value="name" /></td>
					<td><s:property value="author" /></td>
					<td><s:property value="isbn" /></td>
					<td>
					    <s:if test="category_class == 1">
					    	<font>図書</font>
					    </s:if>
					    <s:if test="category_class == 2">
					    	<font>資料</font>
					    </s:if>
					    <s:if test="category_class == 3">
					    	<font>雑誌</font>
					    </s:if>
					    <s:if test="category_class == 4">
					    	<font>ビデオ</font>
					    </s:if>
					</td>
					<td>
					    <s:if test="lendstatus_class == 1">
					    	<font>在架</font>
					    </s:if>
					    <s:if test="lendstatus_class == 2">
					    	<font>貸出中</font>
					    </s:if>
					</td>
					<td>
					    <s:if test="res_status_class == 1">
					    	<font>予約なし</font>
					    </s:if>
					    <s:if test="res_status_class == 2">
					    	<font>予約あり</font>
					    </s:if>
					</td>
					<td>
					    <s:if test="res_status_class == 1">
					    	<a href="./reserveApply?bookSearchForm.book_id=<s:property value="book_id_seq"/>">予約</a>
					    </s:if>
					    <s:if test="res_status_class != 1">
					    	<font color="red">予約不可</font>
					    </s:if>
					</td>
				</tr>
		</s:iterator>

	</table>
	</s:if>


</body>