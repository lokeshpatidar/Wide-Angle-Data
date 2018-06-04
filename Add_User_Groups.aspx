<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Add_User_Groups.aspx.cs" Inherits="PPT.Add_User_Groups" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">

 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
     
     <div class="txt_center Header">
        Add User Groups
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
           
                     <asp:DropDownList ID="Drp_Project" runat="server" 
                         class="form-control drpControl required" AutoPostBack="True" 
                         onselectedindexchanged="Drp_Project_SelectedIndexChanged">
                        </asp:DropDownList>
                   
               
            </td>
          
            <td class="style10">
                </td>
        </tr>

         <tr>
            <td class="label">
                Select Country:</td>
            <td class="requiredSign">
                <asp:Label ID="Label1" runat="server"
                    Text="*"></asp:Label>
                </td>
            <td class="Control">
           
                     <asp:DropDownList ID="droCountry" runat="server" class="form-control drpControl required">
                        </asp:DropDownList>
                  
            </td>
          
            <td class="style10">
                </td>
        </tr>

        <tr>
            <td class="label">
                Enter User Group:</td>
            <td class="requiredSign">
                <asp:Label ID="Lbl_Sel_UserGroup" runat="server" 
                    Text="*"></asp:Label>
                </td>
            <td class="Control">       
                <asp:TextBox ID="txt_User_Group" runat="server"  class="form-control required"></asp:TextBox>                           
                  
               
            </td>
            <td>
                </td>
            <td>
                </td>
        </tr>

         <tr>
            <td colspan="5">             
            </td>    
             <td>
                &nbsp;</td>   
        </tr>
        <tr>
            <td class="label" colspan="5">
               <asp:Button ID="Add_User_Group" runat="server" OnClick="Add_User_Group_Click" Text="Add"
                    CssClass="btn btn-primary btn-sm cls-btnSave"/>    
                      </td>         
        </tr>
        </table>       
      
  
</asp:Content>
