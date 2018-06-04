using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using PPT;

namespace CTMS
{
    public partial class CloseOutActionItem_Data : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            hdnRECID.Value = Request.QueryString["RECID"];
            hdnACTION.Value = Request.QueryString["ACTION"];

            GetStructure(DSVISDAT);
            if (hdnACTION.Value == "UPDATE")//at the time of insert recid required otherwise update on basis of selected record
            {
                GetRecords(DSVISDAT);
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
                ds = dal.GetSetMaster(Action: "GET_DATA", MODULENAME: "5", SUBMODULENAME: "5.16");
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
                      Project_ID: Session["PROJECTID"].ToString(),
                      INVID: Session["CloseOutINVID"].ToString(),
                      MVID: Session["CloseOutMVID"].ToString(),
                      SECTIONID: "5",
                      SUBSECTIONID: "5.16",
                      RECID: hdnRECID.Value
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
        protected void bntSaveComplete_Click(object sender, EventArgs e)
        {
            try
            {
                InsertUpdatedata(DSVISDAT);
                Response.Write("<script> alert('Record Updated successfully.'); </script>");
                this.ClientScript.RegisterClientScriptBlock(this.GetType(), "Close", "window.close()", true);
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


                DAL dal;
                dal = new DAL();
                if (hdnACTION.Value == "INSERT")//at the time of insert recid required otherwise update on basis of selected record
                {
                    DataSet ds = dal.GetSetProjectData(
                     Action: "MAX_REC_ID_E_CODetails",
                        Project_ID: Session["PROJECTID"].ToString(),
                      INVID: Session["CloseOutINVID"].ToString(),
                      MVID: Session["CloseOutMVID"].ToString(),
                         SECTIONID: "5",
                      SUBSECTIONID: "5.16"
                     );
                    hdnRECID.Value = ds.Tables[0].Rows[0]["RECID"].ToString();
                }

                for (rownum = 0; rownum < grd.Rows.Count; rownum++)
                {
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
                      Project_ID: Session["PROJECTID"].ToString(),
                      INVID: Session["CloseOutINVID"].ToString(),
                      MVID: Session["CloseOutMVID"].ToString(),
                    RECID: hdnRECID.Value,
                    ContID: rownum,
                    SECTIONID: "5",
                    SUBSECTIONID: "5.16",

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
                        ds = dal.GetDropDownData(Action: "2", VariableName: VARIABLENAME);
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
    }
}