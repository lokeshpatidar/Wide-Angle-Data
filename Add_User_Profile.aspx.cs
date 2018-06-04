using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace PPT
{
    public partial class Add_User_Profile : System.Web.UI.Page
    {

        DAL constr = new DAL();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!this.IsPostBack)
            {
                fill_Proj_Name();
            }
            Session["PVID"] = null;
        }

        private void fill_Proj_Name()
        {
            DAL dal;
            dal = new DAL();
            DataSet ds = dal.GetSetPROJECTDETAILS(
            Action: "Get_Specific_Project",
            Project_ID: Convert.ToInt32(Session["PROJECTID"]),
            ENTEREDBY: Session["User_ID"].ToString()
            );
            Drp_Project_Name.DataSource = ds;
            Drp_Project_Name.DataValueField = "PROJNAME";
            Drp_Project_Name.DataBind();



            Drp_Project_Name.Items.Insert(0, new ListItem("--Select Project Name--", "0"));
            Drp_User_Group.Items.Insert(0, new ListItem("--Select User Group--", "0"));
            // Drp_Site_ID.Items.Insert(0, new ListItem("--Select Site ID--", "0"));
        }
        private void fill_drpdwn_Site_ID()
        {
            try
            {
                SqlConnection con = new SqlConnection(constr.getconstr());
                SqlCommand cmd = new SqlCommand("Get_Site_ID_Details", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Action", "INVID");
                cmd.Parameters.AddWithValue("@Project_Name", Drp_Project_Name.SelectedValue);
                SqlDataAdapter ad = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                ad.Fill(ds);
                grdINV.DataSource = ds;
                grdINV.DataBind();
            }

            catch (Exception ex)
            {
                lblErrorMsg.Text = "";
                lblErrorMsg.Text = ex.Message;
            }
        }
        private void fill_drpdwn_User_Group_ID()
        {
            try
            {
                SqlConnection con = new SqlConnection(constr.getconstr());
                SqlCommand cmd = new SqlCommand("Get_User_Group_ID", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Project_Name", Drp_Project_Name.SelectedValue);
                SqlDataAdapter ad = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                ad.Fill(ds);
                Drp_User_Group.DataSource = ds.Tables[0];
                Drp_User_Group.DataValueField = "UserGroup_Name";
                Drp_User_Group.DataBind();
                con.Close();
                Drp_User_Group.Items.Insert(0, new ListItem("--Select User Group--", "0"));
            }

            catch (Exception ex)
            {
                lblErrorMsg.Text = "";
                lblErrorMsg.Text = ex.Message;
            }
        }
        protected void Btn_Add_Click(object sender, EventArgs e)
        {
            try
            {
                string EmailAdd = "abc@abc.com";
                string CCEmailAddress = "HI";
                string E_Sub = "HI";
                string E_Body = "HI";

                SqlConnection con = new SqlConnection(constr.getconstr());
                con.Open();

                DataSet ds = constr.AddUserProfile(Action: "INSERT", Project_Name: Drp_Project_Name.SelectedValue, USerGroup_Name: Drp_User_Group.SelectedValue, CNTRYID: drpCountry.SelectedItem.Value, User_Name: txt_User_Name.Text
                    , ENTEREDBY: Session["User_ID"].ToString(), Email: txt_EmailID.Text, User_Dis_Name: txt_User_Dis_Name.Text);

                string UserID = ds.Tables[0].Rows[0][0].ToString();
                Int16 i;
                for (i = 0; i < grdINV.Rows.Count; i++)
                {
                    CheckBox ChAction;
                    ChAction = (CheckBox)grdINV.Rows[i].FindControl("Chk_Sel_Fun");
                    if (ChAction.Checked)
                    {
                        TextBox T_INVID;
                        TextBox INVNAME;
                        T_INVID = (TextBox)grdINV.Rows[i].FindControl("txt_INVID");
                        INVNAME = (TextBox)grdINV.Rows[i].FindControl("txt_INVNAME");

                        ds = constr.AddUserProfile(Action: "INSERT_INV", Project_Name: Drp_Project_Name.SelectedValue, USERID: UserID, Site_ID: T_INVID.Text, INVNAME: INVNAME.Text);
                    }
                }
                //  SendEmail(txt_User_Name.Text, txt_EmailID.Text);

                Response.Write("<script> alert('Record Updated successfully.');window.location='Add_User_Profile.aspx'; </script>");

            }
            catch (Exception ex)
            {
                lblErrorMsg.Text = "";
                lblErrorMsg.Text = ex.Message;
            }
        }

        protected void SendEmail(string User_Name, string Email_ID)
        {
            try
            {
                string EmailAdd = "helpdesk@diagnosearch.com";
                string CCEmailAddress = "";
                string E_Sub = "";
                string E_Body = "";
                CommonFunction commFun = new CommonFunction();

                SqlConnection con = new SqlConnection(constr.getconstr());

                string UID = "";
                string PWD = "";

                SqlCommand cmd3 = new SqlCommand();
                SqlDataReader myReader;
                con = new SqlConnection(constr.getconstr());

                cmd3.CommandType = CommandType.StoredProcedure;
                cmd3.Connection = con;
                con.Open();

                cmd3.CommandText = "GetPassword";
                cmd3.Parameters.AddWithValue("@User_Name", User_Name);

                myReader = cmd3.ExecuteReader();

                while (myReader.Read())
                {
                    UID = myReader["User_ID"].ToString();
                    PWD = myReader["PWD"].ToString();
                }
                con.Close();


                // Send User ID in Email
                SqlCommand cmd4 = new SqlCommand();
                SqlDataReader myReader1;
                con = new SqlConnection(constr.getconstr());

                cmd4.CommandType = CommandType.StoredProcedure;
                cmd4.Connection = con;
                con.Open();

                cmd4.CommandText = "Get_Email_Details";
                cmd4.Parameters.AddWithValue("@ID", 2);

                CCEmailAddress = "";
                E_Sub = "";
                E_Body = "";
                EmailAdd = Email_ID;

                myReader1 = cmd4.ExecuteReader();
                while (myReader1.Read())
                {
                    //CCEmailAddress = myReader1["E_CC"].ToString();
                    E_Sub = myReader1["E_Sub"].ToString();
                    E_Body = myReader1["E_Body"].ToString() + " " + UID.ToString();
                }
                con.Close();

                commFun.Email_Users(EmailAdd, CCEmailAddress, E_Sub, E_Body);

                //Send PWD in Email

                SqlCommand cmd5 = new SqlCommand();
                SqlDataReader myReader2;

                cmd5.CommandType = CommandType.StoredProcedure;
                cmd5.Connection = con;
                con.Open();

                cmd5.CommandText = "Get_Email_Details";
                cmd5.Parameters.AddWithValue("@ID", 3);

                CCEmailAddress = "";
                E_Sub = "";
                E_Body = "";
                EmailAdd = Email_ID;

                myReader2 = cmd5.ExecuteReader();
                while (myReader2.Read())
                {
                    //CCEmailAddress = myReader2["E_CC"].ToString();
                    E_Sub = myReader2["E_Sub"].ToString();
                    E_Body = myReader2["E_Body"].ToString() + " " + PWD.ToString();
                }
                con.Close();

                commFun.Email_Users(EmailAdd, CCEmailAddress, E_Sub, E_Body);

                //Response.Write("<script> alert('Record Updated successfully.'); </script>");
            }
            catch (Exception ex)
            {
                lblErrorMsg.Text = "";
                lblErrorMsg.Text = ex.Message;
                throw;
            }
        }

        protected void Drp_Project_Name_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                fill_drpdwn_User_Group_ID();
                fill_drpdwn_Site_ID();

                DAL dal;
                dal = new DAL();
                DataSet ds = dal.GetSetCOUNTRYDETAILS(
                Action: "GET_COUNTRY",
                Project_Name: Drp_Project_Name.SelectedItem.Text,
                ENTEREDBY: Session["User_ID"].ToString()
                );
                drpCountry.DataSource = ds.Tables[0];
                drpCountry.DataValueField = "CNTRYID";
                drpCountry.DataTextField = "COUNTRY";
                drpCountry.DataBind();
                drpCountry.Items.Insert(0, new ListItem("--Select Country--", "0"));
            }
            catch (Exception ex)
            {
                lblErrorMsg.Text = ex.Message.ToString();
                throw;
            }
        }
        protected void Chk_Select_All_CheckedChanged(object sender, EventArgs e)
        {
            try
            {
                Int16 i;
                if (Chk_Select_All.Checked)
                {
                    for (i = 0; i < grdINV.Rows.Count; i++)
                    {
                        CheckBox ChAction;
                        ChAction = (CheckBox)grdINV.Rows[i].FindControl("Chk_Sel_Fun");
                        ChAction.Checked = true;
                    }
                }
                else
                {
                    for (i = 0; i < grdINV.Rows.Count; i++)
                    {
                        CheckBox ChAction;
                        ChAction = (CheckBox)grdINV.Rows[i].FindControl("Chk_Sel_Fun");
                        ChAction.Checked = false;
                    }
                }

            }
            catch (Exception ex)
            {
                lblErrorMsg.Text = "";
                lblErrorMsg.Text = ex.Message;
            }
        }


    }
}