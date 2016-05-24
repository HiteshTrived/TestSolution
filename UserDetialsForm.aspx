<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserDetialsForm.aspx.cs" Inherits="UserDetialsForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
   

</head>
<body>
    <form id="form1" runat="server">
    <div>
      <table  style="border: solid 1px #3366CC;">
            <tr>
                <td colspan="4" style="height: 30px; background-color: #f5712b;">
                    <span class="TextTitle" style="color: #FFFFFF;">Userdetails Form</span>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblerror" runat ="server" Visible ="False" />
                </td>
            </tr>
            <tr>
                <td >
                    <table id="TableLogin" class="HomePageControlBGLightGray"  
                        runat="server" >
                        <tr>
                            <td colspan="3" >
                                <asp:Label ID="LabelMessage" ForeColor="Red" runat="server" EnableViewState="False"
                                    Visible="False"></asp:Label>
                            </td>
                        </tr>
                        <tr style="font-weight: normal; color: #000000">
                            <td>
                                <span>UserName:</span>;
                            </td>
                            <td  style="padding-left: 10px;">
                                <asp:TextBox ID="txtUserName" runat="server" CssClass="textbox" Width="262px"
                                    MaxLength="50" Height="34px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td >
                                <span class="TextTitle">Password:</span>
                            </td>
                            <td  style="padding-left: 10px;">
                                <asp:TextBox ID="txtPassword" runat="server" CssClass="textbox" Width="261px"
                                    TextMode="Password" Height="34px"></asp:TextBox>
                               
                            </td>
                            <td>
                                <asp:RegularExpressionValidator ID="RegExp1" runat="server"    
ErrorMessage="Password length must be between 7 to 10 characters"
ControlToValidate="txtPassword"    
ValidationExpression="^[a-zA-Z0-9'@&#.\s]{7,10}$" />
                            </td>
                        </tr>
                        <tr>
                            <td >
                                <span class="TextTitle">Phone Number:</span>
                            </td>
                            <td  style="padding-left: 10px;">
                                <asp:TextBox ID="txtPhoneNumber" runat="server" CssClass="textbox" Width="258px"
                                     Height="34px"></asp:TextBox>
                                <br />
                            </td>
                            <td>
                                  <asp:RegularExpressionValidator ID="RegPhone1" runat="server" ControlToValidate="txtPhoneNumber"
                                                        ErrorMessage="Please Enter Correct Phone Number"
                                                        ValidationExpression="[0-9]+(;[0-9]+)*"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td >
                                <span class="TextTitle">Gender:</span>
                            </td>
                            <td  style="padding-left: 10px;">
                                 <asp:RadioButton ID="rdbMale" GroupName="Gender" Text="Male" runat="server" />  
  
                                 <asp:RadioButton ID="rdbFemale" GroupName="Gender" Text="Female" runat="server" /> 
                                <asp:RadioButton ID="rdbOthers" GroupName="Gender" Text="Other" runat="server" /> 
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td >
                            </td>
                            <td  style="padding-left: 10px;">
                                <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" Width="87px" />
                                <br />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
