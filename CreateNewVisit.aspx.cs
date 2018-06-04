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
    public partial class CreateNewVisit : System.Web.UI.Page
    {
        DAL constr = new DAL();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!this.IsPostBack)
                {
                    if (Session["PROJECTID"] != null)
                    {
                        Drp_Project.Items.Add(new ListItem(Session["PROJECTIDTEXT"].ToString(), Session["PROJECTID"].ToString()));
                        fill_Inv();
                    }
                    else
                    {
                        fill_Project();
                    }
                }
            }
            catch (Exception ex)
            {
                lblErrorMsg.Text = ex.ToString();
            } 
        }
        private void fill_Project()
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
        }
        private void fill_Inv()
        {
            try
            {
                DAL dal;
                dal = new DAL();
                DataSet ds = dal.GetSiteID(
                Action: "INVID",
                Project_Name: Drp_Project.SelectedItem.Text
                , User_ID: Session["User_ID"].ToString()
                );
                drp_InvID.DataSource = ds.Tables[0];
                drp_InvID.DataValueField = "INVNAME";
                drp_InvID.DataBind();
                drp_InvID.Items.Insert(0, new ListItem("--Select Inv ID--", "0"));
            }
            catch (Exception ex)
            {
                lblErrorMsg.Text = ex.Message.ToString();
                throw;
            }
        }     
        protected void Btn_Save_Click(object sender, EventArgs e)
        {
            try
            {                               
                    DAL dal;
                    dal = new DAL();
                    dal.GetSetMonitoringVisit(
                    Action: "INSERT_MV",
                    PROJECTID: Drp_Project.SelectedItem.Value,
                    INVID: drp_InvID.SelectedValue,
                    VISITTYPE:drpVisitType.SelectedItem.Value,
                    MVID:txtVisitId.Text.Trim(),
                    CRA: txtCRA.Text.Trim(),
                    VSTDAT: txtStartdate.Text.Trim(),
                    VEDAT: txtEnddate.Text.Trim(),                               
                    ENTEREDBY: Session["User_ID"].ToString()
                    );
                    Response.Write("<script> alert('Record Updated successfully.');window.location='CreateNewVisit.aspx'; </script>");
               
            }
            catch (Exception ex)
            {
                lblErrorMsg.Text = ex.Message.ToString();
            }
        }

        protected void Drp_Project_Name_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                fill_Inv();
            }
            catch(Exception ex)
            {
                lblErrorMsg.Text=ex.ToString();
            }
        }

        protected void drpVisitType_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (drpVisitType.SelectedItem.Value == "SiteQualification")
                {
                    txtVisitId.Text = "SQID-";
                }
                if (drpVisitType.SelectedItem.Value == "SiteInitiation")
                {
                    txtVisitId.Text = "SIID-";
                }
                if (drpVisitType.SelectedItem.Value == "MonitoringVisit")
                {
                    txtVisitId.Text = "MVID-";
                }
                if (drpVisitType.SelectedItem.Value == "CloseOutVisit")
                {
                    txtVisitId.Text = "COID-";
                }
            }
            catch (Exception ex)
            {
                lblErrorMsg.Text = ex.ToString();
            }
        }
    }
}