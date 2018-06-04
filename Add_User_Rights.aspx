<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Add_User_Rights.aspx.cs" Inherits="PPT.Add_User_Rights" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

     <div class="txt_center Header">
       Add User Rights
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
                <asp:Label ID="Label2" runat="server"
                    Text="*"></asp:Label>
                </td>
            <td class="Control">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                     <asp:DropDownList ID="Drp_Project" runat="server" class="form-control drpControl required"  AutoPostBack="True"                            
                            onselectedindexchanged="Drp_Project_Name_SelectedIndexChanged">
                        </asp:DropDownList>
                 
                 </ContentTemplate>
                </asp:UpdatePanel>
            </td>
          
            <td class="style10">
                </td>
        </tr>
         <tr>
            <td class="label">
                Select User Group:</td>
            <td class="requiredSign">
                <asp:Label ID="Label1" runat="server"
                    Text="*"></asp:Label>
                </td>
            <td class="Control">
            <asp:UpdatePanel ID="Upd_Pan_Sel_UG" runat="server">
                    <ContentTemplate>
                        <asp:DropDownList ID="Drp_User_Group" runat="server" AutoPostBack="True" class="form-control drpControl required" 
                           
                            onselectedindexchanged="Drp_User_Group_SelectedIndexChanged">
                        </asp:DropDownList>
                        
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
          
            <td class="style10">
                </td>
        </tr>

         <tr>
            <td class="label">
               Select User:</td>
            <td class="requiredSign">
                <asp:Label ID="Label3" runat="server"
                    Text="*"></asp:Label>
                </td>
            <td class="Control">
           
                                   <asp:UpdatePanel ID="Upd_Pan_Sel_User" runat="server">
                    <ContentTemplate>
                        <asp:DropDownList ID="Drp_User" runat="server" class="form-control drpControl required" >
                        </asp:DropDownList>
                       
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
          
            <td class="style10">
                </td>
        </tr>      
        <tr>         
            <td class="label">
                        <asp:Button ID="btn_Get_Fun" runat="server"    CssClass="btn btn-primary btn-sm cls-btnSave"
                            onclick="btn_Get_Doc_List_Click" Text="Get Functions" />
            </td>
            <td class="style9">
            </td>
        </tr>
       
        <tr>
            <td class="style12">
                &nbsp;</td>
            <td class="style14">
                &nbsp;</td>
            <td class="style5">
                &nbsp;</td>
            <td class="style11">
                    &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        </table>          
          <div class="width100px">
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False" 
           CssClass="Grid  margin10px" AlternatingRowStyle-CssClass="alt" 
                PagerStyle-CssClass="pgr">
          
            <Columns>
                <asp:TemplateField HeaderText="Function ID" ItemStyle-CssClass="width20px">
                    <ItemTemplate>
                        <asp:TextBox ID="txt_Fun_ID" runat="server" Text='<%# Bind("FunctionID") %>' 
                            Enabled="False" Height="16px"  
                            Width="48px" Font-Size="X-Small"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Parent Function" ItemStyle-CssClass="width20px">
                    <ItemTemplate>
                        <asp:TextBox ID="txt_Parent" runat="server" Text='<%# Bind("Parent") %>' 
                            BorderStyle="None" Enabled="False" Font-Overline="False" Font-Size="X-Small" 
                            Height="16px" Width="147px"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Function Name" ItemStyle-CssClass="width20px">
                    <ItemTemplate>
                        <asp:TextBox ID="txt_Fun_Name" runat="server" 
                            Text='<%# Bind("FunctionName") %>' Enabled="False" Font-Bold="True" 
                            Font-Overline="False" Font-Size="X-Small" Height="16px" Width="178px"></asp:TextBox>
                        &nbsp;
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ItemStyle-CssClass="width20px">
                 <HeaderTemplate>
                        <asp:Button ID="Btn_Add_Fun" runat="server"   CssClass="btn btn-primary btn-sm cls-btnSave" 
                            onclick="Btn_Add_Fun_Click" Text="Add"  />
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="Chk_Sel_Fun" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
              
            </Columns>
            
        </asp:GridView>    
        </div>
</asp:Content>
