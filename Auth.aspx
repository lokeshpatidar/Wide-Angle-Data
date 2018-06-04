<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Auth.aspx.cs" Inherits="PPT.Auth" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html class="bg-black">
<head>
	<meta charset="UTF-8">
	<title>Diagnosearch</title>
   <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
	<!-- bootstrap 3.0.2 -->
    <link href="Styles/Common-Bootstrap.css" rel="stylesheet" type="text/css" />	
	<!-- font Awesome -->
    <link href="Styles/font-awesome.css" rel="stylesheet" type="text/css" />
	<!-- Theme style -->
    <link href="Styles/AdminLTE.css" rel="stylesheet" type="text/css" />

	<link rel="icon" href="img/favicon.ico" type="image/x-icon">
	<link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon" />
<%--    <style>
        .bottomdiv
{
 position: absolute;
 left:    0;
 right:   0;
 z-index : 100;
 filter : alpha(opacity=100);
 POSITION: fixed;
 bottom: 0;
}
.hide {
 display: none;
}
    </style>
    <script>
        setTimeout(function () {
            document.getElementById('footer').classList.remove('hide');
        }, 5000);
    </script>--%>
</head>
<body class="bg-black">
    <%--<div class="bottomdiv hide" id="footer">
   <iframe src="image/Wide-Angle-Data-Animation-20170602.pptx" width="990" height="110"  scrolling="no"></iframe>
  </div>--%>
	<div class="form-box" id="login-box">
		<div><%--<img id="ImgLogo" src="img/logo44.png" /> --%> <img id="ImgLogo" src="image/finalauthimg.png" style="max-width:100%;"/></ /div>
		<form id="Form1" action="#" method="post" runat="server">
          
            <div id="divLogin" runat="server">
			<div class="body bg-gray">
              <asp:Label ID="lblErrorMsg" runat="server" 
                        style="color: #CC3300; font-size: small;" ForeColor="Red"></asp:Label>
				<div class="form-group">
				<asp:TextBox ID="txt_UserName" runat="server" class="form-control" Width="320px" name="username" 
      placeholder="Username" required="" autofocus=""></asp:TextBox>
				</div>
				<div class="form-group">
					<asp:TextBox ID="txt_Pwd" runat="server" class="form-control"   Width="320px"  TextMode="Password" name="password" placeholder="Password" required=""></asp:TextBox>
         
				</div>
				<%--<div class="form-group">
					<input type="checkbox" name="remember_me" /> Remember me
				</div>--%>
			</div>
			<div class="footer">
				<%--<a class="btn bg-olive btn-block" href="index.html">Sign me in</a>

				<p><a href="#">I forgot my password</a></p>

				<a href="register.html" class="text-center">Register a new membership</a>--%>
                 <asp:Button ID="Btn_Login" runat="server" class="btn bg-olive btn-block" style="margin-top:10px" type="submit"
                        onclick="Btn_Login_Click" Text="Login"  />
			</div>
            </div>
            <div id="divProject"  runat="server" visible="False"  class="footer" style="background-color:#e3e4e4;">

          <h5>Select Project</h5>   
          <div style="align-content:center"><asp:DropDownList ID="drp_Project" runat="server" class="form-control"                                   
                  Width="320px">
             </asp:DropDownList>
              <asp:CompareValidator ID="Comp_Val_Sel_Proj_Name" runat="server" 
                            ControlToValidate="drp_Project" ErrorMessage="Required" Font-Size="X-Small" 
                            ForeColor="#FF3300" Operator="NotEqual" ValueToCompare="0"></asp:CompareValidator>
                  </div>
                
         <asp:Button ID="btnContinue" runat="server" 
                 class="btn bg-olive btn-block" type="submit" style="margin-top:10px"
                         Text="Continue" onclick="btnContinue_Click"  />
              <asp:HiddenField runat="server" ID="hdn" Value="0" />
                    
         </div>
		</form>
		<%--<div class="margin text-center">
			<span>Sign in using social networks</span>
			<br />
			<button class="btn bg-light-blue btn-circle"><i class="fa fa-facebook"></i></button>
			<button class="btn bg-aqua btn-circle"><i class="fa fa-twitter"></i></button>
			<button class="btn bg-red btn-circle"><i class="fa fa-google-plus"></i></button>
		</div>--%>
	</div>

	
</body>
   
</html>
