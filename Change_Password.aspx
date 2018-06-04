<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Change_Password.aspx.cs" Inherits="PPT.Change_Password" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 100%;
            font-family: Arial;
            font-size: x-small;
        }
        .style2
        {
            text-align: center;
            font-weight: 700;
        }
        .style5
        {
            width: 100%;
        }
        .style11
        {
            width: 9px;
        }
        .style12
        {
            width: 205px;
        }
        .style13
        {
            width: 134px;
            font-weight: 700;
        }
        .style14
        {
            width: 435px;
            text-align: center;
        }
        .style15
        {
            width: 314px;
        }
        .style16
        {
            width: 312px;
        }
        .style17
        {
            width: 257px;
            height: 233px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="style5">
            <tr>
                <td class="style15">
                    &nbsp;</td>
                <td class="style14">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style15">
                    &nbsp;</td>
                <td class="style14">
                    <img alt="" class="style17" src="Images/DS%20259%20x%20235.jpg" /></td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style15">
                    &nbsp;</td>
                <td class="style14">
                    <asp:Label ID="lblErrorMsg" runat="server" 
                        
                        style="color: #CC3300; font-weight: 700; font-family: Arial, Helvetica, sans-serif; font-size: small;"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
    <div>
    
        <table class="style1">
            <tr>
                <td class="style16">
                    &nbsp;</td>
                <td class="style13">
                    Enter Old Password:</td>
                <td class="style11">
                <asp:Label ID="Lbl_Old_PWD" runat="server" Font-Size="Small" ForeColor="#FF3300" 
                    Text="*"></asp:Label>
                </td>
                <td class="style12">
                    <asp:TextBox ID="txt_Old_Pwd" runat="server" Font-Size="X-Small" 
                        TextMode="Password" Width="155px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="Req_Old_Pwd" ValidationGroup="Update" runat="server" 
                        ControlToValidate="txt_Old_Pwd" ErrorMessage="Required" Font-Size="X-Small" 
                        ForeColor="Red" style="font-family: Aharoni"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style16">
                    <br />
                    <asp:CompareValidator ID="Com_New_Pwd" ValidationGroup="Update" runat="server" 
                        ControlToCompare="txt_Old_Pwd" ControlToValidate="txt_New_Pwd" 
                        ErrorMessage="New Password must be diffrent from Old Password" 
                        Font-Size="X-Small" ForeColor="Red" Operator="NotEqual" 
                        style="font-weight: 700"></asp:CompareValidator>
                </td>
                <td class="style13">
                    Enter New Password:</td>
                <td class="style11">
                <asp:Label ID="Lbl_New_PWD" runat="server" Font-Size="Small" ForeColor="#FF3300" 
                    Text="*"></asp:Label>
                </td>
                <td class="style12">
                    <asp:TextBox ID="txt_New_Pwd" runat="server" Font-Size="X-Small" 
                        TextMode="Password" Width="155px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="Req_New_Pwd" ValidationGroup="Update" runat="server" 
                        ControlToValidate="txt_New_Pwd" ErrorMessage="Required" Font-Size="X-Small" 
                        ForeColor="Red" style="font-family: Aharoni"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style16">
                    <asp:CompareValidator ID="Com_Con_Pwd" ValidationGroup="Update" runat="server" 
                        ControlToCompare="txt_New_Pwd" ControlToValidate="txt_Con_Pwd" 
                        ErrorMessage="New Password and Confirm Password Does Not Match" 
                        Font-Size="X-Small" ForeColor="Red" style="font-weight: 700"></asp:CompareValidator>
                </td>
                <td class="style13">
                    Confirm Password:</td>
                <td class="style11">
                <asp:Label ID="Lbl_Confirm_PWD" runat="server" Font-Size="Small" ForeColor="#FF3300" 
                    Text="*"></asp:Label>
                </td>
                <td class="style12">
                    <asp:TextBox ID="txt_Con_Pwd" runat="server" Font-Size="X-Small" 
                        TextMode="Password" Width="155px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="Req_Con_Pwd" ValidationGroup="Update" runat="server" 
                        ControlToValidate="txt_Con_Pwd" ErrorMessage="Required" Font-Size="X-Small" 
                        ForeColor="Red" style="font-family: Aharoni"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style16">
                    &nbsp;</td>
                <td class="style13">
                    &nbsp;</td>
                <td class="style11">
                    &nbsp;</td>
                <td class="style12">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style16">
                    &nbsp;</td>
                <td class="style13">
                    &nbsp;</td>
                <td class="style11">
                    &nbsp;</td>
                <td class="style12">
                    <asp:Button ID="Btn_Update" runat="server" ValidationGroup="Update" Font-Size="X-Small" Text="Update" 
                        onclick="Btn_Update_Click" />
                        <asp:Button ID="btnback" runat="server" Font-Size="X-Small" Text="Back" onclick="btnback_Click" 
                        />
                </td>
                 
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style16">
                    &nbsp;</td>
                <td class="style2" colspan="3">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style16">
                    &nbsp;</td>
                <td class="style2" colspan="3">
                    Powered by DiagnoSearch Life Sciences Pvt. Ltd.</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
