<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<%@ include file="menu.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>貸出手続</title>
</head>
<body>
<h2>貸出手続</h2>
<hr/>
	<div>
		<form name="findbookbyid" action="./lendbooksearch" method="post">
			<label>書籍ID</label> <input type="number" name="lendBookForm.bookid" />
			<input type="submit" value="検索" />
		</form>
	</div>
<hr/>
	<s:if test="lendBookForm.book != null ">
	<h3>書籍情報</h3>
	<table>
		<tr>
			<td bgcolor="#a0d8ef">書籍ID</td>
			<td>
			<s:property value="lendBookForm.book.book_id_seq" />
			</td>
		</tr>
		<tr>
			<td bgcolor="#a0d8ef">書籍名</td>
			<td>
			<s:property value="lendBookForm.book.name" />
			</td>
		</tr>
		<tr>
			<td bgcolor="#a0d8ef">著者名</td>
			<td>
			<s:property value="lendBookForm.book.author" />
			</td>
		</tr>
		<tr>
			<td bgcolor="#a0d8ef">出版社</td>
			<td>
			<s:property value="lendBookForm.book.publisher" />
			</td>
		</tr>
		<tr>
			<td bgcolor="#a0d8ef">内容注記</td>
			<td>
			<p style="width: 400px;"><s:property value="lendBookForm.book.note" /></p>
			</td>
		</tr>
		<tr>
			<td bgcolor="#a0d8ef">ISBN</td>
			<td>
			<s:property value="lendBookForm.book.isbn" />
			</td>
		</tr>
		<tr>
			<td bgcolor="#a0d8ef">カテゴリ</td>
			<td>
					    <s:if test="lendBookForm.book.category_class == 1">
					    	<font>図書</font>
					    </s:if>
					    <s:if test="lendBookForm.book.category_class == 2">
					    	<font>資料</font>
					    </s:if>
					    <s:if test="lendBookForm.book.category_class == 3">
					    	<font>雑誌</font>
					    </s:if>
					    <s:if test="lendBookForm.book.category_class == 4">
					    	<font>ビデオ</font>
					    </s:if>
			</td>
		</tr>
		<tr>
			<td bgcolor="#a0d8ef">貸出状態</td>
			<td>
					    <s:if test="lendBookForm.book.lendstatus_class == 1">
					    	<font color="green">在架</font>
					    </s:if>
					    <s:if test="lendBookForm.book.lendstatus_class == 2">
					    	<font color="red">貸出中</font>
					    </s:if>
			</td>
		</tr>
		<s:if test="lendBookForm.book.lendstatus_class == 2">
		<tr>
			<td bgcolor="#a0d8ef">貸出ユーザ</td>
			<td>
			<s:property value="lendBookForm.book.lend_userid" />
			</td>
		</tr>
		<tr>
			<td bgcolor="#a0d8ef">返却期限</td>
			<td>
			<s:property value="lendBookForm.book.deadline_date" />
			</td>
		</tr>
		</s:if>
		<tr>
			<td bgcolor="#a0d8ef">予約状態</td>
			<td>
					    <s:if test="lendBookForm.book.res_status_class == 1">
					    	<font>予約なし</font>
					    </s:if>
					    <s:if test="lendBookForm.book.res_status_class == 2">
					    	<font>予約あり</font>
					    </s:if>
			</td>
		</tr>
		<s:if test="lendBookForm.book.res_status_class == 2">
		<tr>
			<td bgcolor="#a0d8ef">予約ユーザ</td>
			<td>
			<s:property value="lendBookForm.book.res_userid" />
			</td>
		</tr>
		</s:if>
	</table>
	</s:if>

	<s:if test="lendBookForm.book.lendstatus_class == 1">
	 <form name="lendbook" action="./lendbookact" method="post">
	 	<input type="hidden" name="lendBookForm.book.book_id_seq" value="<s:property value="lendBookForm.book.book_id_seq" />"/>
	 	<table>
	 		<tr>
	 			<td bgcolor="#98d98e">貸出申請者ID</td>
	 			<td><input type="number" name="lendBookForm.userid" /></td>
	 			<td><input type="submit" value="貸出実行"/></td>
	 		</tr>
	 	</table>

	 </form>
	</s:if>

</body>
</html>