<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CTMSDashboard.aspx.cs" Inherits="CTMS.CTMSDashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

      <script type="text/javascript" src="Scripts/amcharts.js"></script>
<script src="https://www.amcharts.com/lib/3/serial.js"></script>
    <script src="https://www.amcharts.com/lib/3/pie.js"></script>
    <link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
<script src="https://www.amcharts.com/lib/3/themes/light.js"></script>
			
                            <%--<div class="box box-solid">
                                <div class="box-body">--%>
                                    <div class="row">
                                     <div class="lblError">
             <asp:Label ID="lblErrorMsg" runat="server"></asp:Label>
        </div>
                                                 <div class="col-lg-3 col-xs-6" style="width:18%;">
                                                    <div class="small-box bg-red">
                                                    <div class="inner">
                                                        <div style="text-align:center;">
                                                        <asp:label id="lbltotalsae" runat="server" Font-Bold="true" Font-Size="XX-Large">
                                                        </asp:label><br />
                                                         <asp:label runat="server" Text="Total SAE's" Font-Size="Small">    
                                                        </asp:label>
                                                       </div> 
                                                    </div>
                                                        <div class="icon">
                                                            <i class="ion ion-stats-bars"></i>
                                                        </div>
                                                        <a href="#" class="small-box-footer">    
                                                    </a>
                                                </div>
                                                </div>
                                                    <div class="col-lg-3 col-xs-6" style="width:18%;">
                                                    <div class="small-box bg-green">
                                                    <div class="inner">
                                                        <div style="text-align:center;">
                                                        <asp:label id="lbltotalprotocoldeviation" runat="server" Font-Bold="true" Font-Size="XX-Large">
                                                        </asp:label><br />
                                                         <asp:label runat="server" Text="Total Protocol Deviation" Font-Size="Small">   
                                                        </asp:label>
                                                            </div>
                                                    </div>
                                                        <div class="icon">
                                                            <i class="ion ion-stats-bars"></i>
                                                        </div>
                                                    <a href="#" class="small-box-footer">
                                                       
                                                    </a>
                                                </div>
                                                </div>
                                                    <div class="col-lg-3 col-xs-6" style="width:18%;">
                                                    <div class="small-box bg-yellow">
                                                    <div class="inner">
                                                        <div style="text-align:center;">
                                                        <asp:Label id="lbltotalopenissue" runat="server" Font-Bold="true" Font-Size="XX-Large"></asp:Label><br />
                                                         <asp:label runat="server" Text="Total Open Issues" Font-Size="Small">   
                                                        </asp:label>
                                                            </div>
                                                    </div>
                                                        <div class="icon">
                                                            <i class="ion ion-stats-bars"></i>
                                                        </div>
                                                    <a href="#" class="small-box-footer">
                                                       
                                                    </a>
                                                </div>
                                                </div>
                                                    <div class="col-lg-3 col-xs-6" style="width:18%;">
                                                    <div class="small-box bg-maroon">
                                                    <div class="inner">
                                                        <div style="text-align:center;">
                                                        <asp:Label id="lbltotalcriticalrisks" runat="server" Font-Bold="true" Font-Size="XX-Large">
                                                        </asp:Label><br />
                                                         <asp:label runat="server" Text="Total Critical Risks" Font-Size="Small">    
                                                        </asp:label>
                                                            </div>
                                                    </div>
                                                        <div class="icon">
                                                            <i class="ion ion-stats-bars"></i>
                                                        </div>
                                                    <a href="#" class="small-box-footer">
                                                       
                                                    </a>
                                                </div>
                                                </div> 
                                                <div class="col-lg-3 col-xs-6" style="width:18%;">
                                                    <div class="small-box bg-aqua">
                                                    <div class="inner">
                                                        <div style="text-align:center;">
                                                        <asp:Label id="lbllast2mnt" runat="server" Font-Bold="true" Font-Size="XX-Large">
                                                        </asp:Label><br />
                                                         <asp:Label runat="server" Text="SAE's in Last 14 Days" Font-Size="Small"></asp:Label>
                                                    </div>
                                                        </div>
                                                        <div class="icon">
                                                            <i class="ion ion-stats-bars"></i>
                                                        </div>
                                                    <a href="#" class="small-box-footer">
                                                        
                                                    </a>
                                                </div>
                                                </div>
                                                    </div>
                                    <div class="row">
                                                    <div class="col-lg-3 col-xs-6" style="width:18%;">
                                                    <div class="small-box bg-aqua">
                                                    <div class="inner">
                                                    <div style="text-align:center;">
                                                        <asp:Label id="lblenrollmentrate" runat="server" Font-Bold="true" Font-Size="XX-Large">
                                                        </asp:Label><br />
                                                         <asp:Label runat="server" Text="Enrollment Rate" Font-Size="Small"> 
                                                        </asp:Label>
                                                        </div>
                                                    </div>
                                                        <div class="icon">
                                                            <i class="ion ion-stats-bars"></i>
                                                        </div>
                                                    <a href="#" class="small-box-footer">
                                                       
                                                    </a>
                                                </div>
                                                </div>
                                                    <div class="col-lg-3 col-xs-6" style="width:18%;">
                                                    <div class="small-box bg-yellow">
                                                    <div class="inner">
                                                        <div style="text-align:center;">
                                                        <asp:Label id="lblscreenfailurerate" runat="server" Font-Bold="true" Font-Size="XX-Large">
                                                        </asp:Label><br />
                                                         <asp:Label runat="server" Text="Screen Failure Rate" Font-Size="Small"></asp:Label>
                                                    </div>
                                                        </div>
                                                        <div class="icon">
                                                            <i class="ion ion-stats-bars"></i>
                                                        </div>
                                                    <a href="#" class="small-box-footer">
                                                        
                                                    </a>
                                                </div>
                                                </div>
                                                    <div class="col-lg-3 col-xs-6" style="width:18%;">
                                                    <div class="small-box bg-maroon">
                                                    <div class="inner">
                                                        <div style="text-align:center;">
                                                        <asp:Label id="lbldropouts" runat="server" Font-Bold="true" Font-Size="XX-Large">
                                                        </asp:Label><br />
                                                         <asp:Label runat="server" Text="Total No. of Dropouts" Font-Size="Small"></asp:Label>
                                                    </div>
                                                        </div>
                                                        <div class="icon">
                                                            <i class="ion ion-stats-bars"></i>
                                                        </div>
                                                    <a href="#" class="small-box-footer">
                                                        
                                                    </a>
                                                </div>
                                                </div> 
                                                 <div class="col-lg-3 col-xs-6" style="width:18%;">
                                                    <div class="small-box bg-green">
                                                    <div class="inner">
                                                        <div style="text-align:center;">
                                                        <asp:Label id="lbldiscontinue" runat="server" Font-Bold="true" Font-Size="XX-Large">
                                                        </asp:Label><br />
                                                         <asp:Label runat="server" Text="Discontinuation Due to SAE" Font-Size="Small"></asp:Label>
                                                    </div>
                                                        </div>
                                                        <div class="icon">
                                                            <i class="ion ion-stats-bars"></i>
                                                        </div>
                                                    <a href="#" class="small-box-footer">

                                                    </a>
                                                </div>
                                                </div>
                                                    <div class="col-lg-3 col-xs-6" style="width:18%;">
                                                    <div class="small-box bg-red">
                                                    <div class="inner">
                                                        <div style="text-align:center;">
                                                        <asp:Label id="lbldeath" runat="server" Font-Bold="true" Font-Size="XX-Large">
                                                        </asp:Label><br />
                                                         <asp:Label runat="server" Text="No. of Deaths" Font-Size="Small"></asp:Label>
                                                    </div>
                                                        </div>
                                                        <div class="icon">
                                                            <i class="ion ion-stats-bars"></i>
                                                        </div>
                                                    <a href="#" class="small-box-footer">
                                                        
                                                    </a>
                                                </div>
                                                </div>
                                                    </div>
                                <%--</div><!-- /.box-body -->
                            </div><!-- /.box -->--%>
    <div class="row">
        <section class="col-lg-6 connectedSortable"> 
                            <!-- Box (with bar chart) -->
                            <div class="box box-danger" id="loading-example1">
                                <div class="box-header">
                                   <h4 class="box-title">Study Status: mCRC</h4>
                                    <!-- tools box -->
                                    <div class="pull-right box-tools">
                                        <button class="btn btn-danger btn-sm"  title="Reload"><i class="fa fa-refresh"></i></button>
                                        <button id="btn" class="btn btn-danger btn-sm"><i class="fa fa-minus"></i></button>
                                        <button class="btn btn-danger btn-sm" title="Remove"><i class="fa fa-times"></i></button>
                                    </div><!-- /. tools -->
                                </div><!-- /.box-header -->
                                <div class="box-body no-padding">
                                    <div class="row">
                                        <asp:HiddenField ID="hfcolorbar" runat="server" />
                                        <div id="colorBar" class="chartdiv"></div>
                                    </div><!-- /.row - inside box -->
                                </div><!-- /.box-body -->
                            </div><!-- /.box -->  

                        </section><!-- /.Left col -->
        <section class="col-lg-6 connectedSortable"> 
                            <!-- Box (with bar chart) -->
                            <div class="box box-danger" id="loading-example1">
                                <div class="box-header">
                                   <h4 class="box-title">Study Status- NSCLC
