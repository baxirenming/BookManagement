<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<div style="background-color: #00ff7f;">
	<font color="blue">ユーザ:<s:property value="session.loginInfo.name" /></font>
	<font color="blue">権限:
	<s:if test="session.loginInfo.role_class == 1" >一般ユーザ</s:if>
	<s:if test="session.loginInfo.role_class == 2" >管理員</s:if>
	</font>
	<table  >
		<tr>
			<s:if test="session.loginInfo.role_class == 1" >
			<td style="width:120px"><a href="./lendinquiry">貸出照会</a></td>
			<td style="width:120px"><a href="./reserveinquiry">予約照会</a></td>
			<td style="width:220px"><a href="./bookSearch">蔵書検索・予約申請</a></td>
			</s:if>
			<s:if test="session.loginInfo.role_class == 2" >
			<td style="width:120px"><a href="./lendbook">貸出手続</a></td>
			<td style="width:120px"><a href="./returnbook">返却手続</a></td>
			<td style="width:120px"><a href="./addbook">書籍登録</a></td>
			</s:if>
		</tr>
	</table>
</div>
<div>
	<s:if test="messageflag == true">
		<font color="green"><s:property value="message" /></font>
	</s:if>
	<s:if test="messageflag == false">
		<font color="red"><s:property value="message" /></font>
	</s:if>
</div>