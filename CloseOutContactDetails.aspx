<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="CloseOutContactDetails.aspx.cs" Inherits="CTMS.CloseOut.ContactDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script type="text/javascript">
        function AddComments() {
            var Section = 'CONTACT DETAILS';
            var SectionID = '5';
            var SubSectionID = '5.1';
            
            var ProjectId = $("#<%=Drp_Project.ClientID%>").val();
            var INVID = $("#<%=drp_INVID.ClientID%>").val();
            var MVID = $("#<%=Drp_MVID.ClientID%>").val();

            var test = "AddComments.aspx?Section=" + Section + "&ProjectId=" + ProjectId + "&INVID=" + INVID + "&MVID=" + MVID + "&SectionID=" + SectionID + "&SubSectionID=" + SubSectionID;

            var strWinProperty = "toolbar=no,menubar=no,location=no,scrollbars=yes,titlebar=no,height=300,width=600";
            window.open(test, '_blank', strWinProperty);
            return false;
        }
        function ViewComments() {
            var Section = 'CONTACT DETAILS';
            var SectionID = '5';
            var SubSectionID = '5.1';

            var ProjectId = $("#<%=Drp_Project.ClientID%>").val();
            var INVID = $("#<%=drp_INVID.ClientID%>").val();
            var MVID = $("#<%=Drp_MVID.ClientID%>").val();

            var test = "ViewComments.aspx?Section=" + Section + "&ProjectId=" + ProjectId + "&INVID=" + INVID + "&MVID=" + MVID + "&SectionID=" + SectionID + "&SubSectionID=" + SubSectionID;
            var strWinProperty = "toolbar=no,menubar=no,location=no,scrollbars=yes,titlebar=no,height=500,width=1100";
            window.open(test, '_blank', strWinProperty);
            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
             <div class="box box-warning"><div class="box-header"> <h3 class="box-title">Close Out</h3></div> <!-- /.box-header --><!-- text input --> <div class="box-body"><form role="form">
           
                <div class="divSubmenu">            
                        <a href="CloseOutContactDetails.aspx"  title="CONTACT DETAILS" class="btn btn-facebook btn-sm SubmenuButton">
                            Contact Details</a></br>
                  
                        <a href="CloseOutRT.aspx"  title="Subject Recruitment / Timelines"
                            class="btn btn-facebook btn-sm SubmenuButton">Subj Recruitment</a></br>
                   
                        <a href="CloseOutReason.aspx"  title="Reason for Site Close Out:" class="btn btn-facebook btn-sm SubmenuButton">
                            Reason for CO</a>
                    </a></br>
                    
                        <a href="CloseOutInspection.aspx"  title="Audits / Inspection" class="btn btn-facebook btn-sm SubmenuButton">
                            Inspection</a>
                    </a></br>
                    
                        <a href="CloseOutCRF.aspx"  title="Case Report Forms and Queries" class="btn btn-facebook btn-sm SubmenuButton">
                            CRF & Queries</a>
                    </a></br>
                    
                        <a href="CloseOutSourceData.aspx"  title="Source Data (documents) & ICFs"
                            class="btn btn-facebook btn-sm SubmenuButton">SD & ICFs</a>
                    </a></br>
                    
                        <a href="CloseOutDrugAndTreatment.aspx"  title="Study Drug and Treatment Assignment Codes"
                            class="btn btn-facebook btn-sm SubmenuButton">Drug Assigment Codes</a>
                    </a></br>
                    
                        <a href="CloseOutHandling.aspx"  title="Biological Specimen Handling"
                            class="btn btn-facebook btn-sm SubmenuButton">Specimen Handling</a>
                    </a></br>
                    
                        <a href="CloseOutInvestSiteFile.aspx"  title="Investigator Site File (ISF)"
                            class="btn btn-facebook btn-sm SubmenuButton">ISF</a>
                    </a></br>
                    
                        <a href="CloseOutAdverseEvents.aspx"  title="Adverse Events / Serious Adverse Events"
                            class="btn btn-facebook btn-sm SubmenuButton">AE/SAE</a>
                    </a></br>
                    
                        <a href="CloseOutArchival.aspx"  title="Archival" class="btn btn-facebook btn-sm SubmenuButton">
                            Archival</a>
                    </a></br>
                    
                        <a href="CloseOutObligation.aspx"  title="Investigator obligations / responsibilities"
                            class="btn btn-facebook btn-sm SubmenuButton">Inv Oblig/Resp</a>
                    </a></br>
                    
                        <a href="CloseOutPremature.aspx"  title="Premature close out / Termination of study at site"
                            class="btn btn-facebook btn-sm SubmenuButton">Premature Close Out</a>
                    </a></br>
                    
                        <a href="CloseOutMiscellaneous.aspx"  title="Miscellaneous" class="btn btn-facebook btn-sm SubmenuButton">
                            Miscellaneous</a>
                    </a></br>
                    
                        <a href="CloseOutActionItemsSummary.aspx"  title="Action Items Summary"
                            class="btn btn-facebook btn-sm SubmenuButton">Open Action Item</a>
                    </a></br>
                </tr>
        </div>                                 
                <div class="row">
                        <div class="lblError">
                            <asp:Label ID="lblErrorMsg" runat="server"></asp:Label>
                        </div>
                    </div>
                 <div class="form-group" style="display: inline-flex">
                    <label class="label">
                        Select Project:</label>
                    <div class="Control">
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                            <ContentTemplate>
                                <asp:DropDownList ID="Drp_Project" class="form-control " runat="server"
                                    AutoPostBack="True" OnSelectedIndexChanged="Drp_Project_SelectedIndexChanged">
                                </asp:DropDownList>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
                <div class="form-group" style="display: inline-flex">
                    <label class="label">
                        Select Site Id:</label>
                    <div class="Control">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <asp:DropDownList ID="drp_INVID" runat="server" class="form-control "
                                    AutoPostBack="True" OnSelectedIndexChanged="drp_INVID_SelectedIndexChanged">
                                </asp:DropDownList>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
                <div class="form-group" style="display: inline-flex">
                    <label class="label">
                       Select Close Out Visit:</label>
                    <div class="Control">
                        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                            <ContentTemplate>
                                <asp:DropDownList ID="Drp_MVID" runat="server" class="form-control" AutoPostBack="True"
                                    OnSelectedIndexChanged="Drp_MVID_SelectedIndexChanged">
                                </asp:DropDownList>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
                 </div>
                </div>  
                 <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                           <ContentTemplate> 
                    <asp:Button ID="btnAddComments" runat="server" Text="Add New Comment" Visible="false"
                        OnClientClick="return AddComments()" CssClass="btn btn-info btn-sm" />
                    <asp:Button ID="btnViewComments" runat="server" Text="View All Comments" Visible="false"
                        OnClientClick="return ViewComments()" CssClass="btn btn-info btn-sm" />
                   <div class="box">
                        <asp:GridView ID="DSVISDAT" runat="server" AutoGenerateColumns="False" Name="DSVISDAT"
                            OnRowDataBound="DSVISDAT_RowDataBound" CssClass="table table-bordered table-striped"  AlternatingRowStyle-CssClass="alt"
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
                                <asp:TemplateField HeaderText="CONTACT DETAILS" HeaderStyle-CssClass="" ItemStyle-CssClass="align-left">
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
                    </div>
                        </ContentTemplate>
    </asp:UpdatePanel>
                    <asp:Button ID="bntSave" runat="server" Text="Save" OnClick="bntSaveComplete_Click"
                        CssClass="btn btn-primary btn-sm cls-btnSave" />
               
</asp:Content>
