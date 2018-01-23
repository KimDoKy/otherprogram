<!--#include virtual="/admin/inc/gbl_config_inc.asp"-->
<!--#include virtual="/admin/inc/gbl_login_check_inc.asp"-->
<%
Dim iNum
Dim objCmd, REGERR
Dim Arr_UpFile(1)       '입력받은 이미지들
Dim Arr_UploadFolder(1) '서버에 저장될 위치 폴더경로명
Dim Arr_SaveFileName(1) '저장 파일명
Dim UploadForm

Dim Admin_ID, Admin_PW, Admin_Name, Admin_Part, Admin_Team, Admin_Position
Dim Admin_Birth1, Admin_Birth2, Admin_Birth3, Admin_Birth
Dim Admin_Tel1, Admin_Tel2, Admin_Tel3, Admin_Tel
Dim Admin_Hp1, Admin_Hp2, Admin_Hp3, Admin_Hp
Dim Admin_Email, Admin_MSN, Maechul_View, Admin_Stat, Admin_Gubun
Dim Prev_Admin_Photo
Dim Code_Seq, Code_Seq_Count
Dim Data_Exist
Dim Low_Team
Dim MACADDR1, MACADDR2

sql = "SELECT Admin_Part, Admin_Team "
sql = sql & "FROM ADMIN WHERE Del_Gubun='N' AND Admin_Code="& gbl_Admin_Code
Set RS = DbCon.Execute(sql)
If RS.EOF Then
	Set RS = Nothing
	DbCon.Close
	
	F_JS_Alert "Error!!!\n등록된 정보가 없습니다.","history.back();"
	Response.End
Else
	Admin_Part     = RS("Admin_Part")
	Admin_Team     = RS("Admin_Team")
	Set RS = Nothing
End If



Arr_UploadFolder(0) = gbl_FileAbsPath & "\admin\upload\system"
Arr_SaveFileName(0) = "" '파일명 초기화

Call F_UploadComponentDefine '업로드 컴포넌트 설치 여부 확인 및 컴포넌트 정의

Admin_Part     = Admin_Part
Admin_Team     = Admin_Team
Admin_Position = UploadForm("Admin_Position")
Admin_ID       = Trim(UploadForm("Admin_ID"))
Admin_PW       = Trim(UploadForm("Admin_PW"))
Admin_Name     = Trim(UploadForm("Admin_Name"))
Admin_Birth1   = UploadForm("Admin_Birth1")
Admin_Birth2   = UploadForm("Admin_Birth2")
Admin_Birth3   = UploadForm("Admin_Birth3")
Admin_Birth    = Admin_Birth1 &"-"& Admin_Birth2 &"-"& Admin_Birth3
Admin_Tel1     = UploadForm("Admin_Tel1")
Admin_Tel2     = UploadForm("Admin_Tel2")
Admin_Tel3     = UploadForm("Admin_Tel3")
Admin_Tel      = Admin_Tel1 &"-"& Admin_Tel2 &"-"& Admin_Tel3
Admin_Hp1      = UploadForm("Admin_Hp1")
Admin_Hp2      = UploadForm("Admin_Hp2")
Admin_Hp3      = UploadForm("Admin_Hp3")
Admin_Hp       = Admin_Hp1 &"-"& Admin_Hp2 &"-"& Admin_Hp3
Admin_Email    = UploadForm("Admin_Email")
Admin_MSN      = UploadForm("Admin_MSN")
Maechul_View   = UploadForm("Maechul_View")
Admin_Stat     = UploadForm("Admin_Stat")
Admin_Gubun    = UploadForm("Admin_Gubun")
Arr_UpFile(0)  = UploadForm("Admin_Photo")
Low_Team = UploadForm("Low_Team")

MACADDR1 = UploadForm("MACADDR1")
MACADDR2 = UploadForm("MACADDR2")

Code_Seq = "" '권한등록 방지 위한 처리
Code_Seq_Count = 0 '권한등록 방지 위한 처리


sql = "SELECT COUNT(*) FROM ADMIN WHERE Admin_ID='"& Replace(Admin_ID,"'","''") &"' AND Admin_Code<>"& gbl_Admin_Code
Set RS = DbCon.Execute(sql)
Data_Exist = RS(0)
Set RS = Nothing
If Data_Exist > 0 Then
	DbCon.Close
	F_JS_Alert "아이디 중복!!!\n아이디는 사용할 수 없습니다.\n확인 후 다시 시도해 주세요.","history.back();"
	Response.End
End If


