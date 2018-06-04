<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CreateNewVisit.aspx.cs" Inherits="CTMS.CreateNewVisit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
 <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
<div class="box box-warning"><div class="box-header"> <h3 class="box-title">New Visit</h3></div> <!-- /.box-header --><!-- text input --> <div class="box-body"><form role="form">         
   
    <div class="row">
        <div class="lblError">
             <asp:Label ID="lblErrorMsg" runat="server"></asp:Label>
        </div>
    </div>
    <table> 
      <asp:UpdatePanel ID="Upd_Pan_Sel_Dept" runat="server">
                    <ContentTemplate>     
        <tr>
            <td class="label">
                Select Project
                </td>
            <td class="requiredSign">
                <asp:Label ID="Lbl_Dept" runat="server"
                    Text="*"></asp:Label>
                </td>
            <td class="Control">
              
                        <asp:DropDownList ID="Drp_Project"   class="form-control drpControl required"    runat="server" AutoPostBack="True"                        
                            onselectedindexchanged="Drp_Project_Name_SelectedIndexChanged">
                        </asp:DropDownList>
                     
                
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>

         <tr>
            <td class="label">
                Select INV:</td>
            <td class="requiredSign">
                <asp:Label ID="Label1" runat="server"
                    Text="*"></asp:Label>
                </td>
            <td class="Control">
          
                     <asp:DropDownList ID="drp_InvID" runat="server"  class="form-control drpControl required">
                        </asp:DropDownList>
                    
            
            </td>
          
            <td class="style10">
                </td>
        </tr>
        
         <tr>
            <td class="label">
                Select Visit Type:</td>
            <td class="requiredSign">
                <asp:Label ID="Label6" runat="server"
                    Text="*"></asp:Label>
                </td>
            <td class="Control">
           
                     <asp:DropDownList ID="drpVisitType" runat="server"  
                            class="form-control drpControl required" AutoPostBack="True" 
                            onselectedindexchanged="drpVisitType_SelectedIndexChanged">
                     <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                     <asp:ListItem Value="SiteQualification" Text="Site Qualification"></asp:ListItem>
                     <asp:ListItem Value="SiteInitiation" Text="Site Initiation"></asp:ListItem>
                     <asp:ListItem Value="MonitoringVisit" Text="Monitoring Visit"></asp:ListItem>
                      <asp:ListItem Value="CloseOutVisit" Text="Close Out Visit"></asp:ListItem>

                        </asp:DropDownList>
                   
               
            </td>
          
            <td class="style10">
                </td>
        </tr>
         <tr>
            <td class="label">
                Enter Visit Id:</td>
            <td class="requiredSign">
                <asp:Label ID="Label2" runat="server"
                    Text="*"></asp:Label>
                </td>
            <td class="Control">
           
                   <asp:TextBox ID="txtVisitId" class="form-control required" runat="server" Text="" ></asp:TextBox>
                
            </td>
          
            <td class="style10">
                </td>
        </tr>
         <tr>
            <td class="label">
                Enter CRA:</td>
            <td class="requiredSign">
                <asp:Label ID="Label3" runat="server"
                    Text="*"></asp:Label>
                </td>
            <td class="Control">
           
                   <asp:TextBox ID="txtCRA" class="form-control required" runat="server" ></asp:TextBox>
               
                     
            </td>
          
            <td class="style10">
                </td>
        </tr>
         <tr>
            <td class="label">
                Enter Visit Start date:</td>
            <td class="requiredSign">
                <asp:Label ID="Label4" runat="server"
                    Text="*"></asp:Label>
                </td>
            <td class="Control">
           
                   <asp:TextBox ID="txtStartdate" class="form-control txtDate required" runat="server" ></asp:TextBox>
                                  
            </td>
          
            <td class="style10">
                </td>
        </tr>
         <tr>
            <td class="label">
                Enter Visit End Date:</td>
            <td class="requiredSign">
                <asp:Label ID="Label5" runat="server"
                    Text="*"></asp:Label>
                </td>
            <td class="Control">
           
                   <asp:TextBox ID="txtEnddate" class="form-control txtDate required" runat="server" ></asp:TextBox>
                                         
            </td>
          
            <td class="style10">
                </td>
        </tr>
        </ContentTemplate>
        </asp:UpdatePanel>
        <tr>
            <td class="style11">
                   &nbsp;</td>
            <td class="style8">
                &nbsp;</td>
            <td class="style9">
             
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
          <tr>
            <td class="style11">
                   <asp:Button ID="Btn_Save" runat="server"   CssClass="btn btn-primary btn-sm cls-btnSave margin-left10" 
                    Text="Save" onclick="Btn_Save_Click" /></td>
            <td class="style8">
                &nbsp;</td>
            <td class="style9">
             
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>

        </div>
        </div>
        
</asp:Content>
