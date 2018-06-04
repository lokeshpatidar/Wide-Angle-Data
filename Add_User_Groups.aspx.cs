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
    public partial class Add_User_Groups : System.Web.UI.Page
    {
        DAL constr = new DAL();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

                if (Session["User_ID"] == null)
                {
                    Response.Redirect("SessionExpired.aspx");
                }
                if (!this.IsPostBack)
                {
                    fill_drpdwn();
                }
            }
            catch (Exception ex)
            {
                lblErrorMsg.Text = ex.Message.ToString();
             
            }
            
        }
        private void fill_drpdwn()
        {
            try
            {
                DAL dal;
                dal = new DAL();
                DataSet ds = dal.GetSetPROJECTDETAILS(
                Action: "Get_Specific_Project",
                Project_ID: Convert.ToInt32(Session["PROJECTID"]),
                ENTEREDBY: Session["User_ID"].ToString()
                );
                Drp_Project.DataSource = ds.Tables[0];
                Drp_Project.DataValueField = "Project_ID";
                Drp_Project.DataTextField = "PROJNAME";
                Drp_Project.DataBind();
                Drp_Project.Items.Insert(0, new ListItem("--Select Project--", "0"));
            }
            catch (Exception ex)
            {
                lblErrorMsg.Text = ex.Message.ToString();
                throw;
            }
            
            //using (SqlConnection con = new SqlConnection(constr.getconstr ()))
            //{
            //    using (SqlCommand cmd = new SqlCommand("SELECT PROJNAME FROM PROJDETAILS"))
            //    {
            //        cmd.CommandType = CommandType.Text;
            //        cmd.Connection = con;
            //        con.Open();
            //        Drp_Project_Name.DataSource = cmd.ExecuteReader();
            //        Drp_Project_Name.DataValueField = "PROJNAME";
            //        Drp_Project_Name.DataBind();
            //        con.Close();
            //    }
            //}
            //Drp_Project_Name.Items.Insert(0, new ListItem("--Select Project--", "0"));           
        }
        protected void Add_User_Group_Click(object sender, EventArgs e)
        {
            try
            {               
                SqlConnection con = new SqlConnection(constr.getconstr());
                con.Open();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "Add_Upd_UserGroups";
                cmd.Connection = con;

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Action", "Insert");
                cmd.Parameters.AddWithValue("@Project_Name", Drp_Project.SelectedItem.Text);                
                cmd.Parameters.AddWithValue("@UserGroup_Name", txt_User_Group.Text);
                cmd.Parameters.AddWithValue("@CNTRYID", droCountry.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@EnteredBy", Session["User_ID"].ToString());

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script> alert('Record Deleted successfully.');window.location='Add_User_Groups.aspx'; </script>");
      
              //    Response.Redirect(Request.RawUrl);
            }
            catch (Exception ex)
            {
                lblErrorMsg.Text = ex.Message.ToString();
                //throw;
            }


        }

        protected void Drp_Project_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                DAL dal;
                dal = new DAL();
                DataSet ds = dal.GetSetCOUNTRYDETAILS(
                Action: "GET_COUNTRY",
                Project_Name: Drp_Project.SelectedItem.Text,
                ENTEREDBY: Session["User_ID"].ToString()
                );
                droCountry.DataSource = ds.Tables[0];
                droCountry.DataValueField = "CNTRYID";
                droCountry.DataTextField = "COUNTRY";
                droCountry.DataBind();
                droCountry.Items.Insert(0, new ListItem("--Select Country--", "0"));
            }
            catch (Exception ex)
            {
                lblErrorMsg.Text = ex.Message.ToString();
                throw;
            }
        }
    }
}