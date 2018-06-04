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
    public partial class Change_Password : System.Web.UI.Page
    {

        //SqlConnection constr;
        DAL constr = new DAL();

        protected void Page_Load(object sender, EventArgs e)
        {           
        }

        protected void Btn_Update_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(constr.getconstr());
                con.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "Update_Pwd";
                cmd.Connection = con;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@User_ID", Session ["User_ID"].ToString ());
                cmd.Parameters.AddWithValue("@Pwd", txt_New_Pwd.Text);
                cmd.Parameters.AddWithValue("@OldPwd", txt_Old_Pwd.Text);
                cmd.Parameters.AddWithValue("@EnteredBy", Session["User_ID"].ToString());

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

                if (retunvalue == "3")
                {
                    throw new Exception("Password Length must be atleaset 8 chracters");
                }
                else if (retunvalue == "2")
                {

                    throw new Exception("Password must be combination of alpha, numeric and symbolic chracters");
                }
                else if (retunvalue == "5")
                {
                    throw new Exception("This password has already been used");
                }

                else if (retunvalue == "4")
                {
                    throw new Exception("The Old Password Entered does not match with  existing password");
                }
                else if (retunvalue == "0")
                {
                    //Session["User_ID"] = null;
                    Response.Write("<script> alert('Password Updated');window.location='Auth.aspx'; </script>");
                }
                
            }
            catch (Exception ex)
            {
                lblErrorMsg.Text = "";
                lblErrorMsg.Text = ex.Message;
            }
        }

        protected void btnback_Click(object sender, EventArgs e)
        {
            Response.Redirect("Auth.aspx");
        }
    }
}