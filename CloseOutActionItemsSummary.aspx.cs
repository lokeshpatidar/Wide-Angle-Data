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
    public partial class CloseOutActionItemsSummary : System.Web.UI.Page
    {
      
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {               
                if (!this.IsPostBack)
                {
                    if (Session["PROJECTID"] != null && Session["CloseOutINVID"] != null && Session["CloseOutMVID"] != null)
                    {
                        fill_Project();
                        fill_Inv();
                        fill_MV();
                        GetRecords(GrdShow);
                        btnAdd.Visible = true;
                        btnAddComments.Visible = true;
                        btnViewComments.Visible = true;
                    }
                    else
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
                if (Session["PROJECTID"] != null)
                {
                    Drp_Project.Items.FindByValue(Session["PROJECTID"].ToString()).Selected = true;
                }
            }
            catch (Exception ex)
            {
                lblErrorMsg.Text = ex.Message.ToString();
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
                Project_Name: Drp_Project.SelectedItem.Text, User_ID: Session["User_ID"].ToString()
                );
                drp_INVID.DataSource = ds.Tables[0];
                drp_INVID.DataValueField = "INVNAME";
                drp_INVID.DataBind();
                drp_INVID.Items.Insert(0, new ListItem("--Select Inv ID--", "0"));
                if (Session["CloseOutINVID"] != null)
                {
                    drp_INVID.Items.FindByValue(Session["CloseOutINVID"].ToString()).Selected = true;
                }
            }
            catch (Exception ex)
            {
                lblErrorMsg.Text = ex.Message.ToString();
            }
        }
        private void fill_MV()
        {
            try
            {
                DAL dal;
                dal = new DAL();
                DataSet ds = dal.GetSetMonitoringVisit(
                Action: "SELECT_CO",
                PROJECTID: Drp_Project.SelectedItem.Value,
                INVID: drp_INVID.SelectedValue
                );
                Drp_MVID.DataSource = ds.Tables[0];
                Drp_MVID.DataValueField = "MVID";
                Drp_MVID.DataBind();
                Drp_MVID.Items.Insert(0, new ListItem("--Select CO ID--", "0"));
                if (Session["CloseOutMVID"] != null)
                {
                    Drp_MVID.Items.FindByValue(Session["CloseOutMVID"].ToString()).Selected = true;
                }

            }
            catch (Exception ex)
            {
                lblErrorMsg.Text = ex.Message.ToString();
            }
        }     
        private void GetRecords(GridView grd)
        {
            try
            {
                DAL dal;
                dal = new DAL();

                DataSet ds = dal.GetSetProjectData(
                      Action: "CHECK_DATA_EXISTS_E_CODetails",
                      Project_ID: Drp_Project.SelectedItem.Value,
                      INVID: drp_INVID.SelectedItem.Value,
                      MVID: Drp_MVID.SelectedItem.Value,
                      SECTIONID: "5",
                      SUBSECTIONID: "5.16"
                      );

                if (ds.Tables.Count > 0)
                {
                    GrdShow.DataSource = ds;
                    GrdShow.DataBind();
                }
            }
            catch (Exception ex)
            {
                lblErrorMsg.Text = ex.Message.ToString();
                throw;
            }
        }

        protected void Drp_Project_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                fill_Inv();
            }
            catch (Exception ex)
            {
                lblErrorMsg.Text = ex.ToString();
            }
        }

        protected void drp_INVID_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                fill_MV();
            }
            catch (Exception ex)
            {
                lblErrorMsg.Text = ex.ToString();
            }
        }

        protected void Drp_MVID_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {

                Session["CloseOutINVID"] = drp_INVID.SelectedItem.Value;
                Session["CloseOutMVID"] = Drp_MVID.SelectedItem.Value;

                btnAdd.Visible = true;
                btnAddComments.Visible = true;
                btnViewComments.Visible = true;

                GetRecords(GrdShow);
            }
            catch (Exception ex)
            {
                lblErrorMsg.Text = ex.ToString();
            }
        }
    }
}