using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;

namespace PPT
{
    public partial class Auth : System.Web.UI.Page
    {
        DAL constr = new DAL();

        protected void Page_Load(object sender, EventArgs e)
        {

            //this.Rotator.Text = "<FONT SIZE='2' FACE='Arial' COLOR=Black><MARQUEE SCROLLAMOUNT=6 WIDTH=75% BEHAVIOR=SCROLL BGColor=White><b>" + "DiagnoSearch Life Sciences Pvt Ltd. has Operations In India,South Korea, Thailand, Taiwan, Malaysia, Mexico & US" + "</b></MARQUEE></FONT>";
            if (hdn.Value != "1")
            {
                Session.Clear();
            }
            //if (Session["User_ID"] != null)
            //{
            //    SqlConnection con = new SqlConnection(constr.getconstr());
            //    SqlCommand cmd3 = new SqlCommand();
            //    cmd3.CommandType = CommandType.StoredProcedure;
            //    cmd3.Connection = con;
            //    cmd3.CommandText = "Update_Alrdy_Log_IN";
            //    con.Open();
            //    cmd3.Parameters.AddWithValue("@Action", "LogOut");
            //    cmd3.Parameters.AddWithValue("@User_ID", Session["User_ID"].ToString());
            //    cmd3.ExecuteNonQuery();
            //    con.Close();
            //    Session["User_ID"] = null;
            //}

        }

        protected void Btn_Login_Click(object sender, EventArgs e)
        {
            try
            {

                //System.Web.HttpBrowserCapabilities browser = Request.Browser;
                //string BrowserName = browser.Browser.ToString();
                //float BrowserVersion = float.Parse(browser.Version);

                //if (Request.Browser.Browser == "IE")
                //{
                //    if (BrowserVersion < 9)
                //    {
                //        throw new Exception("You are using I.E Version Older than 9.0, This Application will work on I.E >= 9.0 , Google Chrome and Mozilla");
                //    }
                //}

                string Host_IP = Request.UserHostAddress.ToString();
                SqlConnection con = new SqlConnection(constr.getconstr());
                con.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "User_Auth";
                cmd.Connection = con;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@UserID", this.txt_UserName.Text);
                cmd.Parameters.AddWithValue("@Pwd", this.txt_Pwd.Text);
                cmd.Parameters.AddWithValue("@Host_IP", Host_IP);

                var returnParam1 = new SqlParameter
                {
                    ParameterName = "@Result",
                    Direction = ParameterDirection.Output,
                    Size = 1
                };
                cmd.Parameters.Add(returnParam1);
                cmd.ExecuteNonQuery();
                string retunvalue = (string)cmd.Parameters["@Result"].Value;
                con.Close();

                if (retunvalue == "1")
                {

                    throw new Exception("Invalid Credentials");
                }
                else if (retunvalue == "2")
                {

                    throw new Exception("User Account has been Locked.");
                }
                else if (retunvalue == "3")
                {
                    Session["User_ID"] = this.txt_UserName.Text;
                    Response.Redirect("Change_Password.aspx");
                }
                else if (retunvalue == "4")
                {
                    Session["User_ID"] = this.txt_UserName.Text;
                    Response.Redirect("Change_Password.aspx");
                }

                else if (retunvalue == "5")
                {
                    throw new Exception("Invalid Credentials");
                }

                else if (retunvalue == "6")
                {
                    throw new Exception("User Has Already been Logged IN");
                }

                else if (retunvalue == "0")
                {
                    Session["User_ID"] = this.txt_UserName.Text;

                    SqlCommand cmd3 = new SqlCommand();
                    cmd3.CommandType = CommandType.StoredProcedure;
                    cmd3.Connection = con;
                    cmd3.CommandText = "Update_Alrdy_Log_IN";
                    con.Open();
                    cmd3.Parameters.AddWithValue("@Action", "LogIn");
                    cmd3.Parameters.AddWithValue("@User_ID", Session["User_ID"].ToString());
                    cmd3.ExecuteNonQuery();
                    con.Close();

                    //con.Open();
                    //SqlCommand cmd1 = new SqlCommand();
                    //cmd1.CommandText = "Approval_Doc_Count";
                    //cmd1.Connection = con;
                    //cmd1.CommandType = CommandType.StoredProcedure;
                    //cmd1.Parameters.AddWithValue("@User_ID", this.txt_UserName.Text);
                    //SqlDataReader myReader;
                    //myReader = cmd1.ExecuteReader();

                    //while (myReader.Read())
                    //{
                    //    Session["CountAppDoc"] = myReader["DOC_ID"].ToString();                        
                    //}
                    //con.Close();

                    con.Open();
                    SqlCommand cmd2 = new SqlCommand();
                    cmd2.CommandText = "PWD_EXP_Reminder";
                    cmd2.Connection = con;
                    cmd2.CommandType = CommandType.StoredProcedure;
                    cmd2.Parameters.AddWithValue("@User_ID", this.txt_UserName.Text);
                    SqlDataReader myReader1;
                    myReader1 = cmd2.ExecuteReader();

                    while (myReader1.Read())
                    {
                        Session["PWDExpire"] = myReader1["Result"].ToString();
                        Session["NoofDays"] = myReader1["NoofDays"].ToString();
                        Session["UserGroup_ID"] = myReader1["UserGroup_ID"].ToString();
                    }
                    con.Close();

                    //define required session for aproject 
                    //Session["Type"] = null; //this session used in grade dashboard page.
                    //Session["PROJECTID"] = "1";//temporary set to 1 because all lab data contain project id = 1


                    //string strCmd;
                    //strCmd = "select Project_ID from PROJDETAILS";
                    //DataSet ds = new DataSet();
                    //ds = constr.GetRecordOpenCRF(strCmd);
                    //Session["PROJECTID"] = ds.Tables[0].Rows[0][0].ToString();

                 //   Response.Redirect("SelectProject.aspx");


                    divLogin.Visible = false;
                    divProject.Visible = true;
                    fill_Project();
                }
            }
            catch (Exception ex)
            {
                lblErrorMsg.Text = "";
                lblErrorMsg.Text = ex.Message;
            }
        }

        protected void btnContinue_Click(object sender, EventArgs e)
        {
            try
            {
                //Session["PROJECTID"] = null;

                //for checklist session
                Session["MonitoringINVID"] = null;
                Session["MonitoringMVID"] = null;
                Session["InitiationINVID"] = null;
                Session["InitiationMVID"] = null;
                Session["QualificationINVID"] = null;
                Session["QualificationMVID"] = null;
                Session["CloseOutINVID"] = null;
                Session["CloseOutMVID"] = null;
                //for checklist session


                Session["PROJECTID"] = drp_Project.SelectedItem.Value;
                Session["PROJECTIDTEXT"] = drp_Project.SelectedItem.Text;
                Response.Redirect("HomePage.aspx");
            }
            catch (Exception ex)
            {
                lblErrorMsg.Text = ex.Message.ToString();
            }
        }
        private void fill_Project()
        {
            try
            {
                DAL dal;
                dal = new DAL();
                DataSet ds = dal.GetSetPROJECTDETAILS(
                Action: "Get_Project",
                ENTEREDBY: Session["User_ID"].ToString()
                );
                drp_Project.DataSource = ds.Tables[0];
                drp_Project.DataValueField = "Project_ID";
                drp_Project.DataTextField = "PROJNAME";
                drp_Project.DataBind();
                drp_Project.Items.Insert(0, new ListItem("--Select Project--", "0"));
                hdn.Value = "1";
            }
            catch (Exception ex)
            {
                lblErrorMsg.Text = ex.Message.ToString();
            }

        }
    }
}