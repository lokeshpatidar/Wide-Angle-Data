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
    public partial class CloseOutRT : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                GetStructure(DSVISDAT);
                if (!this.IsPostBack)
                {
                    if (Session["PROJECTID"] != null && Session["CloseOutINVID"] != null && Session["CloseOutMVID"] != null)
                    {
                        fill_Project();
                        fill_Inv();
                        fill_MV();
                        GetRecords(DSVISDAT);
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

        private void GetStructure(GridView grd)
        {
            try
            {
                DAL dal;
                dal = new DAL();
                DataSet ds;
                ds = new DataSet();
                ds = dal.GetSetMaster(Action: "GET_DATA", MODULENAME: "5", SUBMODULENAME: "5.2");
                grd.DataSource = ds;
                grd.DataBind();
            }
            catch (Exception ex)
            {
                lblErrorMsg.Text = ex.Message.ToString();
                throw;
            }
        }
        private void GetRecords(GridView grd)
        {
            try
            {
                string strcmd, COLNAME, COLVAL, TABLENAME;
                int rownum = 0;
                strcmd = "";
                TABLENAME = grd.ID;

                DAL dal;
                dal = new DAL();

                DataSet ds = dal.GetSetProjectData(
                      Action: "GET_DATA_E_CODetails",
                      Project_ID: Drp_Project.SelectedItem.Value,
                      INVID: drp_INVID.SelectedItem.Value,
                      MVID: Drp_MVID.SelectedItem.Value,
                      SECTIONID: "5",
                      SUBSECTIONID: "5.2"
                      );

                if (ds.Tables[0].Rows.Count > 0)
                {
                    for (rownum = 0; rownum < grd.Rows.Count; rownum++)
                    {
                        COLNAME = ((Label)grd.Rows[rownum].FindControl("lblVARIABLENAME")).Text;
                        string CONTROLTYPE;
                        CONTROLTYPE = ((Label)grd.Rows[rownum].FindControl("lblCONTROLTYPE")).Text;
                        if (CONTROLTYPE == "TEXTBOX")
                        {
                            COLVAL = ds.Tables[0].Rows[rownum]["DATA"].ToString();
                            ((TextBox)grd.Rows[rownum].FindControl(((Label)grd.Rows[rownum].FindControl("lblVARIABLENAME")).Text)).Text = COLVAL;
                        }
                        else if (CONTROLTYPE == "DROPDOWN")
                        {
                            COLVAL = ds.Tables[0].Rows[rownum]["DATA"].ToString();
                            ((DropDownList)grd.Rows[rownum].FindControl(((Label)grd.Rows[rownum].FindControl("lblVARIABLENAME")).Text)).SelectedValue = COLVAL;
                        }
                        else if (CONTROLTYPE == "CHECKBOX")
                        {
                            COLVAL = ds.Tables[0].Rows[rownum]["DATA"].ToString();
                            if (COLVAL == "True")
                            {
                                ((CheckBox)grd.Rows[rownum].FindControl(((Label)grd.Rows[rownum].FindControl("lblVARIABLENAME")).Text)).Checked = true;
                            }
                            else
                            {
                                ((CheckBox)grd.Rows[rownum].FindControl(((Label)grd.Rows[rownum].FindControl("lblVARIABLENAME")).Text)).Checked = false;
                            }

                        }
                        ((TextBox)grd.Rows[rownum].FindControl("ContID")).Text = rownum.ToString();
                    }
                }
                else
                {
                    GetStructure(DSVISDAT);
                }
            }
            catch (Exception ex)
            {
                lblErrorMsg.Text = ex.Message.ToString();
                throw;
            }
        }
        protected void DSVISDAT_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    DataRowView dr = e.Row.DataItem as DataRowView;

                    string CONTROLTYPE = dr["CONTROLTYPE"].ToString();
                    string VARIABLENAME = dr["VARIABLENAME"].ToString();
                    string FIELDNAME = dr["FIELDNAME"].ToString();
                    string CLASS = dr["CLASS"].ToString();

                    string MAXLEN = dr["MAXLEN"].ToString();
                    string DEFULTVAL = dr["DEFULTVAL"].ToString();
                    string BOLDYN = dr["BOLDYN"].ToString();
                    string UNLNYN = dr["UNLNYN"].ToString();
                    string READYN = dr["READYN"].ToString();
                    string MULTILINEYN = dr["MULTILINEYN"].ToString();

                    if (BOLDYN == "True")
                    {
                        Label lblField = (Label)e.Row.FindControl("lblFieldName");
                        lblField.Attributes.Add("class", "fontbold");
                    }
                    if (UNLNYN == "True")
                    {
                        Label lblField = (Label)e.Row.FindControl("lblFieldName");
                        lblField.Font.Underline = true;
                    }
                    if (CONTROLTYPE == "TEXTBOX")
                    {
                        TextBox btnEdit = (TextBox)e.Row.FindControl("TXT_FIELD");
                        btnEdit.Visible = true;
                        btnEdit.ID = VARIABLENAME;
                        btnEdit.CssClass = CLASS;
                        btnEdit.ToolTip = FIELDNAME;

                        if (MAXLEN != "")
                        {
                            btnEdit.MaxLength = Convert.ToInt32(MAXLEN);
                        }
                        if (READYN == "True")
                        {
                            btnEdit.ReadOnly = true;
                        }
                        if (DEFULTVAL != "")
                        {
                            btnEdit.Text = DEFULTVAL;
                        }
                        if (CLASS == "txtTime")
                        {
                            btnEdit.Attributes.Add("onchange", "ValidTime(this)");
                        }
                        if (MULTILINEYN == "True")
                        {
                            btnEdit.TextMode = TextBoxMode.MultiLine;
                        }
                    }
                    if (CONTROLTYPE == "DROPDOWN")
                    {
                        DropDownList btnEdit = (DropDownList)e.Row.FindControl("DRP_FIELD");
                        btnEdit.Visible = true;
                        btnEdit.ID = VARIABLENAME;
                        btnEdit.CssClass = CLASS;
                        btnEdit.ToolTip = FIELDNAME;

                        DAL dal;
                        dal = new DAL();
                        DataSet ds;
                        ds = new DataSet();
                        ds = dal.GetDropDownData(Action: "1", VariableName: VARIABLENAME);
                        btnEdit.DataSource = ds;
                        btnEdit.DataTextField = "TEXT";
                        btnEdit.DataValueField = "VALUE";

                        btnEdit.DataBind();
                    }
                    if (CONTROLTYPE == "CHECKBOX")
                    {
                        CheckBox btnEdit = (CheckBox)e.Row.FindControl("CHK_FIELD");
                        btnEdit.Visible = true;
                        btnEdit.ID = VARIABLENAME;
                        btnEdit.CssClass = CLASS;
                        btnEdit.ToolTip = FIELDNAME;
                    }
                }
            }
            catch (Exception ex)
            {
                lblErrorMsg.Text = ex.Message.ToString();
                throw;
            }

        }
        protected void bntSaveComplete_Click(object sender, EventArgs e)
        {
            try
            {


                InsertUpdatedata(DSVISDAT);
                Response.Write("<script> alert('Record Updated successfully.');window.location='CloseOutRT.aspx'; </script>");
            }
            catch (Exception ex)
            {
                lblErrorMsg.Text = ex.Message.ToString();
            }
        }
        protected void InsertUpdatedata(GridView grd)
        {
            try
            {
                int rownum = 0;
                string strdata = "";
                string varname;



                for (rownum = 0; rownum < grd.Rows.Count; rownum++)
                {
                    DAL dal;
                    dal = new DAL();
                    varname = ((Label)grd.Rows[rownum].FindControl("lblVARIABLENAME")).Text;
                    string CONTROLTYPE;
                    CONTROLTYPE = ((Label)grd.Rows[rownum].FindControl("lblCONTROLTYPE")).Text;

                    if (CONTROLTYPE == "TEXTBOX")
                    {
                        strdata = ((TextBox)grd.Rows[rownum].FindControl(varname)).Text.Trim();
                    }
                    else if (CONTROLTYPE == "DROPDOWN")
                    {
                        strdata = ((DropDownList)grd.Rows[rownum].FindControl(varname)).SelectedValue.Trim();
                    }
                    else if (CONTROLTYPE == "CHECKBOX")
                    {
                        strdata = ((CheckBox)grd.Rows[rownum].FindControl(varname)).Checked.ToString();
                    }
                    dal.GetSetProjectData(
                    Action: "INSERT_E_CODetails",
                    Project_ID: Drp_Project.SelectedItem.Value,
                    INVID: drp_INVID.SelectedItem.Value,
                    MVID: Drp_MVID.SelectedItem.Value.Trim(),
                    RECID: "0",
                    ContID: rownum,
                    SECTIONID: "5",
                    SUBSECTIONID: "5.2",

                    VARIABLENAME: ((Label)grd.Rows[rownum].FindControl("lblVARIABLENAME")).Text,
                    CONTROLTYPE: ((Label)grd.Rows[rownum].FindControl("lblCONTROLTYPE")).Text,
                    FIELDNAME: ((Label)grd.Rows[rownum].FindControl("lblFieldName")).Text,
                    TABLENAME: ((Label)grd.Rows[rownum].FindControl("lblTABLENAME")).Text,
                    DATATYPE: ((Label)grd.Rows[rownum].FindControl("lblDATATYPE")).Text,
                    DATA: strdata,
                    ENTEREDBY: Session["USER_ID"].ToString()
                    );
                }
            }
            catch (Exception ex)
            {
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
                GetRecords(DSVISDAT);
               
                    btnAddComments.Visible = true;
                    btnViewComments.Visible = true;
                    Session["CloseOutINVID"] = drp_INVID.SelectedItem.Value;
                    Session["CloseOutMVID"] = Drp_MVID.SelectedItem.Value;


               
            }
            catch (Exception ex)
            {
                lblErrorMsg.Text = ex.ToString();
            }
        }
    }
}