If Arr_UpFile(0) <> "" Then '업로드파일 저장
	sql = "SELECT ISNULL(Admin_Photo,'') AS Admin_Photo FROM ADMIN WHERE Admin_Code="& gbl_Admin_Code
	Set RS = DbCon.Execute(sql)
	Prev_Admin_Photo = Trim(RS(0)) '기존파일 삭제위한 추출
	Set RS = Nothing
	
	If gbl_UploadComponent = "DEXT" Then
		Arr_SaveFileName(0) = SaveDextUpload(UploadForm("Admin_Photo"),Arr_UploadFolder(0),"")
	ElseIf gbl_UploadComponent = "SITEGALAXY" Then
		Arr_SaveFileName(0) = SaveSiteGalaxyUpload(Arr_UpFile(0), Arr_UploadFolder(0), "", "")
	End If
End If


Set objCmd = Server.CreateObject("ADODB.Command")
With objCmd
	.ActiveConnection = DbCon
	.CommandType = adCmdStoredProc
	.CommandText = "SP_ADMIN_UPDATE"
	
    .Parameters.Append .CreateParameter("@Admin_Code",     adInteger, adParamInput,   0, gbl_Admin_Code)
    .Parameters.Append .CreateParameter("@Admin_Part",     adVarChar, adParamInput,   2, Admin_Part)
    .Parameters.Append .CreateParameter("@Admin_Team",     adVarChar, adParamInput,   2, Admin_Team)
	.Parameters.Append .CreateParameter("@Admin_Position", adVarChar, adParamInput,   2, Admin_Position)
    .Parameters.Append .CreateParameter("@Admin_ID",       adVarChar, adParamInput,  20, Admin_ID)
    .Parameters.Append .CreateParameter("@Admin_PW",       adVarChar, adParamInput,  50, Admin_PW)
    .Parameters.Append .CreateParameter("@Admin_Name",     adVarChar, adParamInput,  20, Admin_Name)
	.Parameters.Append .CreateParameter("@Admin_Birth",    adVarChar, adParamInput,  10, Admin_Birth)
	.Parameters.Append .CreateParameter("@Admin_Tel",      adVarChar, adParamInput,  20, Admin_Tel)
	.Parameters.Append .CreateParameter("@Admin_Hp",       adVarChar, adParamInput,  20, Admin_Hp)
	.Parameters.Append .CreateParameter("@Admin_Email",    adVarChar, adParamInput,  50, Admin_Email)
    .Parameters.Append .CreateParameter("@Admin_MSN",      adVarChar, adParamInput,  50, "")
    .Parameters.Append .CreateParameter("@Admin_Photo",    adVarChar, adParamInput, 100, Arr_SaveFileName(0))
    .Parameters.Append .CreateParameter("@Maechul_View",      adChar, adParamInput,   1, Maechul_View)
    .Parameters.Append .CreateParameter("@Admin_Stat",        adChar, adParamInput,   2, Admin_Stat)
    .Parameters.Append .CreateParameter("@Admin_Gubun",       adChar, adParamInput,   1, Admin_Gubun)
    .Parameters.Append .CreateParameter("@Code_Seq",       adVarChar, adParamInput,1000, Code_Seq)
    .Parameters.Append .CreateParameter("@Code_Seq_Count", adInteger, adParamInput,   0, Code_Seq_Count)
    .Parameters.Append .CreateParameter("@Up_User",        adInteger, adParamInput,   0, gbl_Admin_Code)
	.Parameters.Append .CreateParameter("@REGERR",         adInteger, adParamOutput,  0)
	.Parameters.Append .CreateParameter("@Low_Team",    adVarChar, adParamInput,  50, Low_Team)
	.Parameters.Append .CreateParameter("@MACADDR1",    adVarChar, adParamInput,  50, MACADDR1)
	.Parameters.Append .CreateParameter("@MACADDR2",    adVarChar, adParamInput,  50, MACADDR2)       
    .Execute
    
	REGERR  = .Parameters("@REGERR")
End With
Set objCmd = Nothing

If REGERR <> 0 Then
	DbCon.Close
	
	If Arr_SaveFileName(0) <> "" Then
		FileDelete Arr_UploadFolder(0) &"\"& Arr_SaveFileName(0) '저장된 파일 삭제
	End If
	
	F_JS_Alert "Error!!!\n데이터베이스 저장 실패!!!","history.back();"
Else
	If Arr_UpFile(0) <> "" Then '업로드파일이 있을 때 기존 파일 삭제
		FileDelete Arr_UploadFolder(0) &"\"& Prev_Admin_Photo '기존 파일 삭제
	End If
	DbCon.Close
	
	F_JS_Alert "","location.href='mypage.asp';"
End If
%>