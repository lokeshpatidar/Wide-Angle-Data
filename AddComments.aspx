<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddComments.aspx.cs" Inherits="CTMS.AddComments" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title></title>
     <script src="Scripts/Jquery1.12.4.js" type="text/javascript"></script>
    <link href="~/Styles/Site.css" rel="stylesheet" type="text/css" /> 
    <link href="Styles/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="Styles/bootstrap-theme.css" rel="stylesheet" type="text/css" />
    <script src="Scripts/bootstrap.js" type="text/javascript"></script>
    <script src="Scripts/npm.js" type="text/javascript"></script> 
    <!-- for pikaday datepicker//-->
    <link href="Styles/pikaday.css" rel="stylesheet" type="text/css" />
    <script src="Scripts/moment.js" type="text/javascript"></script>
    <script src="Scripts/pikaday.js" type="text/javascript"></script>
    <script src="Scripts/pikaday.jquery.js" type="text/javascript"></script>
    <!-- for pikaday datepicker//-->
    <script type="text/javascript">

        $(document).on("click", ".cls-btnSave", function () {
            var test = "0";

            $('.required').each(function (index, element) {
                var value = $(this).val();
                var ctrl = $(this).prop('type');

                if (ctrl == "select-one") {
                    if (value == "0" || value == null) {
                        $(this).addClass("brd-1px-redimp");
                        test = "1";
                    }
                }
                else if (ctrl == "text" || ctrl == "textarea") {
                    if (value == "") {
                        $(this).addClass("brd-1px-redimp");
                        test = "1";
                    }
                }
            });

            if (test == "1") {
                return false;
            }
            return true;
        });


    </script>
  
</head>
<body>
    <form id="form1" runat="server">
    <div class="page">
    
    <div class="row">
        <div class="lblError">
             <asp:Label ID="lblErrorMsg" runat="server"></asp:Label>
        </div>
    </div>
    <table>      
        <tr>
            <td class="label disp-blockimp padding-top">
                Section</td>
            <td class="requiredSign">
                <asp:Label ID="Lbl_Dept" runat="server"
                    Text="*"></asp:Label>
                </td>
            <td class="Control">
             <asp:TextBox ID="txtSection" class="form-control required" runat="server"  ReadOnly="true" Text="" ></asp:TextBox>                      
                       
                   
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>

        <tr>
            <td class="label disp-blockimp padding-top">
                Project Id</td>
            <td class="requiredSign">
                <asp:Label ID="Label1" runat="server"
                    Text="*"></asp:Label>
                </td>
            <td class="Control">
             <asp:TextBox ID="txtProjectId" class="form-control required" runat="server"  ReadOnly="true"  Text="" ></asp:TextBox>                      
                    
                   
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
      <tr>
               <td class="label disp-blockimp padding-top">
                Site Id</td>
            <td class="requiredSign">
                <asp:Label ID="Label2" runat="server"
                    Text="*"></asp:Label>
                </td>
            <td class="Control">
             <asp:TextBox ID="txtInvID" class="form-control required" runat="server"  ReadOnly="true"  Text="" ></asp:TextBox>                      
                       
                   
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        
        
         <tr>
              <td class="label disp-blockimp padding-top">
                Monitoring Visit Id</td>
            <td class="requiredSign">
                <asp:Label ID="Label3" runat="server"
                    Text="*"></asp:Label>
                </td>
            <td class="Control">
             <asp:TextBox ID="txtMVID" class="form-control required" runat="server" ReadOnly="true" Text="" ></asp:TextBox>                      
                      
                   
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
              <td class="label disp-blockimp padding-top">
                Comments</td>
            <td class="requiredSign">
                <asp:Label ID="Label4" runat="server"
                    Text="*"></asp:Label>
                </td>
            <td class="Control">
             <asp:TextBox ID="txtComments" class="form-control textarea width260pximp required" TextMode="MultiLine" runat="server" Text="" ></asp:TextBox>                      
                    
                   
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
              <td class="label disp-blockimp padding-top">
                Type of Comments</td>
            <td class="requiredSign">
                <asp:Label ID="Label5" runat="server"
                    Text=""></asp:Label>
                </td>
            <td class="Control">       
                              <asp:CheckBox ID="chk_Issue" runat="server"  Text="Issue" ></asp:CheckBox> &nbsp;&nbsp;    
                              <asp:CheckBox ID="chk_Observation" Text="Observation" runat="server"  ></asp:CheckBox> &nbsp;&nbsp;         
                              <asp:CheckBox ID="chk_Internal" Text="Internal" runat="server"  ></asp:CheckBox>     &nbsp;&nbsp;                         
                              <asp:CheckBox ID="chk_FollowUp" runat="server"   Text="Follow Up"></asp:CheckBox> &nbsp;&nbsp;   
                              <asp:CheckBox ID="chkReport" runat="server"   Text="Report"></asp:CheckBox> &nbsp;&nbsp;                                                                    
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>       
          <tr>
            
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
         <tr>
            
            <td>
             <asp:Button ID="bntSave" runat="server" Text="Save" 
                    CssClass="btn btn-primary btn-sm cls-btnSave" onclick="bntSave_Click"/>
            <asp:Button ID="Button1" runat="server" Text="Cancel" 
                    Cssclass="btn btn-danger btn-sm" onclick="Button1_Click"/></td>
            <td>
                &nbsp;</td>
        </tr>
         
        </table>
         <asp:HiddenField ID="hdnSectionId" runat="server" />
      <asp:HiddenField ID="hdnSubSectionId" runat="server" />
    </div>
   
    </form>
</body>
</html>
