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
    public partial class Edit_User_Details : System.Web.UI.Page
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
            Drp_Project_Name.DataTextField = "PROJNAME";
            Drp_Project_Name.DataValueField = "Project_ID";
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
                cmd.Parameters.AddWithValue("@Action", "INVID_SPECIFIC_USERID");
                cmd.Parameters.AddWithValue("@Project_Name", Drp_Project_Name.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@User_ID", Drp_User.SelectedValue);
                SqlDataAdapter ad = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                ad.Fill(ds);
                grdINV1.DataSource = ds;
                grdINV1.DataBind();
            }

            catch (Exception ex)
            {
                lblErrorMsg.Text = "";
                lblErrorMsg.Text = ex.Message;
                throw;
            }
        }

        private void fill_drpdwn_User_Group_ID()
        {
            try
            {
                SqlConnection con = new SqlConnection(constr.getconstr());
                SqlCommand cmd = new SqlCommand("Get_User_Group_ID", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Project_Name", Drp_Project_Name.SelectedItem.Text);
                SqlDataAdapter ad = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                ad.Fill(ds);
                Drp_User_Group.DataSource = ds.Tables[0];
                Drp_User_Group.DataValueField = "UserGroup_Name";
                Drp_User_Group.DataBind();
                Drp_User_Group.Items.Insert(0, new ListItem("--Select User Group--", "0"));

                Drp_User_Group1.DataSource = ds.Tables[0];
                Drp_User_Group1.DataValueField = "UserGroup_Name";
                Drp_User_Group1.DataBind();
                Drp_User_Group1.Items.Insert(0, new ListItem("--Select User Group--", "0"));

                con.Close();
                lblErrorMsg.Text = "";
            }

            catch (Exception ex)
            {
                lblErrorMsg.Text = "";
                lblErrorMsg.Text = ex.Message;
            }
        }

        private void fill_drpdwn_User_ID()
        {
            try
            {
                lblErrorMsg.Text = "";

                SqlConnection con = new SqlConnection(constr.getconstr());
                SqlCommand cmd = new SqlCommand("Get_User_ID", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Project_Name", Drp_Project_Name.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@UserGroup_Name", Drp_User_Group.SelectedValue);
                SqlDataAdapter ad = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                ad.Fill(ds);
                Drp_User.DataSource = ds.Tables[0];
                Drp_User.DataTextField = "User_Name";
                Drp_User.DataValueField = "User_ID";
                Drp_User.DataBind();
                con.Close();
                Drp_User.Items.Insert(0, new ListItem("--Select User--", "0"));
            }

            catch (Exception ex)
            {
                lblErrorMsg.Text = "";
                lblErrorMsg.Text = ex.Message;
            }
        }


   
        protected void Drp_User_Group_SelectedIndexChanged(object sender, EventArgs e)
        {
            fill_drpdwn_User_ID();            
        }

        protected void Drp_User_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
             
                lblErrorMsg.Text = "";

                if (Drp_User.SelectedValue != "0")
                {

                    SqlConnection con = new SqlConnection(constr.getconstr());
                    SqlCommand cmd = new SqlCommand("Get_User_Details");
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Connection = con;
                    con.Open();
                    cmd.Parameters.AddWithValue("@User_Name", Drp_User.SelectedItem.Text);

       
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        sdr.Read();
                        txt_User_Name.Text = sdr["User_Name"].ToString();
                        txt_User_Dis_Name.Text = sdr["User_Dis_Name"].ToString();
                        txt_EmailID.Text = sdr["Email_ID"].ToString();
                        Drp_User_Group1.SelectedValue = sdr["UserGroup_Name"].ToString();                  
                    }
                    fill_drpdwn_Site_ID();
                    
                    con.Close();
                }
            }
            catch (Exception ex)
            {
                lblErrorMsg.Text = "";
                lblErrorMsg.Text = ex.Message;
            }
        }

        protected void Btn_Update_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(constr.getconstr());
                SqlCommand cmd = new SqlCommand("Update_User_Details");
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = con;
                con.Open();
                cmd.Parameters.AddWithValue("@Action", "Update");
                cmd.Parameters.AddWithValue("@User_Name", txt_User_Name.Text);
                cmd.Parameters.AddWithValue("@User_Dis_Name", txt_User_Dis_Name.Text);
                cmd.Parameters.AddWithValue("@Email_ID", txt_EmailID.Text);
                cmd.Parameters.AddWithValue("@UserGroup_Name", Drp_User_Group1.SelectedValue);
               // cmd.Parameters.AddWithValue("@Site_Id",Drp_Site_ID.SelectedValue);
                cmd.ExecuteNonQuery();
                con.Close();

             
                string UserID = Drp_User.SelectedValue;

                DataSet ds = constr.AddUserProfile(Action: "DELETE_INV", USERID: UserID);
                Int16 i;
                for (i = 0; i < grdINV1.Rows.Count; i++)
                {
                    CheckBox ChAction;
                    ChAction = (CheckBox)grdINV1.Rows[i].FindControl("Chk_Sel_Fun");
                    if (ChAction.Checked)
                    {
                        TextBox T_INVID;
                        TextBox INVNAME;
                        T_INVID = (TextBox)grdINV1.Rows[i].FindControl("txt_INVID");
                        INVNAME = (TextBox)grdINV1.Rows[i].FindControl("txt_INVNAME");

                        ds = constr.AddUserProfile(Action: "INSERT_UPDATE_INV", USERID: UserID, Site_ID: T_INVID.Text, INVNAME: INVNAME.Text);
                    }
                }          

                Response.Write("<script> alert('Record Updated successfully.');window.location='Edit_User_Details.aspx'; </script>");
            }
            catch (Exception ex)
            {
                lblErrorMsg.Text = "";
                lblErrorMsg.Text = ex.Message;
            }
        }

        protected void Drp_Project_Name_SelectedIndexChanged(object sender, EventArgs e)
        {
            fill_drpdwn_User_Group_ID();
          
        }

        protected void Chk_Select_All_CheckedChanged(object sender, EventArgs e)
        {
            try
            {
                Int16 i;
                if (Chk_Select_All.Checked)
                {
                    for (i = 0; i < grdINV1.Rows.Count; i++)
                    {
                        CheckBox ChAction;
                        ChAction = (CheckBox)grdINV1.Rows[i].FindControl("Chk_Sel_Fun");
                        ChAction.Checked = true;
                    }
                }
                else
                {
                    for (i = 0; i < grdINV1.Rows.Count; i++)
                    {
                        CheckBox ChAction;
                        ChAction = (CheckBox)grdINV1.Rows[i].FindControl("Chk_Sel_Fun");
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

        protected void grdINV1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DataRowView dr = e.Row.DataItem as DataRowView;
                string Present = dr["Present"].ToString();
                if (Present != "0")
                {
                    CheckBox btnEdit = (CheckBox)e.Row.FindControl("Chk_Sel_Fun");
                    btnEdit.Checked = true;                
                }
            }
        }

       

   
    
    }
}