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
    public partial class Add_User_Rights : System.Web.UI.Page
    {
        DAL constr = new DAL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                fill_drpdwn();
            }      
        }

        private void fill_drpdwn()
        {

            DAL dal;
            dal = new DAL();
            DataSet ds = dal.GetSetPROJECTDETAILS(
            Action: "Get_Specific_Project",
            Project_ID: Convert.ToInt32(Session["PROJECTID"]),
            ENTEREDBY: Session["User_ID"].ToString()
            );
            Drp_Project.DataSource = ds;
            Drp_Project.DataValueField = "PROJNAME";
            Drp_Project.DataBind();


            Drp_Project.Items.Insert(0, new ListItem("--Select Project--", "0"));
            Drp_User_Group.Items.Insert(0, new ListItem("--Select User Group--", "0"));
            Drp_User.Items.Insert(0, new ListItem("--Select User--", "0"));
        }
        private void fill_drpdwn_User_Group_ID()
        {
            try
            {
                SqlConnection con = new SqlConnection(constr.getconstr());
                SqlCommand cmd = new SqlCommand("Get_User_Group_ID", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Project_Name", Drp_Project.SelectedValue);                
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
        private void fill_drpdwn_User_ID()
        {
            try
            {

                SqlConnection con = new SqlConnection(constr.getconstr());
                SqlCommand cmd = new SqlCommand("Get_User_ID", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Project_Name", Drp_Project.SelectedValue);
                cmd.Parameters.AddWithValue("@UserGroup_Name", Drp_User_Group.SelectedValue);
                
                SqlDataAdapter ad = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                ad.Fill(ds);
                Drp_User.DataSource = ds.Tables[0];
                Drp_User.DataValueField = "User_Name";
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
        protected void Btn_Add_Fun_Click(object sender, EventArgs e)
        {
            try
            {
                Int16 i;

                SqlConnection con = new SqlConnection(constr.getconstr());

                for (i = 0; i < GridView1.Rows.Count; i++)
                {

                    SqlCommand cmd = new SqlCommand("Add_Up_Del_User_Fun", con);
                    cmd.CommandType = CommandType.StoredProcedure;

                    CheckBox ChAction;
                    ChAction = (CheckBox)GridView1.Rows[i].FindControl("Chk_Sel_Fun");

                    if (ChAction.Checked)
                    {
                        TextBox Fn_ID;
                        Fn_ID = (TextBox)GridView1.Rows[i].FindControl("txt_Fun_ID");

                        TextBox Parent;
                        Parent = (TextBox)GridView1.Rows[i].FindControl("txt_Parent");

                        TextBox Fn_Name;
                        Fn_Name = (TextBox)GridView1.Rows[i].FindControl("txt_Fun_Name");

                        cmd.Parameters.AddWithValue("@Action", "Insert");

                        cmd.Parameters.AddWithValue("@Project_Name", Drp_Project.SelectedValue);

                        cmd.Parameters.AddWithValue("@UserGroup_Name", Drp_User_Group.SelectedValue);

                        cmd.Parameters.AddWithValue("@User_Name", Drp_User.SelectedValue);

                        cmd.Parameters.AddWithValue("@FunctionID", Convert.ToInt32(Fn_ID.Text));

                        cmd.Parameters.AddWithValue("@EnteredBy", Session["User_ID"].ToString());

                        cmd.Parameters.AddWithValue("@Parent", Parent.Text);                        

                        con.Open();
                        cmd.ExecuteNonQuery();

                        con.Close();                        
                    }

                }
                Response.Write("<script> alert('Record Updated successfully.');window.location='Add_User_Rights.aspx'; </script>");
            }
            catch (Exception ex)
            {
                lblErrorMsg.Text = "";
                lblErrorMsg.Text = ex.Message;
            }
        }
        protected void btn_Get_Doc_List_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(constr.getconstr());
                SqlCommand cmd = new SqlCommand("Get_User_Functions", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Project_Name", Drp_Project.SelectedValue);
                cmd.Parameters.AddWithValue("@User_Name", Drp_User.SelectedValue);
                SqlDataAdapter ad = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                ad.Fill(ds);
                GridView1.DataSource = ds.Tables[0];
                GridView1.DataBind();

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
    }
}