</h4>
                                    <!-- tools box -->
                                    <div class="pull-right box-tools">
                                        <button class="btn btn-danger btn-sm" title="Reload"><i class="fa fa-refresh"></i></button>
                                        <button id="btn" class="btn btn-danger btn-sm"><i class="fa fa-minus"></i></button>
                                        <button class="btn btn-danger btn-sm" data-widget='remove' title="Remove"><i class="fa fa-times"></i></button>
                                    </div><!-- /. tools -->
                                </div><!-- /.box-header -->
                                <div class="box-body no-padding">
                                    <div class="row">
                                        <asp:HiddenField ID="hfStatusNSCLC" runat="server" />
                                        <div id="StatusNSCLCBar" class="chartdiv"></div>
                                    </div><!-- /.row - inside box -->
                                </div><!-- /.box-body -->
                            </div><!-- /.box -->  

                        </section><!-- /.Left col -->
    </div>
    
    <div class="row" runat="server" >
        <section class="col-lg-12 connectedSortable" > 
                            <!-- Box (with bar chart) -->
                            <div class="box box-danger" id="loading-example1">
                                <div class="box-header">
                                   <h4 class="box-title">Screen and Screen Failure by Month</h4>
                                    <!-- tools box -->
                                    <div class="pull-right box-tools">
                                        <button class="btn btn-danger btn-sm" title="Reload"><i class="fa fa-refresh"></i></button>
                                        <button id="btn" class="btn btn-danger btn-sm"><i class="fa fa-minus"></i></button>
                                        <button class="btn btn-danger btn-sm" data-widget='remove' title="Remove"><i class="fa fa-times"></i></button>
                                    </div><!-- /. tools -->
                                </div><!-- /.box-header -->
                                <div class="box-body no-padding">
                                    <div class="row">
                                        <asp:HiddenField ID="hfdouble" runat="server" />
                                        <div id="doublebar" class="chartdiv"></div>
                                    </div><!-- /.row - inside box -->
                                </div><!-- /.box-body -->
                            </div><!-- /.box -->  

                        </section><!-- /.Left col -->
         </div>
         <div class="row">
        <section class="col-lg-12 connectedSortable"> 
                            <!-- Box (with bar chart) -->
                            <div class="box box-danger" id="Div1">
                                <div class="box-header">
                                   <h4 class="box-title">Randomised by month</h4>
                                    <!-- tools box -->
                                    <div class="pull-right box-tools">
                                        <button class="btn btn-danger btn-sm" title="Reload"><i class="fa fa-refresh"></i></button>
                                        <button id="Button1" class="btn btn-danger btn-sm"><i class="fa fa-minus"></i></button>
                                        <button class="btn btn-danger btn-sm" data-widget='remove' title="Remove"><i class="fa fa-times"></i></button>
                                    </div><!-- /. tools -->
                                </div><!-- /.box-header -->
                                <div class="box-body no-padding">
                                    <div class="row">
                                        <asp:HiddenField ID="hfrandomised" runat="server" />
                                        <div id="randomised" class="chartdiv"></div>
                                    </div><!-- /.row - inside box -->
                                </div><!-- /.box-body -->
                            </div><!-- /.box -->  

                        </section><!-- /.Left col -->
         </div>
    
    <div class="row" runat="server" >
        <section class="col-lg-12 connectedSortable" > 
                            <!-- Box (with bar chart) -->
                            <div class="box box-danger" id="loading-example1">
                                <div class="box-header">
                                   <h4 class="box-title">Risk Management Matrix</h4>
                                    <!-- tools box -->
                                    <div class="pull-right box-tools">
                                        <button class="btn btn-danger btn-sm" title="Reload"><i class="fa fa-refresh"></i></button>
                                        <button id="btn" class="btn btn-danger btn-sm"><i class="fa fa-minus"></i></button>
                                        <button class="btn btn-danger btn-sm" data-widget='remove' title="Remove"><i class="fa fa-times"></i></button>
                                    </div><!-- /. tools -->
                                </div><!-- /.box-header -->
                                <div class="box-body no-padding">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="col-lg-2">
                <table>
                    <tr>
                        <td style="width:100px;height:65px;"></td>
                        <td style="width:100px;height:65px;"></td>
                        <td style="width:100px;height:65px;text-align:right;font-size:large;">5</td>
                    </tr>
                    <tr>
                        <td style="width:100px;height:65px;"></td>
                        <td style="width:100px;height:65px;"></td>
                        <td style="width:100px;height:65px;text-align:right;font-size:large;">4</td>
                    </tr>
                    <tr>
                        <td style="width:100px;height:65px;"></td>
                        <td style="width:100px;height:65px;text-align:right;font-size:large;font-weight:bold;"><asp:Label runat="server" CssClass="txtVertical" Text="Severity"></asp:Label></td>
                        <td style="width:100px;height:65px;text-align:right;font-size:large;">3</td>
                    </tr>
                    <tr>
                        <td style="width:100px;height:65px;"></td>
                        <td style="width:100px;height:65px;"></td>
                        <td style="width:100px;height:65px;text-align:right;font-size:large;">2</td>
                    </tr>
                    <tr>
                        <td style="width:100px;height:65px;"></td>
                        <td style="width:100px;height:65px;"></td>
                        <td style="width:100px;height:65px;text-align:right;font-size:large;">1</td>
                    </tr>
                    <tr>
                        <td style="width:100px;height:65px;"></td>
                        <td style="width:100px;height:65px;"></td>
                        <td style="width:100px;height:65px;text-align:right;font-size:large;">0</td>
                    </tr>
                </table>
            </div>
            <div class="col-lg-6">
                <table>
            <tr>
                <td style="background-color:#edfb19;width:100px;height:65px;border:1px solid black;font-size:large;text-align:center;">
                    <asp:Label runat="server" Font-Size="Small" Text="[5-25]"></asp:Label><br />
                    <asp:Label ID="Label1" runat="server" Text="" Font-Bold="true" Font-Size="X-Large"></asp:Label></td>
                <td style="background-color:#dbbc0f;width:100px;height:65px;border:1px solid black;font-size:large;text-align:center;" >
                    <asp:Label runat="server" Text="[26-50]" Font-Size="Small"></asp:Label><br /><asp:Label ID="Label2" runat="server" Text="" Font-Bold="true" Font-Size="X-Large"></asp:Label></td>
                <td style="background-color:#f92b13; width:100px;height:65px;border:1px solid black;font-size:large;text-align:center;">
                    <asp:Label runat="server" Text="[51-75]" Font-Size="Small"></asp:Label><br /><asp:Label ID="Label3" runat="server" Text="" Font-Bold="true" Font-Size="X-Large"></asp:Label></td>
                <td style="background-color:#f92b13;width:100px;height:65px;border:1px solid black;font-size:large;text-align:center;">
                    <asp:Label runat="server" Text="[76-100]" Font-Size="Small"></asp:Label><br /><asp:Label ID="Label4" runat="server" Text="" Font-Bold="true" Font-Size="X-Large"></asp:Label></td>
                <td style="background-color:#f92b13;width:100px;height:65px;border:1px solid black;font-size:large;text-align:center;">
                    <asp:Label runat="server" Text="[101-125]" Font-Size="Small"></asp:Label><br /><asp:Label ID="Label5" runat="server" Text="" Font-Bold="true" Font-Size="X-Large"></asp:Label></td>
            </tr>
            <tr>
                <td style="background-color:#edfb19;width:100px;height:65px;font-size:large;text-align:center;border:1px solid black">
                    <asp:Label runat="server" Text="[4-20]" Font-Size="Small"></asp:Label><br /><asp:Label ID="Label6" runat="server" Text="" Font-Bold="true" Font-Size="X-Large"></asp:Label></td>
                <td style="background-color:#edfb19;width:100px;height:65px;font-size:large;text-align:center;border:1px solid black">
                    <asp:Label runat="server" Text="[21-40]" Font-Size="Small"></asp:Label><br /><asp:Label ID="Label7" runat="server" Text="" Font-Bold="true" Font-Size="X-Large"></asp:Label></td>
                <td style="background-color:#dbbc0f;width:100px;height:65px;font-size:large;text-align:center;border:1px solid black">
                    <asp:Label runat="server" Text="[41-60]" Font-Size="Small"></asp:Label><br /><asp:Label ID="Label8" runat="server" Text="" Font-Bold="true" Font-Size="X-Large"></asp:Label></td>
                <td style="background-color:#f92b13;width:100px;height:65px;font-size:large;text-align:center;border:1px solid black">
                    <asp:Label runat="server" Text="[61-80]" Font-Size="Small"></asp:Label><br /><asp:Label ID="Label9" runat="server" Text="" Font-Bold="true" Font-Size="X-Large"></asp:Label></td>
                <td style="background-color:#f92b13;width:100px;height:65px;font-size:large;text-align:center;border:1px solid black">
                    <asp:Label runat="server" Text="[81-100]" Font-Size="Small"></asp:Label><br /><asp:Label ID="Label10" runat="server" Text="" Font-Bold="true" Font-Size="X-Large"></asp:Label></td>
            </tr>
            <tr>
                <td style="background-color:#59b048;width:100px;height:65px;font-size:large;text-align:center;border:1px solid black">
                    <asp:Label runat="server" Text="[3-15]" Font-Size="Small"></asp:Label><br /><asp:Label ID="Label11" runat="server" Text="" Font-Bold="true" Font-Size="X-Large"></asp:Label></td>
                <td style="background-color:#edfb19;width:100px;height:65px;font-size:large;text-align:center;border:1px solid black">
                    <asp:Label runat="server" Text="[16-30]" Font-Size="Small"></asp:Label><br /><asp:Label ID="Label12" runat="server" Text="" Font-Bold="true" Font-Size="X-Large"></asp:Label></td>
                <td style="background-color:#dbbc0f;width:100px;height:65px;font-size:large;text-align:center;border:1px solid black">
                    <asp:Label runat="server" Text="[31-45]" Font-Size="Small"></asp:Label><br /><asp:Label ID="Label13" runat="server" Text="" Font-Bold="true" Font-Size="X-Large"></asp:Label></td>
                <td style="background-color:#dbbc0f;width:100px;height:65px;font-size:large;text-align:center;border:1px solid black">
                    <asp:Label runat="server" Text="[46-60]" Font-Size="Small"></asp:Label><br /><asp:Label ID="Label14" runat="server" Text="" Font-Bold="true" Font-Size="X-Large"></asp:Label></td>
                <td style="background-color:#f92b13;width:100px;height:65px;font-size:large;text-align:center;border:1px solid black">
                    <asp:Label runat="server" Text="[61-75]" Font-Size="Small"></asp:Label><br /><asp:Label ID="Label15" runat="server" Text="" Font-Bold="true" Font-Size="X-Large"></asp:Label></td>
            </tr>
            <tr>
                <td style="background-color:#59b048;width:100px;height:65px;font-size:large;text-align:center;border:1px solid black">
                    <asp:Label runat="server" Text="[2-10]" Font-Size="Small"></asp:Label><br /><asp:Label ID="Label16" runat="server" Text="" Font-Bold="true" Font-Size="X-Large"></asp:Label></td>
                <td style="background-color:#edfb19;width:100px;height:65px;font-size:large;text-align:center;border:1px solid black">
                    <asp:Label runat="server" Text="[11-20]" Font-Size="Small"></asp:Label><br /><asp:Label ID="Label17" runat="server" Text="" Font-Bold="true" Font-Size="X-Large"></asp:Label></td>
                <td style="background-color:#edfb19;width:100px;height:65px;font-size:large;text-align:center;border:1px solid black">
                    <asp:Label runat="server" Text="[21-30]" Font-Size="Small"></asp:Label><br /><asp:Label ID="Label18" runat="server" Text="" Font-Bold="true" Font-Size="X-Large"></asp:Label></td>
                <td style="background-color:#edfb19;width:100px;height:65px;font-size:large;text-align:center;border:1px solid black">
                    <asp:Label runat="server" Text="[31-40]" Font-Size="Small"></asp:Label><br /><asp:Label ID="Label19" runat="server" Text="" Font-Bold="true" Font-Size="X-Large"> </asp:Label></td>
                <td style="background-color:#dbbc0f;width:100px;height:65px;font-size:large;text-align:center;border:1px solid black">
                    <asp:Label runat="server" Text="[41-50]" Font-Size="Small"></asp:Label><br /><asp:Label ID="Label20" runat="server" Text="" Font-Bold="true" Font-Size="X-Large"></asp:Label></td>
            </tr>
            <tr>
                <td style="background-color:#59b048;width:100px;height:65px;font-size:large;text-align:center;border:1px solid black">
                    <asp:Label runat="server" Text="[1-5]" Font-Size="Small"></asp:Label><br /><asp:Label ID="Label21" runat="server" Text="" Font-Bold="true" Font-Size="X-Large"></asp:Label></td>
                <td style="background-color:#59b048;width:100px;height:65px;font-size:large;text-align:center;border:1px solid black">
                    <asp:Label runat="server" Text="[6-10]" Font-Size="Small"></asp:Label><br /><asp:Label ID="Label22" runat="server" Text="" Font-Bold="true" Font-Size="X-Large"></asp:Label></td>
                <td style="background-color:#59b048;width:100px;height:65px;font-size:large;text-align:center;border:1px solid black">
                    <asp:Label runat="server" Text="[11-15]" Font-Size="Small"></asp:Label><br /><asp:Label ID="Label23" runat="server" Text="" Font-Bold="true" Font-Size="X-Large"></asp:Label></td>
                <td style="background-color:#edfb19;width:100px;height:65px;font-size:large;text-align:center;border:1px solid black">
                    <asp:Label runat="server" Text="[16-20]" Font-Size="Small"></asp:Label><br /><asp:Label ID="Label24" runat="server" Text="" Font-Bold="true" Font-Size="X-Large"></asp:Label></td>
                <td style="background-color:#edfb19;width:100px;height:65px;font-size:large;text-align:center;border:1px solid black">
                    <asp:Label runat="server" Text="[21-15]" Font-Size="Small"></asp:Label><br /><asp:Label ID="Label25" runat="server" Text="" Font-Bold="true" Font-Size="X-Large"></asp:Label></td>
            </tr><br /><br />
                    <tr>
                <td style="width:100px;text-align:right;font-size:large;">5</td>
                <td style="width:100px;text-align:right;font-size:large;">10</td>
                <td style="width:100px;text-align:right;font-size:large;">15</td>
                <td style="width:100px;text-align:right;font-size:large;">20</td>
                <td style="width:100px;text-align:right;font-size:large;">25</td>
            </tr>
            <tr>
                <td colspan="5" style="text-align:center;font-size:large;font-weight:bold;"><asp:Label ID="Label31" runat="server" Text="Probability ⨯ Detectability"></asp:Label></td>
            </tr>                             
        </table>
            </div>
            <div class="col-lg-3">

            </div>
                                        </div>
                                    </div><!-- /.row - inside box -->
                                </div><!-- /.box-body -->
                            </div><!-- /.box -->  

                        </section><!-- /.Left col -->
         </div>
     
    <div>
        <section class="col-lg-6 connectedSortable"> 
                            <!-- Box (with bar chart) -->
                            <div class="box box-danger" id="loading-example1">
                                <div class="box-header">
                                   <h4 class="box-title">Summary of Exposure - mCRC </h4>
                                    <!-- tools box -->
                                    <div class="pull-right box-tools">
                                        <button class="btn btn-danger btn-sm" title="Reload"><i class="fa fa-refresh"></i></button>
                                        <button id="btn" class="btn btn-danger btn-sm"><i class="fa fa-minus"></i></button>
                                        <button class="btn btn-danger btn-sm" data-widget='remove' title="Remove"><i class="fa fa-times"></i></button>
                                    </div><!-- /. tools -->
                                </div><!-- /.box-header -->
                                <div class="box-body no-padding">
                                    <div class="row">
                                        <asp:HiddenField ID="hfExposuremCRC" runat="server" />
                                        <div id="ExposuremCRCBar" class="chartdiv"></div>
                                    </div><!-- /.row - inside box -->
                                </div><!-- /.box-body -->
                            </div><!-- /.box -->  

                        </section><!-- /.Left col -->
        <section class="col-lg-6 connectedSortable"> 
                            <!-- Box (with bar chart) -->
                            <div class="box box-danger" id="loading-example1">
                                <div class="box-header">
                                   <h4 class="box-title">Summary of Exposure - NSCLC</h4>
                                    <!-- tools box -->
                                    <div class="pull-right box-tools">
                                        <button class="btn btn-danger btn-sm"  title="Reload"><i class="fa fa-refresh"></i></button>
                                        <button id="btn" class="btn btn-danger btn-sm"><i class="fa fa-minus"></i></button>
                                        <button class="btn btn-danger btn-sm" data-widget='remove'  title="Remove"><i class="fa fa-times"></i></button>
                                    </div><!-- /. tools -->
                                </div><!-- /.box-header -->
                                <div class="box-body no-padding">
                                    <div class="row">
                                        <asp:HiddenField ID="hfExposureNSCLC" runat="server" />
                                        <div id="ExposureNSCLCBar" class="chartdiv"></div>
                                    </div><!-- /.row - inside box -->
                                </div><!-- /.box-body -->
                            </div><!-- /.box -->  

                        </section><!-- /.Left col -->
    </div>
     <div class="row">
                        <!-- Left col -->
                        <section class="col-lg-6 connectedSortable"> 
                            <!-- Box (with bar chart) -->
                            <div class="box box-danger" id="loading-example1">
                                <div class="box-header">
                                   <h4 class="box-title">Protocol Deviation(Major and Minor)</h4>
                                    <!-- tools box -->
                                    <div class="pull-right box-tools">
                                        <button class="btn btn-danger btn-sm" title="Reload"><i class="fa fa-refresh"></i></button>
                                        <button id="btn" class="btn btn-danger btn-sm"><i class="fa fa-minus"></i></button>
                                        <button class="btn btn-danger btn-sm" data-widget='remove' title="Remove"><i class="fa fa-times"></i></button>
                                    </div><!-- /. tools -->
                                </div><!-- /.box-header -->
                                <div class="box-body no-padding">
                                    <div class="row">
                                        <asp:HiddenField ID="hfpd" runat="server" />
                                        <div id="pieex" class="piediv"></div>
                                    </div><!-- /.row - inside box -->
                                </div><!-- /.box-body -->
                            </div><!-- /.box -->  

                        </section><!-- /.Left col -->
           <section class="col-lg-6 connectedSortable"> 
                            <!-- Box (with bar chart) -->
                            <div class="box box-danger" id="loading-example1">
                                <div class="box-header">
                                   <h4 class="box-title">Protocol Deviation by Category</h4>
                                    <!-- tools box -->
                                    <div class="pull-right box-tools">
                                        <button class="btn btn-danger btn-sm" title="Reload"><i class="fa fa-refresh"></i></button>
                                        <button id="btn" class="btn btn-danger btn-sm"><i class="fa fa-minus"></i></button>
                                        <button class="btn btn-danger btn-sm" data-widget='remove' title="Remove"><i class="fa fa-times"></i></button>
                                    </div><!-- /. tools -->
                                </div><!-- /.box-header -->
                                <div class="box-body no-padding">
                                    <div class="row">
                                        <asp:HiddenField ID="hfcat1chart" runat="server" />
                                        <div id="catchart" class="chartdiv"></div>
                                    </div><!-- /.row - inside box -->
                                </div><!-- /.box-body -->
                            </div><!-- /.box -->  

                        </section><!-- /.Left col -->
                    </div>
    <div class="row">
                        <!-- Left col -->
                        <section class="col-lg-12 connectedSortable"> 
                            <!-- Box (with bar chart) -->
                            <div class="box box-danger" id="loading-example1">
                                <div class="box-header">
                                   <h4 class="box-title">Protocol Deviation by Category</h4>
                                    <!-- tools box -->
                                    <div class="pull-right box-tools">
                                        <button class="btn btn-danger btn-sm" title="Reload"><i class="fa fa-refresh"></i></button>
                                        <button id="btn" class="btn btn-danger btn-sm"><i class="fa fa-minus"></i></button>
                                        <button class="btn btn-danger btn-sm" data-widget='remove' title="Remove"><i class="fa fa-times"></i></button>
                                    </div><!-- /. tools -->
                                </div><!-- /.box-header -->
                                <div class="box-body no-padding">
                                    <div class="row">
                                        <asp:HiddenField ID="hfcat1" runat="server" />
                                        <div id="pieex1" class="piediv"></div>
                                    </div><!-- /.row - inside box -->
                                </div><!-- /.box-body -->
                            </div><!-- /.box -->  

                        </section><!-- /.Left col --></div>
    <div class="row">
      
                    </div>

    <script type="text/javascript">

         var ExposureNSCLCdata = eval('(' + $("#<%=hfExposureNSCLC.ClientID%>").val() + ')');
         var ExposureNSCLCchart = AmCharts.makeChart("ExposureNSCLCBar", {
  "type": "serial",
  "addClassNames": true,
  "theme": "light",
  "autoMargins": false,
  "marginLeft": 30,
  "marginRight": 8,
  "marginTop": 10,
  "marginBottom": 26,
  "balloon": {
    "adjustBorderColor": false,
    "horizontalPadding": 10,
    "verticalPadding": 8,
    "color": "#ffffff"
  },

  "dataProvider": ExposureNSCLCdata,
  "valueAxes": [ {
    "axisAlpha": 0,
    "position": "left"
  } ],
  "startDuration": 1,
  "graphs": [ {
    "id": "graph2",
    "balloonText": "<span style='font-size:12px;'>[[category]]:<br><span style='font-size:20px;'>[[value]]</span> [[additional]]</span>",
    "bullet": "round",
    "lineThickness": 3,
    "bulletSize": 7,
    "bulletBorderAlpha": 1,
    "bulletColor": "#FFFFFF",
    "useLineColorForBulletBorder": true,
    "bulletBorderThickness": 3,
    "fillAlphas": 0,
    "lineAlpha": 1,
    "title": "Value",
    "valueField": "value",
    "dashLengthField": "dashLengthLine"
  } ],
  "categoryField": "Dose",
  "categoryAxis": {
    "gridPosition": "start",
    "axisAlpha": 0,
    "tickLength": 0
  },
  "export": {
    "enabled": true
  }
} );
</script>
    <script type="text/javascript">
         var ExposuremCRCdata = eval('(' + $("#<%=hfExposuremCRC.ClientID%>").val() + ')');
         var ExposuremCRCchart = AmCharts.makeChart("ExposuremCRCBar", {
  "type": "serial",
  "addClassNames": true,
  "theme": "light",
  "autoMargins": false,
  "marginLeft": 30,
  "marginRight": 8,
  "marginTop": 10,
  "marginBottom": 26,
  "balloon": {
    "adjustBorderColor": false,
    "horizontalPadding": 10,
    "verticalPadding": 8,
    "color": "#ffffff"
  },

  "dataProvider": ExposuremCRCdata,
  "valueAxes": [ {
    "axisAlpha": 0,
    "position": "left"
  } ],
  "startDuration": 1,
  "graphs": [ {
    "id": "graph2",
    "balloonText": "<span style='font-size:12px;'>[[category]]:<br><span style='font-size:20px;'>[[value]]</span> [[additional]]</span>",
    "bullet": "round",
    "lineThickness": 3,
    "bulletSize": 7,
    "bulletBorderAlpha": 1,
    "bulletColor": "#FFFFFF",
    "useLineColorForBulletBorder": true,
    "bulletBorderThickness": 3,
    "fillAlphas": 0,
    "lineAlpha": 1,
    "title": "Value",
    "valueField": "value",
    "dashLengthField": "dashLengthLine"
  } ],
  "categoryField": "Dose",
  "categoryAxis": {
    "gridPosition": "start",
    "axisAlpha": 0,
    "tickLength": 0
  },
  "export": {
    "enabled": true
  }
} );
</script>
     <script type="text/javascript">

         var bar_data = eval('(' + $("#<%=hfrandomised.ClientID%>").val() + ')');
         var chart3 = AmCharts.makeChart("randomised", {
            "theme": "light",
            "type": "serial",
            "startDuration": 2,
            "dataProvider": bar_data,
            "valueAxes": [{
                "position": "left",
                "title": ""
            }],
            "graphs": [{
                "balloonText": "[[category]]: <b>[[value]]</b>",
                "fillColorsField": "color",
                "fillAlphas": 1,
                "lineAlpha": 0.1,
                "labelText": "[[Randomised]]",
                "type": "column",
                "valueField": "Randomised"
            }],
            "depth3D": 20,
            "angle": 30,
            "chartCursor": {
                "categoryBalloonEnabled": false,
                "cursorAlpha": 0,
                "zoomable": false
            },
            "categoryField": "VistDate",
            "categoryAxis": {
                "gridPosition": "start",
                "labelRotation": 90
            },
            "export": {
                "enabled": true
            }

        });
    </script>
    <script type="text/javascript">
         var bar_data = eval('(' + $("#<%=hfStatusNSCLC.ClientID%>").val() + ')');
         var chart1 = AmCharts.makeChart("StatusNSCLCBar", {
            "theme": "light",
            "type": "serial",
            "startDuration": 2,
            "dataProvider": bar_data,
            "valueAxes": [{
                "position": "left",
                "title": ""
            }],
            "graphs": [{
                "balloonText": "[[category]]: <b>[[value]]</b>",
                "fillColorsField": "color",
                "fillAlphas": 1,
                "lineAlpha": 0.1,
                "labelText": "[[value]]",
                "type": "column",
                "valueField": "study"
            }],
            "depth3D": 20,
            "angle": 30,
            "chartCursor": {
                "categoryBalloonEnabled": false,
                "cursorAlpha": 0,
                "zoomable": false
            },
            "categoryField": "status",
            "categoryAxis": {
                "gridPosition": "start",
                "labelRotation": 0
            },
            "export": {
                "enabled": true
            }

        });
    </script>
    <script type="text/javascript">

            var bar_data = eval('(' + $("#<%=hfcolorbar.ClientID%>").val() + ')');
             var chart2 = AmCharts.makeChart("colorBar", {
                 "theme": "light",
                 "type": "serial",
                 "startDuration": 2,
                 "dataProvider": bar_data,
                 "valueAxes": [{
                     "position": "left",
                     "title": ""
                 }],
                 "graphs": [{
                     "balloonText": "[[category]]: <b>[[value]]</b>",
                     "fillColorsField": "color",
                     "fillAlphas": 1,
                     "lineAlpha": 0.1,
                     "labelText": "[[value]]",
                     "type": "column",
                     "valueField": "study"
                 }],
                 "depth3D": 20,
                 "angle": 30,
                 "chartCursor": {
                     "categoryBalloonEnabled": false,
                     "cursorAlpha": 0,
                     "zoomable": false
                 },
                 "categoryField": "status",
                 "categoryAxis": {
                     "gridPosition": "start",
                     "labelRotation": 0
                 },
                 "export": {
                     "enabled": true
                 }

             }); 
       
     </script>
    <script type="text/javascript">
        var piedata = eval('(' + $("#<%=hfpd.ClientID%>").val() + ')');  
        var pchart = AmCharts.makeChart("pieex", {
            "type": "pie",
            "startDuration": 0,
            "theme": "light",
            "addClassNames": true,
            "legend": {
                "position": "right",
                "marginRight": 100,
                "autoMargins": false
            },
            "defs": {
                "filter": [{
                    "id": "shadow",
                    "width": "200%",
                    "height": "200%",
                    "feOffset": {
                        "result": "offOut",
                        "in": "SourceAlpha",
                        "dx": 0,
                        "dy": 0
                    },
                    "feGaussianBlur": {
                        "result": "blurOut",
                        "in": "offOut",
                        "stdDeviation": 5
                    },
                    "feBlend": {
                        "in": "SourceGraphic",
                        "in2": "blurOut",
                        "mode": "normal"
                    }
                }]
            },
            "dataProvider":piedata,    
            "valueField": "CNTPDMAJMIN",
            "titleField": "Cat",
            "export": {
                "enabled": true
            }
        });

        pchart.addListener("init", handleInit);

        pchart.addListener("rollOverSlice", function (e) {
            handleRollOver(e);
        });

        function handleInit() {
            pchart.legend.addListener("rollOverItem", handleRollOver);
        }

        function handleRollOver(e) {
            var wedge = e.dataItem.wedge.node;
            wedge.parentNode.appendChild(wedge);
        }
    </script>

    <script type="text/javascript">
        var piedata1 = eval('(' + $("#<%=hfcat1.ClientID%>").val() + ')');  
        var pchar1t = AmCharts.makeChart("pieex1", {
            "type": "pie",
            "startDuration": 0,
            "theme": "light",
            "addClassNames": true,
            "legend": {
                "position": "right",
                "marginRight": 100,
                "autoMargins": false
            },
            "defs": {
                "filter": [{
                    "id": "shadow",
                    "width": "200%",
                    "height": "200%",
                    "feOffset": {
                        "result": "offOut",
                        "in": "SourceAlpha",
                        "dx": 0,
                        "dy": 0
                    },
                    "feGaussianBlur": {
                        "result": "blurOut",
                        "in": "offOut",
                        "stdDeviation": 5
                    },
                    "feBlend": {
                        "in": "SourceGraphic",
                        "in2": "blurOut",
                        "mode": "normal"
                    }
                }]
            },
            "dataProvider":piedata1,    
            "valueField": "CNTPDCAT",
            "titleField": "PDCatagory",
            "export": {
                "enabled": true
            }
        });

        pchar1t.addListener("init", handleInit);

        pchar1t.addListener("rollOverSlice", function (e) {
            handleRollOver(e);
        });

        function handleInit() {
            pchar1t.legend.addListener("rollOverItem", handleRollOver);
        }

        function handleRollOver(e) {
            var wedge = e.dataItem.wedge.node;
            wedge.parentNode.appendChild(wedge);
        }
    </script>

    <script type="text/javascript">

         var bar_data1 = eval('(' + $("#<%=hfcat1chart.ClientID%>").val() + ')');
        var chartcat = AmCharts.makeChart("catchart", {
            "theme": "light",
            "type": "serial",
            "startDuration": 2,
            "dataProvider": bar_data1,
            "valueAxes": [{
                "position": "left",
                "title": ""
            }],
            "graphs": [{
                "balloonText": "[[PDCatagory]]: <b>[[CNTPDCAT]]</b>",
                "fillColorsField": "color",
                "fillAlphas": 1,
                "lineAlpha": 0.1,
                "labelText": "[[CNTPDCAT]]",
                "type": "column",
                "valueField": "CNTPDCAT"
            }],
            "depth3D": 20,
            "angle": 30,
            "chartCursor": {
                "categoryBalloonEnabled": false,
                "cursorAlpha": 0,
                "zoomable": false
            },
            "categoryField": "PDCatagory",
            "categoryAxis": {
                "gridPosition": "start",
                "labelRotation": 90
            },
            "export": {
                "enabled": true
            }

        });
    </script>
    <script>
        var doublebar = eval('(' + $("#<%=hfdouble.ClientID%>").val() + ')');
        var chart = AmCharts.makeChart("doublebar", {
            "type": "serial",
            "theme": "light",
            "legend": {
                "horizontalGap": 10,
                "maxColumns": 1,
                "position": "right",
                "useGraphSettings": true,
                "markerSize": 10
            },
            "dataProvider": doublebar,
            "valueAxes": [{
                "gridColor": "#FFFFFF",
                "gridAlpha": 0.1,
                "dashLength": 0
            }],
            "gridAboveGraphs": true,
            "startDuration": 1,
            "graphs": [{
                "balloonText": "Screened: <b>[[value]]</b>",
                "fillAlphas": 0.8,
                "lineAlpha": 0.1,
                "labelText": "[[Screened]]",
                "type": "column",
                "title": "Screened",
                "color":"#000000",
                "valueField": "Screened"
            },
            {
                "balloonText": "Screen Failure: <b>[[value]]</b>",
                "fillAlphas": 0.8,
                "lineAlpha": 0,
                "labelText": "[[ScreenFailure]]",
                "title": "Screen Failure",
                "type": "column",
                "color": "#000000",
                "valueField": "ScreenFailure"
            }],
            "chartCursor": {
                "categoryBalloonEnabled": false,
                "cursorAlpha": 0,
                "zoomable": false
            },
            "categoryField": "VistDate",
            "categoryAxis": {
                "gridPosition": "start",
                "gridAlpha": 0.1,
                "tickPosition": "start",
                "tickLength": 10,
                "labelRotation": 90
            },
            "export": {
                "enabled": true
            }

        });
    </script>
</asp:Content>
