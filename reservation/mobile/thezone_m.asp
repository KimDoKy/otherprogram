 <!--#inClude virtual="/LibInclude/MSSQLDBCom.asp"-->

<style>
	

 td {font-size: 9pt; color:000000; text-decoration: none; line-height: 1.6}
 a:link {color:#545454;font-size:9pt;text-decoration:none;}
 a:visited {color:#545454;font-size:9pt;text-decoration:none;}
 a:hover {color:#545454;font-size:9pt;text-decoration:underline;}



 .cal_redtext
{
  float:left;
  padding:3px;
  font-family:dotum,dotumche;
  font-size:0.90em;
  color:#ff0000;
  font-weight:bold;  
  background-color: #CECECE
    }


</style>

<%
 rDay = Request("mov")



 If rDay = "" Then

	 yy   = Year(Now())
	 mm  = Month(Now())
	 dd   = Day(Now())

	
	If mm < 10 Then
		
		mm = "0" & mm

	Else

		mm =  mm
		
	End If


	 ww  = WeekDay(DateSerial(yy,mm,1)) - 1



 Else

	yy = Left(rDay, 4)
	mm  = mid(rDay, 6, 2)
	dd   = right(rDay, 2)
	ww  = WeekDay(DateSerial(yy,mm,1)) - 1

 End If


 endDay = Day(DateAdd("d",-1,(DateAdd("m",1,DateSerial(yy,mm,1)))))
 prvDay =  DateAdd("m",-1,DateSerial(yy,mm,1))'이전 달
 nxtDay =  DateAdd("m",1,DateSerial(yy,mm,1))'다음 달



 todayCheck = yy & "-" & mm
%>
<table width="100%" height="38" border="0" cellpadding="0" cellspacing="0">
	<tr>
			<td><a href="thezone_m.asp?mov=<%=prvDay%>"><img src="images/sub_cut2_01.gif" width="5" height="37" alt="" border="0"></a></td>
		<td><a href="thezone_m.asp?mov=<%=prvDay%>"><img src="images/sub_cut2_02.gif" width="100" height="37" alt="" border="0"></a></td>
		<td width="100" height="37" alt="" align="center"><b><%=yy%>년 <%=mm%>월</b></td>
		<td>
			<a href="thezone_m.asp?mov=<%=nxtDay%>"><img src="images/sub_cut2_04.gif" width="100" height="37" alt="" border="0"></a></td>
			<td><a href="thezone_m.asp?mov=<%=prvDay%>"><img src="images/sub_cut2_05.gif" width="5" height="37" alt="" border="0"></a></td>
	</tr>
</table>



<table width="100%" height="38" border="0" cellpadding="0" cellspacing="0">
	<tr>

		<td>
			<img src="images/sub_cut3_02.gif" width="62" height="38" alt=""></td>
		<td>
			<img src="images/sub_cut3_03.gif" width="75" height="38" alt=""></td>
		<td>
			<img src="images/sub_cut3_04.gif" width="69" height="38" alt=""></td>
		<td>
			</td>
	</tr>
</table>


<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td align="center">
			<table   border="0" cellpadding="0" cellspacing="0" >
				<tr>
					<td ><img src="images/sub_cut4_02.gif" width="100%" height="25" alt=""></td>
					<td><img src="images/sub_cut4_03.gif" width="100%" height="25" alt=""></td>
					<td><img src="images/sub_cut4_04.gif" width="100%" height="25" alt=""></td>
					<td><img src="images/sub_cut4_05.gif" width="100%" height="25" alt=""></td>
					<td><img src="images/sub_cut4_06.gif" width="100%" height="25" alt=""></td>
					<td><img src="images/sub_cut4_07.gif" width="100%" height="25" alt=""></td>
					<td><img src="images/sub_cut4_08.gif" width="100%" height="25" alt=""></td>
				</tr>

				<tr>
				<%
					For i = 1 To ww Step 1
				%>
						<TD style="border-left:1px dashed #cacaca;border-bottom:1px dashed #cacaca;height:108px">&nbsp;</TD>
				<%
					 Next
					 For i = 1 To endDay Step 1

							
						
				%>
							<%If (i+ww) Mod 7 = 0 Then%>
								
								<td style="border-right:1px dashed #cacaca;border-bottom:1px dashed #cacaca;height:108px" valign=top>
							
									<div class="cal_redtext">

										<FONT COLOR="blue"><%=i%></FONT>
										
										<%
											bgImage = "01"
										%>


						     <%ElseIf (i+ww) Mod 7 = 1 Then%>
								<td style="border-left:1px dashed #cacaca;border-right:1px dashed #cacaca;border-bottom:1px dashed #cacaca;height:108px" valign=top>
							
									<div class="cal_redtext">
										
										<FONT COLOR="red"><%=i%></FONT>

										<%
											bgImage = "02"
										%>

							 <%Else%>
								<%If i = 1 Then%>
									<td style="border-left:1px dashed #cacaca;border-right:1px dashed #cacaca;border-bottom:1px dashed #cacaca;height:108px" valign=top>	
								<%Else%>
									<td style="border-right:1px dashed #cacaca;border-bottom:1px dashed #cacaca;height:108px" valign=top>
								<%End If%>
								
							
									<div class="cal_redtext">
										<%
											If (i+ww) Mod 7 = 6 Then

												bgImage = "01"
										
											Else

												bgImage = "02"

											End If
										%>




									
										<FONT COLOR="black"><%=i%></FONT>

										
						     <%End If%>
							 </div><br>


							 <div style=";line-height:15px;margin-top:10px;text-align:left;padding-right:5px">
							
							 <%
								
								If i < 10 Then

									SqlDay = "0" & i

								Else

									SqlDay =  i

								End If
								

								For Y = 1 To 4
							 
									Set Cmd = Server.CreateObject("ADODB.Command")

									StrSql = "Select RoomType From TheZoneCheckDate a " 

									StrSql = StrSql & " left Join TheZoneCheckSubDate b On a.PID = b.MainPID " 

									
									StrSql = StrSql & " Where (DateView = ? Or S_Date = ?)  And RoomNo = ? And RoomType <> 'D'" 


									With Cmd
										.ActiveConnection = strcon
										.CommandText = StrSql
										.CommandType = adCmdText
										.Parameters.Append .CreateParameter("@S_Date",adVarchar,adparaminput, 300,todayCheck & "-" & SqlDay)
										.Parameters.Append .CreateParameter("@S_Date",adVarchar,adparaminput, 300,todayCheck & "-" & SqlDay)
										.Parameters.Append .CreateParameter("@RoomNo",adVarchar,adparaminput, 1,Y)
										Set RS1 = .Execute
										
										If Not RS1.Eof Then

											
											Select Case RS1(0)
												Case "N"
													RoomIcon = "<img src='/image/r3.gif' border='0' >"

													ViewCheck = "Y"
												Case "Y"
													RoomIcon = "<img src='/image/r2.gif' border='0' >"

													ViewCheck = "Y"
											End Select
											
										Else

											RoomIcon = "<img src='/image/r1.gif' border='0' >"

											ViewCheck = "N"

										End If

									End With

									RS1.Close()

									Set Cmd = Nothing


									Select Case Y
										Case 1
											RoomName = "(201) Family"
										Case 2
											RoomName = "(202) Yellow"
										Case 3
											RoomName = "(301) Sweet"
										Case 4
											RoomName = "(302) Purple"

									End Select


									Select Case todayCheck & "-" & SqlDay

										Case "2014-09-05"

											bgImage = "01"

										Case "2014-09-06"

											bgImage = "01"

										Case "2014-09-07"
											
											bgImage = "01"

										Case "2014-09-08"

											bgImage = "01"

										Case "2014-09-09"

											bgImage = "01"

										Case "2014-09-10"

											bgImage = "01"

									End Select


								

							 %>
									<%If ViewCheck = "N" Then%>
										<a href="thezone_m2.asp?room=<%=Y%>&todayCheck=<%=todayCheck%>&daycheck=<%=i%>&bg=<%=bgImage%>">
									<%Else%>
										<a href="javascript:alert('이미 예약되어 있는 룸입니다.')">
									<%End If%>
										<%=RoomIcon%><%=RoomName%></a><br>
									
									

							 <%

								Next 
							 %>
							
							 </div>
							 
						</td>
				<%
					  If (i+ww) Mod 7 = 0 then
				%>
				
						</tr>
						<tr>
				<%
					  End If
					 Next
					 Do Until ((i+ww) Mod 7 = 1 )
					%>
					 <TD style="border-right:1px dashed #cacaca;border-bottom:1px dashed #cacaca;height:108px">&nbsp;</TD>
					<%
					  i = i +1
					  checkNum = checkNum + 1
					 Loop
					%>
				</tr>
			</table>
		</td>
		
	</tr>

	
</table>
<!-- End Save for Web Slices -->
</body>
</html>