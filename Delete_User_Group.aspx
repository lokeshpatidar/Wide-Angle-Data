<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Delete_User_Group.aspx.cs" Inherits="PPT.Delete_User_Group" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

    <div class="txt_center Header">
         Delete User Group
    </div>
      <div class="row">
        <div class="col-sm-4 lblError">
             <asp:Label ID="lblErrorMsg" runat="server"></asp:Label>
        </div>
    </div>
    <table class="style1">      
        
        <tr>
            <td class="style20">
               <%-- Select Project--%></td>
            <td class="style18">
                <asp:Label ID="Lbl_Sel_Dept" runat="server" Visible="false" Font-Size="Small" 
                    ForeColor="#FF3300" Text="*"></asp:Label>
                </td>
            <td class="style6">
                                 
                        <asp:DropDownList ID="Drp_Project_Name" Visible="false" runat="server" 
                            Font-Size="X-Small" CssClass="required" >
                        </asp:DropDownList>
                      
                   
            
            </td>
            <td style="font-weight: 700" class="style7">
                <asp:Button ID="Btn_Get_UG" runat="server" Visible="false" Font-Size="X-Small" Text="Get User Group" 
                    onclick="Btn_Get_UG_Click" />
            </td>
            <td style="font-weight: 700">
                    &nbsp;</td>
        </tr>
        <tr>
            <td class="style21">
                </td>
            <td class="style19">
                </td>
            <td class="style10">
                </td>
            <td class="style11">
                </td>
            <td class="style12">
                </td>
        </tr>
        </table>      
     
        <div class="width100px">
                        <asp:GridView ID="Grd_User_List" runat="server" AutoGenerateColumns="False" 
                              CssClass="Grid Datatable margin10px" AlternatingRowStyle-CssClass="alt" 
                PagerStyle-CssClass="pgr"  >                        
                            <Columns>
                                <asp:TemplateField HeaderText="User Group_ID" ItemStyle-CssClass="width20px">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txt_UserUG_ID" runat="server" Enabled="False" 
                                           Text='<%# Bind("UserGroup_ID") %>' 
                                            ></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="User Group Name"  ItemStyle-CssClass="width20px">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txt_UG_Name" runat="server" Enabled="False" 
                                          Text='<%# Bind("UserGroup_Name") %>'
                                          ></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="No. of Users"  ItemStyle-CssClass="width10px">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txt_User_ID_Count" runat="server" Enabled="False" 
                                             Text='<%# Bind("User_ID") %>' ></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Select"  ItemStyle-CssClass="width20px">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="Chk_UG" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Delete" ItemStyle-CssClass="width20px">
                                    <HeaderTemplate>
                                        <asp:Button ID="Bth_Delete" runat="server"  CssClass="btn btn-primary btn-sm"  Text="Delete" 
                                            onclick="Bth_Delete_Click" />
                                    </HeaderTemplate>
                                </asp:TemplateField>
                            </Columns>                         
                        </asp:GridView>
                   </div>
             
     
</asp:Content>
