<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="CloseOutActionItemsSummary.aspx.cs" Inherits="CTMS.CloseOutActionItemsSummary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script type="text/javascript">

        var popupWindow = null;
        function AddComments() {
            var Section = 'Action Items Summary';
            var SectionID = '5';
            var SubSectionID = '5.16';

            var ProjectId = $("#<%=Drp_Project.ClientID%>").val();
            var INVID = $("#<%=drp_INVID.ClientID%>").val();
            var MVID = $("#<%=Drp_MVID.ClientID%>").val();

            var test = "AddComments.aspx?Section=" + Section + "&ProjectId=" + ProjectId + "&INVID=" + INVID + "&MVID=" + MVID + "&SectionID=" + SectionID + "&SubSectionID=" + SubSectionID;

            var strWinProperty = "toolbar=no,menubar=no,location=no,scrollbars=yes,titlebar=no,height=300,width=600";
            popupWindow = window.open(test, '_blank', strWinProperty);


            return false;
        }
        function ViewComments() {
            var Section = 'Action Items Summary';
            var SectionID = '5';
            var SubSectionID = '5.16';

            var ProjectId = $("#<%=Drp_Project.ClientID%>").val();
            var INVID = $("#<%=drp_INVID.ClientID%>").val();
            var MVID = $("#<%=Drp_MVID.ClientID%>").val();

            var test = "ViewComments.aspx?Section=" + Section + "&ProjectId=" + ProjectId + "&INVID=" + INVID + "&MVID=" + MVID + "&SectionID=" + SectionID + "&SubSectionID=" + SubSectionID;
            var strWinProperty = "toolbar=no,menubar=no,location=no,scrollbars=yes,titlebar=no,height=500,width=1100";
            popupWindow = window.open(test, '_blank', strWinProperty);
            return false;
        }
        function parent_disable() {
            if (popupWindow && !popupWindow.closed)
                popupWindow.focus();
        }

        function AddNewAction() {
            var RECID = "";
            var ACTION = "INSERT";

            var test = "CloseOutActionItem_Data.aspx?RECID=" + RECID + "&ACTION=" + ACTION;

            var strWinProperty = "toolbar=no,menubar=no,location=no,scrollbars=yes,titlebar=no,height=300,width=600";

            popupWindow = window.open(test, '_blank', strWinProperty);
            return false;
        }

        function ViewAction(element) {

            var RECID = $(element).prev().attr('commandargument');
            var ACTION = "UPDATE";

            var test = "CloseOutActionItem_Data.aspx?RECID=" + RECID + "&ACTION=" + ACTION;
            var strWinProperty = "toolbar=no,menubar=no,location=no,scrollbars=yes,titlebar=no,height=300,width=600";
            popupWindow = window.open(test, '_blank', strWinProperty);
            return false;
        }
        

       
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div class="box box-warning">
        <div class="box-header">
            <h3 class="box-title">
                Close Out</h3>
        </div>
        <!-- /.box-header -->
        <!-- text input -->
        <div class="box-body">               
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
                                <asp:GridView ID="GrdShow" runat="server" AutoGenerateColumns="False" Name="DSVISDAT"
                                   CssClass="table table-bordered table-striped">
                                    <Columns>
                                        <%-- <asp:TemplateField HeaderText="SR NO">
                    <ItemTemplate>
                        <asp:Label ID="lblRECID" runat="server" Text='<%# Bind("OPENACTSEQNO") %>' CommandArgument='<%#Eval("OPENACTSEQNO") %>'></asp:Label>
                       <asp:linkButton ID="SEQNO" Text='<%# Bind("OPENACTSEQNO") %>' OnClientClick="return ViewAction(this);" runat="server"></asp:linkButton>
                    </ItemTemplate>
                </asp:TemplateField>--%>
                                        <asp:TemplateField HeaderText="Description of Issue">
                                            <ItemTemplate>
                                                <asp:Label ID="ISSUE" Text='<%# Bind("OPENACTDESC") %>' runat="server"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Proposed/ Actual Action">
                                            <ItemTemplate>
                                                <asp:Label ID="ActualAction" Text='<%# Bind("OPENACTPAACT") %>' runat="server"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Responsibility">
                                            <ItemTemplate>
                                                <asp:Label ID="Responsibility" Text='<%# Bind("OPENACTRESP") %>' runat="server"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <%-- <asp:TemplateField HeaderText="Status">
                    <ItemTemplate>
                        <asp:Label ID="Status" Text='<%# Bind("OPENACTSTAT") %>' runat="server"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>--%>
                                        <asp:TemplateField HeaderText="Target / Resolved Date">
                                            <ItemTemplate>
                                                <asp:Label ID="ResolvedDate" Text='<%# Bind("OPENACTDAT") %>' runat="server"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="">
                                            <ItemTemplate>
                                                <asp:Label ID="lblRECID" runat="server" CommandArgument='<%#Eval("RECID") %>'></asp:Label>
                                                <asp:LinkButton ID="Update" Text="Update" OnClientClick="return ViewAction(this);"
                                                    runat="server"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                            <asp:Button ID="btnAdd" runat="server" Text="Add" Visible="false" CssClass="btn btn-primary btn-sm cls-btnSave"
                                Style="margin-top: 10px" OnClientClick="return AddNewAction();" />
                        </ContentTemplate>
                    </asp:UpdatePanel>

</asp:Content>
