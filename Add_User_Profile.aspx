<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Add_User_Profile.aspx.cs" Inherits="PPT.Add_User_Profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

    <div class="txt_center Header">
       Add User Profile
    </div>
     <div class="row">
        <div class="lblError">
             <asp:Label ID="lblErrorMsg" runat="server"></asp:Label>
        </div>
    </div>
   <table>  
     <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>           
        <tr>
            <td class="label">
                Select Project:</td>
            <td class="requiredSign">
                <asp:Label ID="Label3" runat="server"
                    Text="*"></asp:Label>
                </td>
            <td class="Control">
          
                      <asp:DropDownList ID="Drp_Project_Name" runat="server" AutoPostBack="True"  class="form-control required drpControl"                             
                            onselectedindexchanged="Drp_Project_Name_SelectedIndexChanged">
                        </asp:DropDownList>
                       
               
            </td>
          
            <td class="style10">
                </td>
        </tr>
        <tr>
            <td class="label">
                Select User Group:</td>
            <td class="requiredSign">
                <asp:Label ID="Lbl_User_Group" runat="server" 
                    Text="*"></asp:Label>
                </td>
            <td class="Control">   
                     
                        <asp:DropDownList ID="Drp_User_Group" runat="server"   class="form-control drpControl required" 
                           >
                        </asp:DropDownList>
                     
                    
            </td>
            <td class="style23">
                </td>
        </tr>
         <tr>
            <td class="label">
                Select Country:</td>
            <td class="requiredSign">
                <asp:Label ID="Label2" runat="server"
                    Text="*"></asp:Label>
                </td>
            <td class="Control">
           
                     <asp:DropDownList ID="drpCountry" runat="server" class="form-control drpControl required">
                        </asp:DropDownList>
                 
               
            </td>
          
            <td class="style10">
                </td>
        </tr>
        <tr>
            <td class="label">
                Enter User Name:</td>
            <td class="requiredSign">
                <asp:Label ID="Lbl_User_Name" runat="server"
                    Text="*"></asp:Label>
                    </td>
            <td class="Control">
                <asp:TextBox ID="txt_User_Name" runat="server"  class="form-control drpControl required"></asp:TextBox>
                 
            </td>
            <td class="style27">
                </td>
        </tr>
        <tr>
            <td class="label">
                Enter User Display Name</td>
            <td class="requiredSign">
                <asp:Label ID="Lbl_User_Dis_Name" runat="server" 
                    Text="*"></asp:Label>
                </td>
            <td class="Control">
                <asp:TextBox ID="txt_User_Dis_Name" runat="server" class="form-control drpControl required"
                    ></asp:TextBox>
                  
            </td>
            <td class="style38">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="label">
                Email ID</td>
            <td class="requiredSign">
                <asp:Label ID="Lbl_Email" runat="server"
                    Text="*"></asp:Label>
                </td>
            <td class="Control">
                <asp:TextBox ID="txt_EmailID" runat="server" class="form-control drpControl"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="Req_EmailID" runat="server" 
                        ControlToValidate="txt_EmailID" ErrorMessage="Required" Font-Size="X-Small" 
                        ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="Reg_Exp_Email_ID" runat="server" 
                    ControlToValidate="txt_EmailID" ErrorMessage="Invalid Email ID" 
                    Font-Size="X-Small" ForeColor="#CC3300" style="font-weight: 700" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </td>
            <td class="style38">
                </td>
        </tr>
       

            <tr>
            <td class="label"> Select Site ID
                </td>
           <td class="requiredSign">
                 <asp:Label ID="Label1" runat="server"  
                    Text="*"></asp:Label>
                    </td>
            <td class="Control">Select All
                <asp:CheckBox ID="Chk_Select_All" runat="server" AutoPostBack="True" 
                    oncheckedchanged="Chk_Select_All_CheckedChanged" style="font-size: x-small" />
                    </td>
            </tr> 
        <tr>
            <td class="style11">
              </td>
            <td class="style8">
                &nbsp;</td>
       <td>
               <asp:GridView ID="grdINV" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False" CssClass="Grid  margin10px" AlternatingRowStyle-CssClass="alt" 
                PagerStyle-CssClass="pgr">
            
            <Columns>               
                <asp:TemplateField HeaderText="Investigator ID">
                    <ItemTemplate>
                        <asp:TextBox ID="txt_INVID" runat="server" Text='<%# Bind("INVID") %>' 
                            BorderStyle="None" Enabled="False" Font-Overline="False" Font-Size="X-Small" 
                            Height="16px" Width="50px"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Investigator Name">
                    <ItemTemplate>
                        <asp:TextBox ID="txt_INVNAME" runat="server" 
                            Text='<%# Bind("INVNAME") %>' Enabled="False" Font-Bold="True" 
                            Font-Overline="False" Font-Size="X-Small" Height="16px" Width="100px"></asp:TextBox>
                        &nbsp;
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Select Investigator">            
                    <ItemTemplate>
                        <asp:CheckBox ID="Chk_Sel_Fun" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
          
          
            </asp:GridView>       
                                 
            </td>        
        </tr>
        <tr>
            <td class="style41">
                &nbsp;</td>
            <td class="style10">
                &nbsp;</td>
            <td class="style18">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="label">
                  <asp:Button ID="Btn_Add" runat="server"  CssClass="btn btn-primary btn-sm cls-btnSave" 
                    onclick="Btn_Add_Click" Text="Save" /></td>
            <td class="style10">
                &nbsp;</td>

            <td class="style18">
             
            </td>
            <td>
                &nbsp;</td>
        </tr>
          </ContentTemplate>
                </asp:UpdatePanel>
    </table>
</asp:Content>
