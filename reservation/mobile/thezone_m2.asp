<!--#inClude virtual="/LibInclude/MSSQLDBCom.asp"-->
<!--#inClude virtual="/LibInclude/SqlCheck.asp"-->
<html>
<head>
<title>sub_실시간예약</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<style type="text/css">
<!--
.style1 {color: #FFFFFF}
-->
</style>

<style>
	

 td {font-size: 9pt; color:000000; text-decoration: none; line-height: 1.6}
 a:link {color:#545454;font-size:9pt;text-decoration:none;}
 a:visited {color:#545454;font-size:9pt;text-decoration:none;}
 a:hover {color:#545454;font-size:9pt;text-decoration:underline;}



</style>

</head>


<div>

<!-- ImageReady Slices (sub_실시간예약.PSD) -->

<%



	Select Case request("room")
		Case "1"
			RoomName = "(201-20평) Family Zone"

			Cu_Check = "2"

			NumFor = 4
			AddFor = 3

			Cu_ImageTitle = "인원<br>(기준4명/최대7명)"



		Case "2"
			RoomName = "(202-7평) Yellow Zone"

			Cu_Check = "1"

			NumFor = 2
			AddFor = 0

			Cu_ImageTitle = "인원<br>(기준2명/최대2명)"

		Case "3"
			RoomName = "(301-30평) Sweet Zone"

			Cu_Check = "3"

			NumFor = 8
			AddFor = 4

			Cu_ImageTitle = "인원<br>(기준8명/최대12명)"

		Case "4"
			RoomName = "(302-7평) Purple Zone"

			Cu_Check = "1"

			NumFor = 2
			AddFor = 0

			Cu_ImageTitle = "인원<br>(기준2명/최대2명)"

	End Select

	


	If request("daycheck") < 10 Then
		txtDay = "0" & request("daycheck")
	Else
		txtDay = request("daycheck")
	End If

	YearDate = left(request("todayCheck"),instr(request("todayCheck"),"-")-1)


	MonthDate = mid(request("todayCheck"),instrrev(request("todayCheck"),"-")+1)

	bgColor = request("bg")



%>





<table width="100%" border="0" cellspacing="0" cellpadding="0">

  <tr>
    <td align="center" ><table width="100%" border="0" cellspacing="0" cellpadding="0"></td>
      <tr>
        <td><img src="http://thezone.godohosting.com/images/reservation/sub_reservation3.gif" width="71" height="23" alt=""></td>
      </tr>
		<%

		

			NextYear = Year(Now()) + 1

			Select Case Cu_Check

				Case "1"

					Price01_01 = "7만원(주중)"
					Price01_02 = "7만원(주말)"

					Price03_01 = "10만원(주중)"
					Price03_02 = "14만원(주말)"

				Case "2"
					
					Price01_01 = "15만원(주중)"
					Price01_02 = "15만원(주말)"

					Price03_01 = "20만원(주중)"
					Price03_02 = "30만원(주말)"


				Case "3"
					
					Price01_01 = "20만원(주중)"
					Price01_02 = "20만원(주말)"

					Price03_01 = "30만원(주중)"
					Price03_02 = "40만원(주말)"

			End Select




			CheckDate = YearDate & "-" & MonthDate & "-" & txtDay

			ChecktoDay = Date()

			
			If Trim(ChecktoDay) > Trim(CheckDate) Then

				response.write "<script>alert('지난 날짜는 예약을 하실수 없습니다.');history.go(-1)</script>"

			End If

			
		
			'7/1 ~ 8/31 여름 성수기'
			If (Year(Now()) & "-07-01" <= CheckDate) And (Year(Now()) & "-08-31" >= CheckDate) Then

				PriceCheck = "Y"


				If bgColor = "02" Then
					bgImage02_1 = "#c4d597" 
					Price02_01 = Price02_01 & ""
				Else
					bgImage02_2 = "#c4d597" 
					Price02_02 = Price02_02 & ""
				End If
				Select Case Cu_Check
					Case "1"
						If bgColor = "02" Then
							SelectPrice = 70000
						Else
							SelectPrice = 70000
						End If
					Case "2"
						If bgColor = "02" Then
							SelectPrice = 150000
						Else
							SelectPrice = 150000
						End If
					Case "3"
						If bgColor = "02" Then
							SelectPrice = 300000
						Else
							SelectPrice = 400000
						End If
				End Select

			'2018년 11월 요청건'
			'겨울 성수기중 금요일도 주중가격으로 인하'
            ElseIf ("2018-12-07" = CheckDate) Or ("2018-12-14" = CheckDate) Or ("2018-12-21" = CheckDate) Or ("2018-12-28" = CheckDate) Or ("2019-01-04" = CheckDate) Or ("2019-01-11" = CheckDate) Or ("2019-01-18" = CheckDate) Or ("2019-01-25" = CheckDate) Or ("2019-02-01" = CheckDate) Or ("2019-02-08" = CheckDate) Or ("2019-02-16" = CheckDate) Or ("2019-02-22" = CheckDate) Then

				If bgColor = "02" Then
					bgImage03_1 = "#c4d597" 
					Price03_01 = Price03_01 & ""
				Else
					bgImage03_1 = "#c4d597" 
					Price03_01 = Price03_01 & ""
				End If

				Select Case Cu_Check
					Case "1"
						If bgColor = "02" Then
							SelectPrice = 100000
						Else
							SelectPrice = 100000
						End If
					Case "2"
						If bgColor = "02" Then
							SelectPrice = 200000
						Else
							SelectPrice = 200000
						End If
					Case "3"
						If bgColor = "02" Then
							SelectPrice = 300000
						Else
							SelectPrice = 300000
						End If
				End Select


            '성수기 중 특정일은 주말 요금으로 지정'
			'12/24, 12/31, 2/2~2/5'
            ElseIf ("2018-12-24" = CheckDate) Or ("2018-12-31" = CheckDate) Or  ("2019-02-02" = CheckDate) Or ("2019-02-03" = CheckDate) Or ("2019-02-04" = CheckDate) Or ("2019-02-05" = CheckDate) Then

				If bgColor = "02" Then
					bgImage03_2 = "#c4d597" 
					Price03_02 = Price03_02 & ""
				Else
					bgImage03_2 = "#c4d597" 
					Price03_02 = Price03_02 & ""
				End If

				Select Case Cu_Check
					Case "1"
						If bgColor = "02" Then
							SelectPrice = 140000
						Else
							SelectPrice = 140000
						End If
					Case "2"
						If bgColor = "02" Then
							SelectPrice = 300000
						Else
							SelectPrice = 300000
						End If
					Case "3"
						If bgColor = "02" Then
							SelectPrice = 400000
						Else
							SelectPrice = 400000
						End If
				End Select

			'겨울 성수기 (12월)
			ElseIf (Year(Now()) & "-12-01" <= CheckDate) And (Year(Now()) & "-12-31" >= CheckDate) Then
					
				If bgColor = "02" Then
				    bgImage03_1 = "#c4d597" '요금 적용 영역 표시 색칠하기
				    Price03_01 = Price03_01 & ""
				Else
					bgImage03_2 = "#c4d597" 
					Price03_02 = Price03_02 & ""
                End If

				Select Case Cu_Check '해당 방 가격 자동 입력
					Case "1"
					    If bgColor = "02" Then
							SelectPrice = 100000
						Else
						    SelectPrice = 140000
						End If
					Case "2"
					    If bgColor = "02" Then
							SelectPrice = 200000
						Else
						    SelectPrice = 300000
						End If
					Case "3"
					    If bgColor = "02" Then
							SelectPrice = 300000
						Else
						    SelectPrice = 400000
						End If
				End Select
			
			'겨울 성수기 (1,2월)
			ElseIf (Year(Now())+1 & "-01-01" <= CheckDate) And (Year(Now())+1 & "-02-28" >= CheckDate) Then
			    If bgColor = "02" Then
				    bgImage03_1 = "#c4d597" '요금 적용 영역 표시 색칠하기
				    Price03_01 = Price03_01 & ""
				Else
					bgImage03_2 = "#c4d597" 
					Price03_02 = Price03_02 & ""
                End If

				Select Case Cu_Check '해당 방 가격 자동 입력
					Case "1"
					    If bgColor = "02" Then
							SelectPrice = 100000
						Else
						    SelectPrice = 140000
						End If
					Case "2"
					    If bgColor = "02" Then
							SelectPrice = 200000
						Else
						    SelectPrice = 300000
						End If
					Case "3"
					    If bgColor = "02" Then
							SelectPrice = 300000
						Else
						    SelectPrice = 400000
						End If
				End Select

			'비성수기'
			Else
				If bgColor = "02" Then
					bgImage01_1 = "#c4d597" 
					Price02_01 = Price02_01 & ""
				Else
					bgImage01_2 = "#c4d597" 
					Price02_02 = Price02_02 & ""
				End If

				Select Case Cu_Check
					Case "1"
						If bgColor = "02" Then
							SelectPrice = 70000
						Else
							SelectPrice = 70000
						End If
					Case "2"
						If bgColor = "02" Then
							SelectPrice = 150000
						Else
							SelectPrice = 150000
						End If
					Case "3"
						If bgColor = "02" Then
							SelectPrice = 200000
						Else
							SelectPrice = 200000
						End If
				End Select

			End If

		  %>
      <tr>


	  <SCRIPT LANGUAGE="JavaScript">
	  <!--
		function AddMember()
		{
			var Frm = document.ReservationForm;

			var CuNumber = Frm.CuNumber.value;
			var AddNumber = Frm.AddNumber.value;
			var TotalNumber = "<%=AddFor%>";
			var CheckNumber = parseFloat(<%=NumFor%>) + 1;
			var Cu_Check = "<%=Cu_Check%>";

			var CheckNum = parseFloat(CuNumber) + parseFloat(AddNumber);


			if (Frm.OptionCheck01.value == "A")
			{
				var OptionPrice = 40000;
			}
			else if (Frm.OptionCheck01.value == "B")
			{
				var OptionPrice = 30000;
			}
			else if (Frm.OptionCheck01.value == "C")
			{
				var OptionPrice = 10000;
			}
			else if (Frm.OptionCheck01.value == "D")
			{
				var OptionPrice = 40000;
			}
			else
			{
				var OptionPrice = 0;
			}


			RoomPrice = (parseFloat(AddNumber) * 10000)


			Frm.AddPrice.value = RoomPrice;


			Frm.TotalPrice.value =  parseFloat(Frm.SelectPriceCheck.value) + parseFloat(RoomPrice) + parseFloat(OptionPrice);

		}

		function optionView()
		{
			var Frm = document.ReservationForm;
			var AddNumber = Frm.AddNumber.value;

			RoomPrice = (parseFloat(AddNumber) * 10000)


			if (Frm.OptionCheck01.value == "A")
			{
				var OptionPrice = 40000;
			}
			else if (Frm.OptionCheck01.value == "B")
			{
				var OptionPrice = 30000;
			}
			else if (Frm.OptionCheck01.value == "C")
			{
				var OptionPrice = 10000;
			}
			else if (Frm.OptionCheck01.value == "D")
			{
				var OptionPrice = 40000;
			}
			else
			{
				var OptionPrice = 0;
			}


			Frm.TotalPrice.value = parseFloat(Frm.SelectPriceCheck.value) + parseFloat(RoomPrice) + parseFloat(OptionPrice);
				

		}

		function RoomCheck()
		{
			var Frm = document.ReservationForm;

			var AddPrice = Frm.AddPrice.value;

			var RoomPrice = Frm.RoomPrice.value;

			if (AddPrice == "")
			{
				AddPrice = 0;
			}

			var PriceCheck = "<%=PriceCheck%>";
			

			if (PriceCheck == "Y")
			{
				if (RoomPrice > 400000)
				{
					RoomPriceCheck = parseFloat(RoomPrice) * 0.05;

					RoomPrice = parseFloat(RoomPrice) - parseFloat(RoomPriceCheck);
				}	
			}



			var TotalPrice = parseFloat(AddPrice) + parseFloat(RoomPrice);
	
			Frm.TotalPrice.value = TotalPrice;


			var RoomCheckCount = Frm.RoomPrice.length 

			for(z = 0 ; z < RoomCheckCount ; z ++)
			{
				if (Frm.RoomPrice[z].selected == true)
				{
					Frm.roomCheck.value = Frm.RoomPrice[z].text;
				}

			}


		}


		function R_Check()
		{
			var Frm = document.ReservationForm;

			if (Frm.txtName.value=="")
			{
				alert("\n 이름을 입력해주세요.");
				Frm.txtName.focus();
				return false;
			}


			if (Frm.txtTell.value=="")
			{
				alert("\n 연락처를 입력해주세요.");
				Frm.txtTell.focus();
				return false;
			}



		}
	  //-->
	  </SCRIPT>


	  <%

		CheckDate = CleanChars(CheckDate)

		RoomNo = CleanChars(request("room"))
	  
		Set Cmd = Server.CreateObject("ADODB.Command")

		StrSql = "Select a.PID, RoomNo, RoomType, S_Date, isnull(roomCheck, '') as roomCheck, CuNumber, AddNumber, TotalPrice, txtName, txtHp, txtTell, reDate, CheckTime, OptionCheck01 From TheZoneCheckDate a "


		StrSql = StrSql & " left Join TheZoneCheckSubDate b On a.PID = b.MainPID " 

		
		StrSql = StrSql & "  Where (DateView = ? Or S_Date = ?)  And RoomNo = ? And RoomType <> 'D'" 
		





		With Cmd
			.ActiveConnection = strcon
			.CommandText = StrSql
			.CommandType = adCmdText
			.Parameters.Append .CreateParameter("@S_Date",adVarchar,adparaminput, 300, CheckDate)
			.Parameters.Append .CreateParameter("@S_Date",adVarchar,adparaminput, 300, CheckDate)
			.Parameters.Append .CreateParameter("@RoomNo",adVarchar,adparaminput, 1,RoomNo)
			Set RS1 = .Execute
			
			If Not RS1.Eof Then

				
				txtName = RS1("txtName")
				txtTell = RS1("txtTell")

				RoomType = RS1("RoomType")
				S_Date = RS1("S_Date")
				roomCheck = RS1("roomCheck")
				CuNumberDB = RS1("CuNumber")
				AddNumberDB = RS1("AddNumber")
				TotalPrice = RS1("TotalPrice")


				CheckTime = RS1("CheckTime")
				OptionCheck01 = RS1("OptionCheck01")



				txtTell = Left(RS1("txtTell"), 3) & "-***-" & Right(RS1("txtTell"), 4)

				




				Select Case Len(txtName)
					Case 2
						
						viewName = Left(RS1("txtName"), 1) & "*"
						
						
					Case 3

						viewName = Left(RS1("txtName"), 1) & "*" & Right(RS1("txtName"), 1)

					Case Else

						viewName = Left(RS1("txtName"), 1) & "*" & Right(RS1("txtName"), 1)
						
				
				End Select
				
				

			End If

		End With

		RS1.Close()

		Set Cmd = Nothing



	  %>


	  <form name="ReservationForm" method="Post" action="thezone_mSend.asp" onsubmit="return R_Check();" >
		<input type="hidden" value="<%=CheckDate%>" name="S_Date">
		<input type="hidden" value="" name="roomCheck">
		<input type="hidden" value="<%=request("room")%>" name="roomNo">
		<input type="hidden" value="<%=SelectPrice%>" name="SelectPriceCheck">




        <td height="72" background="image/sub_reservation3_bg.gif"><table width="700" border="0" cellspacing="0" cellpadding="0"></td>
          <tr>
            <td width="30">&nbsp;</td>
            <td width="50" style="font-size:12px;font-weight: bold;" align="right"><%=YearDate%> </td>
            <td width="25">년</td>
            <td width="30" style="font-size:12px;font-weight: bold;" align="right"><%=MonthDate%> </td>
            <td width="25">월</td>
            <td width="30" style="font-size:12px;font-weight: bold;" align="right"><%=txtDay%> </td>
            <td width="60">일</td>
            <td>
				<%If RoomType = "" Then%>
					<select name="RoomPrice" id="RoomPrice" onchange="RoomCheck()" >
					  <option value="<%=SelectPrice%>" selected>1박 2일</option>
					  <option  value="<%=SelectPrice * 2%>" >2박 3일</option>
					  <option  value="<%=SelectPrice * 3%>">3박 4일</option>
					</select>
				<%Else%>

					<%
						If roomCheck = "" Then

							roomCheck = "1박 2일"

						End If
					%>
					<span style="font-size:15px;font-weight:bold"><%=roomCheck%></span>
				<%End If%>



			</td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td height="30">&nbsp;</td>
      </tr>
	  <!--예약정보-->
      <tr>
        <td height="30"><img src="image/sub_reservation4.gif" width="71" height="23" alt=""></td>
      </tr>
<tr>
<td bgcolor="#fbf9fa"><table width="1" border="0" cellspacing="0" cellpadding="0" bgcolor="#fbf9fa" style="border:1px solid #d4d4d4">

<!--예약자-->
		<%If viewName = "" Then%>
		<tr>
            <td width="124" height="34" align="center" style="border-right:1px solid #d4d4d4;border-bottom:1px solid #d4d4d4"><img src="image/name.png" alt=""></td>
            <td colspan="4" style="border-bottom:1px solid #d4d4d4"> <span class="style1">---</span><input name="txtName" type="text" id="txtName" value="<%=viewName%>" size="12" ></td>
            </tr>
 <!--연락처-->
		  <tr>
            <td width="124" height="34" align="center" style="border-right:1px solid #d4d4d4;border-bottom:1px solid #d4d4d4"><img src="image/tell.png" alt=""></td>

            <td colspan="4"  style="border-bottom:1px solid #d4d4d4"><span class="style1">---</span><input name="txtTell" type="text" id="txtTell" value="<%=txtTell%>" size="12" ></td>
            </tr>
          <tr>
		<%Else%>
			
			<tr>
            <td width="100%" height="34" align="center" style="border-right:1px solid #d4d4d4;border-bottom:1px solid #d4d4d4"><img src="image/name.png" alt=""></td>


            <td colspan="4"  style="border-bottom:1px solid #d4d4d4"><span class="style1">---</span><%=viewName%></td>
            </tr>
          <tr>



		  <tr>
            <td width="100%" height="34" align="center" style="border-right:1px solid #d4d4d4;border-bottom:1px solid #d4d4d4"><img src="image/tell.png" alt=""></td>
            <td colspan="4"  style="border-bottom:1px solid #d4d4d4"><span class="style1">---</span><%=txtTell%></td>
            </tr>



		<%End If%>




<!--객실명-->
          <tr>
            <td width="124" height="34" align="center" style="border-right:1px solid #d4d4d4;border-bottom:1px solid #d4d4d4"><img src="image/sub_reservation4_1.gif" width="34" height="16" alt=""></td>

            <td colspan="4" style="border-bottom:1px solid #d4d4d4"><span class="style1">---</span><%=RoomName%></td>

          </tr>

<!--부가서비스-->
		  <tr>
            <td width="124" height="34" align="center" style="border-right:1px solid #d4d4d4;border-bottom:1px solid #d4d4d4"><img src="image/a1.gif" alt=""></td>
      <td width="206" colspan="2" style="border-right:1px solid #d4d4d4;border-bottom:1px solid #d4d4d4">
				<table border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td><span class="style1">---</span></td>
						<Td>

							<select Name= "OptionCheck01" onchange="optionView()"> 
								<option value=""></option>
								
								<option value="">실내바베큐장이용요금</option>
								<option value="">----------------------------------</option>

								<option value="A" <%If OptionCheck01 = "A" Then%> selected<%End If%>>철판구이 및 버너대여</option>
								
								<option value="B" <%If OptionCheck01 = "B" Then%> selected<%End If%>>철판구이 3만원</option>
								<option value="C" <%If OptionCheck01 = "C" Then%> selected<%End If%>>버너대여 1만원</option>
								
								
								<option value="">----------------------------------</option>
								<option value="">야외바베큐장이용요금</option>
								<option value="">----------------------------------</option>



								<option value="D" <%If OptionCheck01 = "D" Then%> selected<%End If%>>숯불구이 4인당 1만원</option>

							</Select>
							
						</td>

						
					</tr>
				</table>
			</td>

			<td width="124" height="34" align="center" style="border-right:1px solid #d4d4d4;border-bottom:1px solid #d4d4d4"></td>
            <td  style="border-bottom:1px solid #d4d4d4"><span class="style1">---</span>
				
			</td>
		  </tr>
<!--인원-->




<!--테스트수정-->
<tr>
			<td height="35" align="center" style="border-right:1px solid #d4d4d4;border-bottom:1px solid #d4d4d4"><font style="font-size:11px; color:#555; font-weight:bold;"><%=Cu_ImageTitle%></font></td>
<!--테스트수정
			<%If Cu_Check = "1" Then%>
				<td height="35" align="center" style="border-right:1px solid #d4d4d4;border-bottom:1px solid #d4d4d4"><img src="image/sub_reservation4_3.gif" width="95" height="18" alt=""></td>
			  <%Else%>
				<td height="35" align="center" style="border-right:1px solid #d4d4d4;border-bottom:1px solid #d4d4d4"><img src="image/a.gif" width="95" height="18" alt=""></td>
			  <%End If%>
-->
				
				<%If txtName = "" Then%>
					<td width="20" style="border-right:1px solid #d4d4d4;border-bottom:1px solid #d4d4d4" >
						<table border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td style="padding-left:15px">
									  <select name="CuNumber" id="CuNumber" onchange="AddMember()">
										<%
											For I = 1 To NumFor
										%>
												<option value="<%=i%>" <%If I = NumFor Then%> Selected<%End If%>><%=I%></option>
										<%
											Next
										%>
									  </select>
								</td>
								<td>
									 <img src="image/sub_reservation4_7.gif" width="15" height="20" alt="">
								</td>
							</tr>
						</table>
					  </td>
<!--추가-->
					<td width="100" style="border-right:1px solid #d4d4d4;border-bottom:1px solid #d4d4d4">
						<table border="0" cellspacing="0" cellpadding="0">
							<tr>
								<TD style="padding-left:15px"><img src="image/sub_reservation4_8.gif" width="31" height="20" alt=""> </TD>
								<td style="" >
									<select name="AddNumber" id="AddNumber" onchange="AddMember()">
									  <%
											For I = 0 To AddFor
										%>
												<option value="<%=i%>"><%=I%></option>
										<%
											Next
										%>


									</select>

								</td>
								<td>
									 <img src="image/sub_reservation4_7.gif" width="15" height="20" alt="">
								</td>
							</tr>
						</table>
  				</td>
</tr>
<!--추가요금-->
<tr>
					
				  <td width="124" style="border-right:1px solid #d4d4d4;border-bottom:1px solid #d4d4d4"><div align="center"><img src="image/sub_reservation4_9.gif" width="51" height="18" alt=""></div></td>

				<td width="100%" colspan="4" style="border-bottom:1px solid #d4d4d4"> 
					
					<table border="0" cellspacing="0" cellpadding="0">
						<tr>
							<TD style="padding-left:23px"><input name="AddPrice" type="text" id="AddPrice" value="" size="12" readonly></TD>
							
							<td>
								  <img src="image/sub_reservation4_10.gif" width="16" height="18" alt="">
							</td>
						</tr>

					</table>

				 </td>
			<%Else%>

				<td width="100%" style="border-right:1px solid #d4d4d4;border-bottom:1px solid #d4d4d4" >
						<table border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td  style="padding-left:15px;padding-top:5px">
									  <%=CuNumberDB%>&nbsp;
								</td>
								<td>
									 <img src="image/sub_reservation4_7.gif" width="15" height="20" alt="">
								</td>
							</tr>

						</table>
					  </td>

					<td width="100%" style="border-right:1px solid #d4d4d4;border-bottom:1px solid #d4d4d4">
						<table border="0" cellspacing="0" cellpadding="0">
							<tr>
								<TD style="padding-left:15px"><img src="image/sub_reservation4_8.gif" width="31" height="20" alt=""> </TD>
								<td style=";padding-top:5px" >
									&nbsp;<%=AddNumberDB%>&nbsp;
								</td>
								<td>
									 <img src="image/sub_reservation4_7.gif" width="15" height="20" alt="">
								</td>
							</tr>

						</table>
					</td>

				  <td colspan="2" style="border-bottom:1px solid #d4d4d4"></td>

			<%End If%>
 </tr>

<!--비수기요금-->

          <tr>
            <td height="34" style="border-right:1px solid #d4d4d4;border-bottom:1px solid #d4d4d4" align="center"><img src="image/sub_reservation4_4.gif" width="60" height="17" alt=""></td>
            <td bgcolor="<%=bgImage01_1%>" style="border-right:1px solid #d4d4d4;border-bottom:1px solid #d4d4d4"><div align="center"><%=Price01_01%></div></td>
            <td bgcolor="<%=bgImage01_2%>" style="border-right:1px solid #d4d4d4;border-bottom:1px solid #d4d4d4"><div align="center"><%=Price01_02%></div></td>

          </tr>


<!--성수기요금-->


 <!--준성수기요금-->

		  <tr>
            <td height="35" style="border-right:1px solid #d4d4d4;border-bottom:1px solid #d4d4d4" align="center"><img src="http://thezone.godohosting.com/images/reservation/sub_reservationWinter.gif" width="84" height="17" alt=""></td>


            <td bgcolor="<%=bgImage03_1%>" style="border-right:1px solid #d4d4d4;border-bottom:1px solid #d4d4d4"><div align="center"><%=Price03_01%></div></td>


            <td bgcolor="<%=bgImage03_2%>" style="border-right:1px solid #d4d4d4;border-bottom:1px solid #d4d4d4" ><div align="center"><%=Price03_02%></div></td>


          </tr>


 <!--총요금-->
<tr>
            <td style="border-right:1px solid #d4d4d4;border-bottom:1px solid #d4d4d4"><div align="center"><img src="image/sub_reservation4_11.gif" width="51" height="18" alt=""></div></td>
				
<td colspan="2" style="border-right:1px solid #d4d4d4;border-bottom:1px solid #d4d4d4">
<table border="0" cellspacing="0" cellpadding="0">

							<%If TotalPrice = "" Then%>
								<TD style="padding-left:23px">  <input name="TotalPrice" type="text" id="TotalPrice" value="<%=SelectPrice%>" size="12" readonly></TD>
							<%Else%>
								<TD style="padding-left:23px">  <input name="TotalPrice" type="text" id="TotalPrice" value="<%=TotalPrice%>" size="12" readonly></TD>
							<%End If%>
							
							<td>
								  <img src="image/sub_reservation4_10.gif" width="16" height="18" alt="">
							</td>     
							</table>
              </td>
</tr>
 </table>


      <tr>
        <td height="19">&nbsp;</td>
      </tr>
		
<!--예약하기버튼*//-->

	  <%If txtName = "" Then%>
		  <tr>
			<Td>
				<input type="image" src="image/r_b.GIF" border="0">
			</td>
		  </tr>
		<%End If%>


	  </form>

	  <tr>
        <td height="19">&nbsp;</td>
      </tr>
<tr><td>
<br>
* 카드결제시 부과세 10%가 추가됩니다.<br>
* 실내바베큐장 예약은 전화연락바랍니다.<br>
* 추가인원 초과시 연락바랍니다.<br><br><br>
</td></tr>


    </table></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td height="50">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
</center>


<div><img src="schedule/thezone/aa.jpg" alt="" title="" border="0" style="max-width:100%;" /></div>

<div style="margin-top:43px"></div>

<div><img src="schedule/thezone/sub_reservation6.jpg" alt="" title="" border="0" style="max-width:100%;" /></div>






<!-- End ImageReady Slices -->

</div>
</html>