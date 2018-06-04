<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Add_User_Group_Rights.aspx.cs" Inherits="PPT.Add_User_Group_Rights" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
     
     <div class="txt_center Header">
        Add User Groups Functions
    </div>
    <div class="row">
        <div class="lblError">
             <asp:Label ID="lblErrorMsg" runat="server"></asp:Label>
        </div>
    </div>
    
    <table>             
        <tr>
            <td class="label">
                Select Project:</td>
            <td class="requiredSign">
                <asp:Label ID="Lbl_Sel_Dept" runat="server"
                    Text="*"></asp:Label>
                </td>
            <td class="Control">
           
                    <asp:DropDownList ID="Drp_Project_Name" runat="server" AutoPostBack="True" 
                             class="form-control drpControl required"
                                onselectedindexchanged="Drp_Departments_SelectedIndexChanged">
                            </asp:DropDownList>
                   
               
            </td>
          
            <td class="style10">         
                      </td>         
           
        </tr>
        <tr>
            <td class="label">
                Select User Group:</td>
            <td class="requiredSign">
                <asp:Label ID="Lbl_Sel_UserGroup" runat="server" 
                    Text="*"></asp:Label>
                </td>
            <td class="Control">       
                <asp:DropDownList ID="Drp_User_Group" runat="server"  class="form-control drpControl required"
                             >
                            </asp:DropDownList>          
             
               
            </td>
            <td>
                </td>
            <td>
                </td>
        </tr>

         <tr>
            <td colspan="5">    
             <asp:Button ID="Btn_Get_Fun" runat="server" onclick="Btn_Get_Fun_Click" 
                        Text="Get Functions"   CssClass="btn btn-primary btn-sm cls-btnSave"/>            
            </td>    
             <td>
                &nbsp;</td>   
        </tr>
        <tr>
            <td class="label" colspan="5">
            
        </tr>
        </table>
        
        <div class="width100px">
     
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False"    CssClass="Grid  margin10px" AlternatingRowStyle-CssClass="alt" 
                PagerStyle-CssClass="pgr">
          
            <Columns>
                <asp:TemplateField HeaderText="Function ID" ItemStyle-CssClass="width20px">
                   
                    <ItemTemplate>
                        <asp:TextBox ID="txt_Fun_ID" runat="server" Text='<%# Bind("FunctionID") %>' 
                            Enabled="False" Height="16px"  
                            Width="30px" Font-Size="X-Small"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Parent Function" ItemStyle-CssClass="width30px">
                    <ItemTemplate>
                        <asp:TextBox ID="txt_Parent" runat="server" Text='<%# Bind("Parent") %>' 
                            BorderStyle="None" Enabled="False" Font-Overline="False" Font-Size="X-Small" 
                            Height="16px" Width="147px"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Function Name" ItemStyle-CssClass="width30px">
                    <ItemTemplate>
                        <asp:TextBox ID="txt_Fun_Name" runat="server" 
                            Text='<%# Bind("FunctionName") %>' Enabled="False" Font-Bold="True" 
                            Font-Overline="False" Font-Size="X-Small" Height="16px" Width="178px"></asp:TextBox>
                        &nbsp;
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField  ItemStyle-CssClass="width30px">
                <HeaderTemplate>
                     <asp:Button ID="Btn_Add_Fun" runat="server"
                            onclick="Btn_Add_Fun_Click" Text="Add"  CssClass="btn btn-primary btn-sm cls-btnSave"  />
                            </HeaderTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="Chk_Sel_Fun" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>

               
            </Columns>               
            </asp:GridView>
            </div>   
   
   
</asp:Content>
