<!--#include virtual="/admin/inc/gbl_config_inc.asp"-->
<!--#include virtual="/admin/inc/gbl_login_check_inc.asp"-->
<%
Dim RS1, iNum
Dim sAdmin_Stat, sAdmin_Part, sAdmin_Team, sItem, sKey, page
Dim CG_LARG, CG_SMAL, CG_NAME, ctg_SEQ1, ctg_SEQ2
Dim Code_Small, Code_Name
Dim Admin_Code
Dim Admin_ID, Admin_PW, Admin_Name, Admin_Part, Admin_Team, Admin_Position
Dim Admin_Birth1, Admin_Birth2, Admin_Birth3, Admin_Birth
Dim Admin_Tel1, Admin_Tel2, Admin_Tel3, Admin_Tel
Dim Admin_Hp1, Admin_Hp2, Admin_Hp3, Admin_Hp
Dim Admin_Email, Admin_MSN, Admin_Stat, Admin_Photo, Maechul_View, Admin_Gubun
Dim Data_Count
Dim Code_Seq, Code_Sys, Code_Sys_Name, Code_Pgm, Code_Pgm_Name
Dim Auth_Exist
Dim Arr_Auth_Chk_Count(5)
Dim Auth_Page_Code
Dim Exist_View, Exist_Reg, Exist_Edit, Exist_Del, Exist_Excel
Dim Auth_View, Auth_Reg, Auth_Edit, Auth_Del, Auth_Excel
Dim Low_Team

sql = "SELECT Admin_ID, Admin_PW, Admin_Name, Admin_Part, Admin_Team, Admin_Position, "
sql = sql & "Admin_Birth, Admin_Tel, Admin_Hp, Admin_Email, Admin_MSN, Admin_Stat, Admin_Photo, Maechul_View, Admin_Gubun, Low_Team "
sql = sql & "FROM ADMIN WHERE Del_Gubun='N' AND Admin_Code="& gbl_Admin_Code
Set RS = DbCon.Execute(sql)
If RS.EOF Then
	Set RS = Nothing
	DbCon.Close
	
	F_JS_Alert "Error!!!\n��ϵ� ������ �����ϴ�.","history.back();"
	Response.End
Else
	Admin_ID       = RS("Admin_ID")
	Admin_PW       = RS("Admin_PW")
	Admin_Name     = RS("Admin_Name")
	Admin_Part     = RS("Admin_Part")
	Admin_Team     = RS("Admin_Team")
	Admin_Position = RS("Admin_Position")
	Admin_Birth    = RS("Admin_Birth") &"--" '�������� �������� -- �ӽ� �߰�
	Admin_Birth1   = Split(Admin_Birth,"-")(0)
	Admin_Birth2   = Split(Admin_Birth,"-")(1)
	Admin_Birth3   = Split(Admin_Birth,"-")(2)
	Admin_Tel      = RS("Admin_Tel") &"--" '�������� �������� -- �ӽ� �߰�
	Admin_Tel1     = Split(Admin_Tel,"-")(0)
	Admin_Tel2     = Split(Admin_Tel,"-")(1)
	Admin_Tel3     = Split(Admin_Tel,"-")(2)
	Admin_Hp       = RS("Admin_Hp") &"--" '�������� �������� -- �ӽ� �߰�
	Admin_Hp1      = Split(Admin_Hp,"-")(0)
	Admin_Hp2      = Split(Admin_Hp,"-")(1)
	Admin_Hp3      = Split(Admin_Hp,"-")(2)
	Admin_Email    = RS("Admin_Email")
	Admin_MSN      = RS("Admin_MSN")
	Maechul_View   = RS("Maechul_View")
	Admin_Stat     = RS("Admin_Stat")
	Admin_Gubun    = RS("Admin_Gubun")
	Admin_Photo    = RS("Admin_Photo")
	Low_Team   = RS("Low_Team")
	Set RS = Nothing
End If

Navigation = "�ý��۰��� &gt; �� ���� ����"
%>
<html>
<head>
<!--#include virtual="/admin/inc/gbl_header_inc.asp"-->
<script language="javascript">
<!--
var Admin_Part = new Array();

function C_SetCodeL(c,n)
{
	this.Admin_Part = c;
	this.CG_LARGE_NAME = n;
	this.Admin_Team = new Array();
}
	
function C_SetCodeS(c,n)
{
	this.Admin_Team = c;
	this.CG_SMAL_NAME = n;
}
<%
Response.Write vbCrLf
	
Set RS = Server.CreateObject("ADODB.RecordSet")
Set RS1 = Server.CreateObject("ADODB.RecordSet")
	
