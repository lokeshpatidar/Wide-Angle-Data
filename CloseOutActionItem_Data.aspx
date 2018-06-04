<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CloseOutActionItem_Data.aspx.cs" Inherits="CTMS.CloseOutActionItem_Data" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
   <script src="Scripts/Jquery1.12.4.js" type="text/javascript"></script>

    <link href="~/Styles/Site.css" rel="stylesheet" type="text/css" /> 

    <link href="Styles/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="Styles/bootstrap-theme.css" rel="stylesheet" type="text/css" />


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

                if (value == "" || value == "0" || value == null) {
                    $(this).addClass("brd-1px-redimp");
                    test = "1";
                }
                else {
                    $(this).removeClass("brd-1px-redimp");
                }
            });

            if (test == "1") {
                return false;
            }
            return true;
        });


        $(document).ready(function () {
            $('.txtDate').each(function (index, element) {
                $(element).pikaday({
                    field: element,
                    // trigger: $(element).closest('div').find('.datepicker-button').get(0), // <<<<
                    // firstDay: 1,
                    //position: 'top right',
                    // minDate: new Date('2000-01-01'),
                    // maxDate: new Date('9999-12-31'),
                    format: 'DD-MMM-YYYY',
                    //  defaultDate: new Date(''),
                    //setDefaultDate: false,
                    yearRange: [1910, 2050]
                });
            });
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
                <asp:GridView ID="DSVISDAT" runat="server" AutoGenerateColumns="False" Name="DSVISDAT"
                    OnRowDataBound="DSVISDAT_RowDataBound" CssClass="Grid  margin10px" AlternatingRowStyle-CssClass="alt"
                    PagerStyle-CssClass="pgr">
                    <Columns>
                        <asp:TemplateField HeaderText="ContID" HeaderStyle-CssClass="disp-none" ItemStyle-CssClass="disp-none">
                            <ItemTemplate>
                                <asp:TextBox ID="ContID" runat="server" ToolTip="ContID" onfocus="myFocus(this)"
                                    onchange="myFunction(this)"></asp:TextBox>
                            </ItemTemplate>
                            <HeaderStyle CssClass="disp-none"></HeaderStyle>
                            <ItemStyle CssClass="disp-none"></ItemStyle>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="VARIABLENAME" HeaderStyle-CssClass="width100px disp-none"
                            ItemStyle-CssClass="disp-none">
                            <ItemTemplate>
                                <asp:Label ID="lblVARIABLENAME" Text='<%# Bind("VARIABLENAME") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="CONTROLTYPE" HeaderStyle-CssClass="width100px disp-none"
                            ItemStyle-CssClass="disp-none">
                            <ItemTemplate>
                                <asp:Label ID="lblCONTROLTYPE" Text='<%# Bind("CONTROLTYPE") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="OPEN ACTION-ITEMS SUMMARY" HeaderStyle-CssClass=""
                            ItemStyle-CssClass="align-left">
                            <ItemTemplate>
                                <asp:Label ID="lblFieldName" Text='<%# Bind("FIELDNAME") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="CLASSNAME" HeaderStyle-CssClass="width100px disp-none"
                            ItemStyle-CssClass="disp-none">
                            <ItemTemplate>
                                <asp:Label ID="lblCLASS" Text='<%# Bind("CLASS") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="TABLENAME" HeaderStyle-CssClass="width100px disp-none"
                            ItemStyle-CssClass="disp-none">
                            <ItemTemplate>
                                <asp:Label ID="lblTABLENAME" Text='<%# Bind("TABLENAME") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="DATATYPE" HeaderStyle-CssClass="width100px disp-none"
                            ItemStyle-CssClass="disp-none">
                            <ItemTemplate>
                                <asp:Label ID="lblDATATYPE" Text='<%# Bind("DATATYPE") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="" HeaderStyle-CssClass="width100px align-center">
                            <ItemTemplate>
                                <asp:DropDownList ID="DRP_FIELD" runat="server" Width="100px" ToolTip="Initials"
                                    Visible="false">
                                </asp:DropDownList>
                                <asp:TextBox ID="TXT_FIELD" runat="server" ToolTip="ContID" Visible="false"></asp:TextBox>
                                <asp:CheckBox ID="CHK_FIELD" runat="server" ToolTip="Vasectomised partner" Visible="false"
                                    CssClass="checkbox"></asp:CheckBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                   <asp:Button ID="bntSave" runat="server" Text="Save" OnClick="bntSaveComplete_Click"
        CssClass="btn btn-primary btn-sm cls-btnSave" />
           <asp:HiddenField ID="hdnRECID" runat="server" />
          <asp:HiddenField ID="hdnACTION" runat="server" />
      

    </div>
    </form>
</body>
</html>
