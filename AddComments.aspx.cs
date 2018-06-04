using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PPT;
using System.Data;

namespace CTMS
{
    public partial class AddComments : System.Web.UI.Page
    {
         DAL  dal = new DAL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User_ID"] == null)
            {
                Response.Redirect("SessionExpired.aspx");
            }
            try
            {
                if (!IsPostBack)
                {
                    txtSection.Text = Request.QueryString["Section"];
                    txtProjectId.Text = Request.QueryString["ProjectId"];
                    txtInvID.Text = Request.QueryString["INVID"];
                    txtMVID.Text = Request.QueryString["MVID"];
                    hdnSectionId.Value = Request.QueryString["SectionID"];
                    hdnSubSectionId.Value = Request.QueryString["SubSectionID"];
                }
            }
            catch (Exception ex)
            {
                lblErrorMsg.Text = ex.Message.ToString();             
            }
        }

        protected void bntSave_Click(object sender, EventArgs e)
        {
            try
            {
                string strdata = txtComments.Text;
                if (strdata == "")
                {                                    
                        throw new Exception("Please insert Comment");                 
                }
                string  Issue = "False";
                string  Observation = "False";
                string  Internal = "False";
                string  Followup = "False";
                string Report = "False";

                 if(chk_Issue.Checked)
                 {
                     Issue = "True";
                 }
                  if(chk_Observation.Checked)
                 {
                     Observation = "True";
                 }
                  if(chk_Internal.Checked)
                 {
                     Internal = "True";
                 }
                  if(chk_FollowUp.Checked)
                 {
                     Followup = "True";
                 }
                  if (chkReport.Checked)
                  {
                      Report = "True";
                  }  
                  dal.GetSetChecklistComments(
                    Action: "INSERT_Comments",
                    PROJECTID: txtProjectId.Text,
                    INVID: txtInvID.Text,
                    ChecklistID: txtMVID.Text,                
                    SECTIONID: hdnSectionId.Value,
                    SUBSECTIONID:hdnSubSectionId.Value,
                    Comments:txtComments.Text,             
                    Issue:Issue,
                    Observation:Observation,
                    Internal:Internal,
                    Followup:Followup,  
                    Report:Report,            
                    ENTEREDBY: Session["USER_ID"].ToString()
                    );
                  if (chk_Issue.Checked)
                  {
                      DataSet ds = new DataSet();
                      ds=dal.getsetISSUES(
                      Action: "GET_Source",
                      SectionID:hdnSectionId.Value
                        );
                      string Source = ds.Tables[0].Rows[0]["MODULENAME"].ToString();

                      dal.getsetISSUES(
                      Action: "INSERT",
                      Project_ID: txtProjectId.Text,
                      INVID: txtInvID.Text,
                      MVID: txtMVID.Text,
                      Summary: txtComments.Text,
                      Department: "Operations",
                      Source: Source,
                      Refrence: txtMVID.Text,
                      SectionID: hdnSectionId.Value,
                      SubSectionID: hdnSubSectionId.Value,
                      Status: "New",
                      Priority: "Trivial",
                      ISSUEBy:Session["USER_ID"].ToString(),
                      ENTEREDBY:Session["USER_ID"].ToString()
                      );

                  }
              //  ScriptManager.RegisterStartupScript(this, GetType(), "preffixAllow", "jAlert('Action Compeleted Successfully');", true);
                Response.Write("<script> alert('Record Updated successfully.')</script>");
               this.ClientScript.RegisterClientScriptBlock(this.GetType(), "Close", "window.close()", true);
             
            }
            catch (Exception ex)
            {
                lblErrorMsg.Text = ex.Message.ToString();

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                this.ClientScript.RegisterClientScriptBlock(this.GetType(), "Close", "window.close()", true);
            }
            catch(Exception ex)
            {
                lblErrorMsg.Text = ex.ToString();
            }

        }
    }
}