sql = "EXEC SP_DEF_PARTCODE_SELECT '', ''" '�μ� ���� ������
Set RS = DbCon.Execute(sql)
	
ctg_SEQ1 = 0
Do Until RS.EOF
	CG_LARG = RS("Part_Big")
	CG_NAME = Replace(RS("Part_Name"),"""","\""")
		
	Response.Write "Admin_Part["& ctg_SEQ1 &"] = new C_SetCodeL("""& CG_LARG &""","""& CG_NAME &""");"& vbCrLf
		
	sql = "EXEC SP_DEF_PARTCODE_SELECT '"& CG_LARG &"', ''" '�� ���� ������
	Set RS1 = DbCon.Execute(sql)
		
	ctg_SEQ2 = 0
	Do Until RS1.EOF
		CG_SMAL = RS1("Part_Small")
		CG_NAME = Replace(RS1("Part_Name"),"""","\""")
			
		Response.Write "Admin_Part["& ctg_SEQ1 &"].Admin_Team["& ctg_SEQ2 &"] = new C_SetCodeS("""& CG_SMAL &""","""& CG_NAME &""");"& vbCrLf
			
		ctg_SEQ2 = ctg_SEQ2 + 1
		RS1.MoveNext
	Loop
	
	Set RS1 = Nothing
		
	ctg_SEQ1 = ctg_SEQ1 + 1
	RS.MoveNext
Loop
Set RS = Nothing
%>
	
function C_Set_SCOD(xCG_LARG,xCG_SMAL) {
	var index = xCG_LARG.selectedIndex;
	
	if (index==0) {
		xCG_SMAL.options.length = 1;
		xCG_SMAL.options[0] = new Option("����","");
	}
	else {
		var len = Admin_Part[index-1].Admin_Team.length;
			
		xCG_SMAL.options.length = len+1;
		xCG_SMAL.options[0] = new Option("����","");
			
		for (var i=0;i<len;i++) {
			xCG_SMAL.options[i+1] = new Option(Admin_Part[index-1].Admin_Team[i].CG_SMAL_NAME,Admin_Part[index-1].Admin_Team[i].Admin_Team);
			<%If Admin_Team<>"" Then%>
			if(Admin_Part[index-1].Admin_Part=="<%=Admin_Part%>" && Admin_Part[index-1].Admin_Team[i].Admin_Team=="<%=Admin_Team%>") {
				xCG_SMAL.selectedIndex = i+1;
			}
			<%End If%>
		}
	}
}

function regist() {
	var f = document.frm_user;
	
	if(StrCharLenChk(f,f.Admin_ID.value)==0) {
		alert("���̵� �Է��ϼ���.");
		f.Admin_ID.focus();
		return;
	}
	if(f.Admin_PW.value.length > 0) {
		if(StrCharLenChk(f,f.Admin_PW_Conf.value)==0) {
			alert("��й�ȣȮ���� �Է��ϼ���.");
			f.Admin_PW_Conf.focus();
			return;
		}
		if(f.Admin_PW.value != f.Admin_PW_Conf.value) {
			alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
			f.Admin_PW_Conf.value = "";
			f.Admin_PW_Conf.focus();
			return;
		}
	}
	if(StrCharLenChk(f,f.Admin_Name.value)==0) {
		alert("������ �Է��ϼ���.");
		f.Admin_Name.focus();
		return;
	}
	
	if(confirm("�� ������ �����մϴ�.")) {
		f.submit();
	}
}

function idcheck() {
	var f = document.frm_user;
	
	if(StrCharLenChk(f,f.Admin_ID.value)==0) {
		alert("���̵� �Է��ϼ���.");
		f.Admin_ID.focus();
		return;
	}
	PROC_RTN.location.replace("mem_idcheck.asp?Admin_Code=<%=gbl_Admin_Code%>&Admin_ID="+ f.Admin_ID.value);
}

function window::onload() {
	var f = document.frm_user;
	
	C_Set_SCOD(f.Admin_Part,f.Admin_Team);
}
//-->
</script>
</head>
<body>
<table valign="top" width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
<!--#include virtual="/admin/inc/gbl_topmenu_inc.asp"-->
	<tr>
	<td valign="top">
	<table width="1000" border="0" cellpadding="0" cellspacing="0">
<form name="frm_user" method="post" action="mypage_edit_ok.asp" enctype="multipart/form-data">
<input type="hidden" name="Admin_Stat" value="<%=Admin_Stat%>">
<input type="hidden" name="Maechul_View" value="<%=Maechul_View%>">
<input type="hidden" name="Admin_Gubun" value="<%=Admin_Gubun%>">
<input type="hidden" name="Low_Team" value="<%=Low_Team%>">
		<tr>
		<td width="10"></td>
		<td width="980" valign="top">
		<%'���� ���� �� - Start%>
		
		<table width="100%" border="0" cellspacing="1" cellpadding="0" class="tbl02">
			<tr>
			<td class="title05">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
				<td><img src="/admin/img/ico02.gif" width="6" height="8" border="0" align="absmiddle"> <b>�� ����</b></td>
				<td align="right" style="padding-right:10;"><font color="red">*</font> �� �ʼ� �Է� �׸��Դϴ�.</td>
				</tr>
			</table>
			</td>
			</tr>
			<tr>
			<td class="td02">
			<table width="100%" border="1" cellspacing="0" cellpadding="2" bordercolor="#C1C1C1" bordercolordark="#FFFFFF" bgcolor="#FFFFFF">
				<tr>
				<td width="40%" align="center">
				<img id="Img_Admin_Photo" src="/admin/upload/system/<%=Admin_Photo%>" border="0" height="200" onerror="this.src='/admin/upload/system/user_no_image.jpg';"><br><br>
				���� ���ε� (���� 200 size ����)<br>
				<input type="file" name="Admin_Photo" size="40" class="input_eng" onKeyPress="return false;" onChange="if(this.value==''){Img_Admin_Photo.src='/admin/upload/system/user_no_image.jpg';} else{Img_Admin_Photo.src=this.value;}">
				</td>
				<td width="60%">
				<table width="100%" border="1" cellspacing="0" cellpadding="2" bordercolor="#C1C1C1" bordercolordark="#FFFFFF" bgcolor="#FFFFFF">
					<tr height="25">
					<td width="25%" style="background-color:#E5E5E5;font-weight:bold;padding-left:14px;">�Ҽ�</td>
					<td width="75%">
					<select name="Admin_Part" class="select" onChange="C_Set_SCOD(this,this.form.Admin_Team);">
					<%
					Response.Write "<option value="""">�μ�</option>"
				
					sql = "EXEC SP_DEF_PARTCODE_SELECT '', ''" '�μ��ڵ� ����
					Set RS = DbCon.Execute(sql)
					Do Until RS.EOF
						Code_Small = RS("Part_Big")
						Code_Name  = RS("Part_Name")
						
						Response.Write "<option value="""& Code_Small &""""
						If CStr(Code_Small) = CStr(Admin_Part) Then Response.Write " selected" End If
						Response.Write ">"& Code_Name &"</option>"& vbCrLf
						
						RS.MoveNext
					Loop
					Set RS = Nothing
					%>
					</select> 
					<select name="Admin_Team" class="select">
					<option value="">����</option>
					</select>
					</td>
					</tr>
					<tr height="25">
					<td style="background-color:#E5E5E5;font-weight:bold;padding-left:14px;">��å</td>
					<td>
					<select name="Admin_Position" class="select">
					<%
					Response.Write "<option value="""">��å</option>"
				
					sql = "EXEC SP_DEF_CODE_SELECT '02'" '��å�ڵ� 02
					Set RS = DbCon.Execute(sql)
					Do Until RS.EOF
						Code_Small = RS("Code_Small")
						Code_Name  = RS("Code_Name")
						
						Response.Write "<option value="""& Code_Small &""""
						If CStr(Code_Small) = CStr(Admin_Position) Then Response.Write " selected" End If
						Response.Write ">"& Code_Name &"</option>"& vbCrLf
						
						RS.MoveNext
					Loop
					Set RS = Nothing
					%>
					</select>
					</td>
					</tr>
					<tr height="25">
					<td style="background-color:#E5E5E5;font-weight:bold;"><font color="red">*</font> ���̵�</td>
					<td><strong><%=Admin_ID%></strong>
					<input type="hidden" name="Admin_ID" value="<%=Admin_ID%>"> 
					<!--<input type="button" value="�ߺ�üũ" class="input_btn" onclick="idcheck();">--></td>
					</tr>
					<tr height="25">
					<td style="background-color:#E5E5E5;font-weight:bold;padding-left:14px;">��й�ȣ</td>
					<td><input type="text" name="Admin_PW" maxlength="20" value="" style="width:130px;" class="input_eng"> <font color="red">* ����ÿ��� �Է��ϼ���.</font> </td>
					</tr>
					<tr height="25">
					<td style="background-color:#E5E5E5;font-weight:bold;padding-left:14px;">��й�ȣȮ��</td>
					<td><input type="text" name="Admin_PW_Conf" maxlength="20" style="width:130px;" class="input_eng"></td>
					</tr>
					<tr height="25">
					<td style="background-color:#E5E5E5;font-weight:bold;"><font color="red">*</font> ����</td>
					<td><input type="text" name="Admin_Name" maxlength="20" value="<%=Admin_Name%>" style="width:150px;" class="input_kor"></td>
					</tr>
					<tr height="25">
					<td style="background-color:#E5E5E5;font-weight:bold;padding-left:14px;">����</td>
					<td>
					<select name="Admin_Birth1" class="select"><script language="javascript">
					var y, m, d, mm, dd;
					
					document.write("<option value=\"\"></option>");
					for(y=1950; y<=<%=Split(gbl_TodayDate,"-")(0)%>; y++) {
						document.write("<option value=\""+ y +"\"");
						if(y=="<%=Admin_Birth1%>") document.write(" selected");
						document.write(">"+ y +"</option>");
					} 
					</script></select>��
					<select name="Admin_Birth2" class="select"><script language="javascript">
					document.write("<option value=\"\"></option>");
					for(m=1; m<=12; m++) {
						m<10 ? mm="0"+m : mm=m;
						document.write("<option value=\""+ mm +"\"");
						if(mm=="<%=Admin_Birth2%>") document.write(" selected");
						document.write(">"+ mm +"</option>");
					} 
					</script></select>��
					<select name="Admin_Birth3" class="select"><script language="javascript">
					document.write("<option value=\"\"></option>");
					for(d=1; d<=31; d++) {
						d<10 ? dd="0"+d : dd=d;
						document.write("<option value=\""+ dd +"\"");
						if(dd=="<%=Admin_Birth3%>") document.write(" selected");
						document.write(">"+ dd +"</option>");
					} 
					</script></select>��
					</td>
					</tr>
					<tr height="25">
					<td style="background-color:#E5E5E5;font-weight:bold;padding-left:14px;">��ȭ��ȣ</td>
					<td>
					<input type="text" name="Admin_Tel1" size="4" maxlength="4" value="<%=Admin_Tel1%>" class="input_eng" onKeyUp="StrDigitChk(this,this.value);"> - 
					<input type="text" name="Admin_Tel2" size="4" maxlength="4" value="<%=Admin_Tel2%>" class="input_eng" onKeyUp="StrDigitChk(this,this.value);"> - 
					<input type="text" name="Admin_Tel3" size="4" maxlength="4" value="<%=Admin_Tel3%>" class="input_eng" onKeyUp="StrDigitChk(this,this.value);">
					</td>
					</tr>
					<tr height="25">
					<td style="background-color:#E5E5E5;font-weight:bold;padding-left:14px;">�ڵ���</td>
					<td>
					<input type="text" name="Admin_Hp1" size="4" maxlength="4" value="<%=Admin_Hp1%>" class="input_eng" onKeyUp="StrDigitChk(this,this.value);"> - 
					<input type="text" name="Admin_Hp2" size="4" maxlength="4" value="<%=Admin_Hp2%>" class="input_eng" onKeyUp="StrDigitChk(this,this.value);"> - 
					<input type="text" name="Admin_Hp3" size="4" maxlength="4" value="<%=Admin_Hp3%>" class="input_eng" onKeyUp="StrDigitChk(this,this.value);">
					</td>
					</tr>
					<tr height="25">
					<td style="background-color:#E5E5E5;font-weight:bold;padding-left:14px;">�̸���</td>
					<td><input type="text" name="Admin_Email" maxlength="50" value="<%=Admin_Email%>" style="width:250px;" class="input_eng"></td>
					</tr>
					<tr height="25">
					<td style="background-color:#E5E5E5;font-weight:bold;padding-left:14px;">MSN �޽���</td>
					<td><input type="text" name="Admin_MSN" maxlength="50" value="<%=Admin_MSN%>" style="width:250px;" class="input_eng"></td>
					</tr>
				</table>
				</td>
				</tr>
			</table>
			</td>
			</tr>
		</table>
		<table width="100%" height="10" border="0" cellspacing="0" cellpadding="0"><tr><td></td></tr></table>
		
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
			<td height="30" align="center">
			<input type="button" value="�� ���� ����" class="input_btn" onClick="regist();"> 
			<input type="button" value="���" class="input_btn" onClick="history.back();"> 
			</td>
			</tr>
		</table>

		<%'���� ���� �� - End%>
		</td>
		<td width="10"></td>
		</tr>
</form>
	</table>
	</td>
	</tr>
	<tr>
	<td valign="bottom">
<!--#include virtual="/admin/inc/gbl_footer_inc.asp"-->
	</td>
	</tr>
</table>
<iframe name="PROC_RTN" width="0" height="0" frameborder="0" scrolling="no"></iframe>
</body>
</html>