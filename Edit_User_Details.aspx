<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Edit_User_Details.aspx.cs" Inherits="PPT.Edit_User_Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
      <div class="txt_center Header">
     Edit User Details
    </div>
     <div class="row">
        <div class="lblError">
             <asp:Label ID="lblErrorMsg" runat="server"></asp:Label>
        </div>
    </div>
 
    <table>      
        <tr>
            <td class="label">
                Select Project</td>
            <td class="requiredSign">
                <asp:Label ID="Lbl_Dept" runat="server"
                    Text="*"></asp:Label>
                </td>
            <td class="Control">
                <asp:UpdatePanel ID="Upd_Pan_Sel_Dept" runat="server">
                    <ContentTemplate>
                        <asp:DropDownList ID="Drp_Project_Name"   class="form-control drpControl required"    runat="server" AutoPostBack="True" 
                          
                            onselectedindexchanged="Drp_Project_Name_SelectedIndexChanged">
                        </asp:DropDownList>
                     
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="label">
                Select User Group:</td>
            <td class="requiredSign">
                <asp:Label ID="Lbl_User_Group" runat="server" Font-Size="Small" ForeColor="#FF3300" 
                    Text="*"></asp:Label>
                </td>
            <td class="style9">
                <asp:UpdatePanel ID="Upd_Pan_Sel_UG" runat="server">
                    <ContentTemplate>
                        <asp:DropDownList ID="Drp_User_Group"  class="form-control drpControl required"   runat="server" AutoPostBack="True" 
                          
                            onselectedindexchanged="Drp_User_Group_SelectedIndexChanged" 
                            style="margin-bottom: 1px">
                        </asp:DropDownList>
                       
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
       
        <tr>
            <td class="label">
                Select User:</td>
            <td class="requiredSign">
                <asp:Label ID="Lbl_User" runat="server" Font-Size="Small" ForeColor="#FF3300" 
                    Text="*"></asp:Label>
                </td>
            <td class="style9">
                <asp:UpdatePanel ID="Upd_Pan_Sel_User" runat="server">
                    <ContentTemplate>
                        <asp:DropDownList ID="Drp_User"  class="form-control drpControl required"    runat="server" AutoPostBack="True" 
                          
                            onselectedindexchanged="Drp_User_SelectedIndexChanged" 
                            style="margin-bottom: 1px">
                        </asp:DropDownList>
                    
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <%-- <tr>
            <td class="style11">
                Select Site ID</td>
            <td class="style8">
                <asp:Label ID="Lbl_Site_ID" runat="server" Font-Size="Small" ForeColor="#FF3300" 
                    Text="*"></asp:Label>
                </td>
            <td class="style9">
                <asp:UpdatePanel ID="Upd_Pan_Sel_Site_ID" runat="server">
                    <ContentTemplate>
                        <asp:DropDownList ID="Drp_Site_ID" runat="server" Font-Size="X-Small" 
                             
                            AutoPostBack="True">
                        </asp:DropDownList>
                        <asp:CompareValidator ID="Comp_Val_Sel_Site_ID" runat="server" 
                            ControlToValidate="Drp_Site_ID" ErrorMessage="Required" Font-Size="X-Small" 
                            ForeColor="#FF3300" Operator="NotEqual" ValueToCompare="0"></asp:CompareValidator>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>--%>
        <tr>
            <td class="label">
                Edit User Name</td>
            <td class="requiredSign">
                <asp:Label ID="Lbl_User_Name" runat="server" Font-Size="Small" ForeColor="#FF3300" 
                    Text="*"></asp:Label>
                    </td>
            <td class="style26">
                <asp:UpdatePanel ID="Up_User_Name" runat="server">
                    <ContentTemplate>
                        <asp:TextBox ID="txt_User_Name" runat="server"  class="form-control required" 
                            ></asp:TextBox>
                       
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="label">
                Edit User Display Name</td>
            <td class="requiredSign">
                <asp:Label ID="Lbl_User_Dis_Name" runat="server" Font-Size="Small" ForeColor="#FF3300" 
                    Text="*"></asp:Label>
                </td>
            <td class="style29">
                <asp:UpdatePanel ID="Up_User_Dis_Name" runat="server">
                    <ContentTemplate>
                        <asp:TextBox ID="txt_User_Dis_Name" runat="server" class="form-control required"
                            ></asp:TextBox>
                      
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
            <td class="style30">
                </td>
            <td class="style30">
                </td>
        </tr>
        <tr>
            <td class="label">
                Edit Email ID</td>
            <td class="requiredSign">
                <asp:Label ID="Lbl_Email" runat="server" Font-Size="Small" ForeColor="#FF3300" 
                    Text="*"></asp:Label>
                </td>
            <td class="style9">
                <asp:UpdatePanel ID="Up_Email" runat="server">
                    <ContentTemplate>
                        <asp:TextBox ID="txt_EmailID" runat="server" class="form-control required" ></asp:TextBox>
                      
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
       
        <tr>
            <td class="label">
                Edit User Group:</td>
            <td class="requiredSign">
                &nbsp;</td>
            <td class="style9">
                <asp:UpdatePanel ID="Upd_Pan_Sel_UG1" runat="server">
                    <ContentTemplate>
                        <asp:DropDownList ID="Drp_User_Group1" class="form-control drpControl "   runat="server" AutoPostBack="True" >
                        </asp:DropDownList>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
                          
               <tr>
            <td class="label">
              Edit Site ID:   </td>
            <td class="requiredSign">
                &nbsp;</td>
            <td class="style11" width="150">Select All:
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
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
               <asp:GridView ID="grdINV1" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False"  
          CssClass="Grid  margin10px" AlternatingRowStyle-CssClass="alt" 
                PagerStyle-CssClass="pgr"
                            onrowdatabound="grdINV1_RowDataBound" >
            <AlternatingRowStyle BackColor="White" />
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
              </ContentTemplate>
                </asp:UpdatePanel>     
            </td>     
                            
        </tr>
          

        <tr>
            <td class="style11">
                &nbsp;</td>
            <td class="style8">
                &nbsp;</td>
            <td class="style9">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style11">
                   <asp:Button ID="Btn_Update" runat="server"   CssClass="btn btn-primary btn-sm cls-btnSave" 
                    onclick="Btn_Update_Click" Text="Update" /></td>
            <td class="style8">
                &nbsp;</td>
            <td class="style9">
             
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
