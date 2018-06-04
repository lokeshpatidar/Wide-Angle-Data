using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PPT;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI.HtmlControls;

namespace CTMS
{
    public partial class CTMSDashboard : System.Web.UI.Page
    {
        DAL dal = new DAL();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                graphStudy();
                dashboarddetail();
                screenrandomised();
                graphExposureNSCLC();
                graphExposuremCRC();
                graphStatusNSCLC();
                pdminmoj();
                graphSiteWisemCRC();
                pdbycat();
                doublebar();
                riskdata();
            }
            catch (Exception ex)
            {
                lblErrorMsg.Text = ex.Message.ToString();
            }
        }

        public void riskdata()
        {
            try
            {
                DataSet ds = new DataSet();
                DataTable dt = new DataTable();

                ds = dal.getdatamatrix(ProjectID: Session["PROJECTID"].ToString());
                dt = ds.Tables[0];
                if (dt.Rows.Count > 0)
                {
                    Label1.Text = dt.Rows[0][dt.Columns[1].ToString()].ToString();
                    Label6.Text = dt.Rows[1][dt.Columns[1].ToString()].ToString();
                    Label11.Text = dt.Rows[2][dt.Columns[1].ToString()].ToString();
                    Label16.Text = dt.Rows[3][dt.Columns[1].ToString()].ToString();
                    Label21.Text = dt.Rows[4][dt.Columns[1].ToString()].ToString();
                    Label2.Text = dt.Rows[0][dt.Columns[2].ToString()].ToString();
                    Label7.Text = dt.Rows[1][dt.Columns[2].ToString()].ToString();
                    Label12.Text = dt.Rows[2][dt.Columns[2].ToString()].ToString();
                    Label17.Text = dt.Rows[3][dt.Columns[2].ToString()].ToString();
                    Label22.Text = dt.Rows[4][dt.Columns[2].ToString()].ToString();
                    Label3.Text = dt.Rows[0][dt.Columns[3].ToString()].ToString();
                    Label8.Text = dt.Rows[1][dt.Columns[3].ToString()].ToString();
                    Label13.Text = dt.Rows[2][dt.Columns[3].ToString()].ToString();
                    Label18.Text = dt.Rows[3][dt.Columns[3].ToString()].ToString();
                    Label23.Text = dt.Rows[4][dt.Columns[3].ToString()].ToString();
                    Label4.Text = dt.Rows[0][dt.Columns[4].ToString()].ToString();
                    Label9.Text = dt.Rows[1][dt.Columns[4].ToString()].ToString();
                    Label14.Text = dt.Rows[2][dt.Columns[4].ToString()].ToString();
                    Label19.Text = dt.Rows[3][dt.Columns[4].ToString()].ToString();
                    Label24.Text = dt.Rows[4][dt.Columns[4].ToString()].ToString();
                    Label5.Text = dt.Rows[0][dt.Columns[5].ToString()].ToString();
                    Label10.Text = dt.Rows[1][dt.Columns[5].ToString()].ToString();
                    Label15.Text = dt.Rows[2][dt.Columns[5].ToString()].ToString();
                    Label20.Text = dt.Rows[3][dt.Columns[5].ToString()].ToString();
                    Label25.Text = dt.Rows[4][dt.Columns[5].ToString()].ToString();
                }
            }
            catch (Exception ex)
            {
                //lblErrorMsg.Text = ex.ToString();
                throw;
            }
        }

        public void doublebar()
        {
            try
            {
                DataSet ds = new DataSet();
                DataTable dt = new DataTable();
                string doublebar = "";

                ds = dal.getscreenfailure(Project_ID: Session["PROJECTID"].ToString());
                dt = ds.Tables[0];
                //grvdouble.DataSource = dt;
                //grvdouble.DataBind();
                //doublebar += "['" + dt.Columns[0].ToString() + "','" + dt.Columns[1].ToString() + "','" + dt.Columns[2].ToString() + "'],";

                //for(int i = 0; i < dt.Rows.Count; i++)
                //{
                //    doublebar += "['" + dt.Rows[i][dt.Columns[0].ToString()].ToString() + "','" + dt.Rows[i][dt.Columns[1].ToString()].ToString() + "','" + dt.Rows[i][dt.Columns[2].ToString()].ToString() + "'],";
                //}
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    doublebar += "{'VistDate': '" + dt.Rows[i][dt.Columns[1].ToString()].ToString() + "', 'Screened': '" + dt.Rows[i][dt.Columns[0].ToString()].ToString() + "', 'ScreenFailure': '" + dt.Rows[i][dt.Columns[2].ToString()].ToString() + "'},";
                }

                hfdouble.Value = "[" + doublebar.TrimEnd(',') + "]";
            }
            catch (Exception ex)
            {
                //lblErrorMsg.Text = ex.ToString();
                throw;
            }

        }
        public void pdbycat()
        {
            try
            {
                DataSet ds = new DataSet();
                DataTable dt = new DataTable();
                string barinfo = "";
                string[] col = { "#3c8dbc", "#FFFF00", "#A52A2A", "#008000", "#FF6347" };

                ds = dal.getpd(Action: "PDCAT", Project_ID: Session["PROJECTID"].ToString(), INVID: null);
                dt = ds.Tables[0];

                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    barinfo += "{'PDCatagory': '" + dt.Rows[i][dt.Columns[1].ToString()].ToString() + "', 'CNTPDCAT': " + dt.Rows[i][dt.Columns[2].ToString()].ToString() + "},";
                }

                hfcat1chart.Value = "[" + barinfo.TrimEnd(',') + "]";
                hfcat1.Value = "[" + barinfo.TrimEnd(',') + "]";
            }
            catch (Exception ex)
            {
                //lblErrorMsg.Text = ex.ToString();
                throw;
            }
        }
        public void graphStudy()
        {
            try
            {
                DataSet ds = new DataSet();
                DataTable dt = new DataTable();
                string barinfo = "";
                string[] col = { "#3c8dbc", "#FFFF00", "#A52A2A", "#008000", "#FF6347" };

                ds = dal.getMedicalMonitoringSummary(Action: "Overall_Study_Status_mCRC", Project_ID: Session["PROJECTID"].ToString(), INVID: null);
                dt = ds.Tables[0];

                for (int i = 0; i < dt.Columns.Count; i++)
                {
                    barinfo += "{'status': '" + dt.Columns[i].ToString() + "', 'study': " + dt.Rows[0][dt.Columns[i].ToString()].ToString() + ", 'color': '" + col[i] + "' },";
                }

                hfcolorbar.Value = "[" + barinfo.TrimEnd(',') + "]";
            }
            catch (Exception ex)
            {
                //lblErrorMsg.Text = ex.ToString();
                throw;
            }
            //ScriptManager.RegisterStartupScript(this, GetType(), "StudymCRC", "fun_StudymCRC()", true);
        }

        public void screenrandomised()
        {
            try
            {
                DataSet ds = new DataSet();
                DataTable dt = new DataTable();
                string barinfo = "";
                string[] col = { "#3c8dbc", "#FFFF00", "#A52A2A", "#008000", "#FF6347" };

                ds = dal.enrollmentcombinegraph(Action: "EnrollmentMonthwise", Project_ID: Session["PROJECTID"].ToString(), INVID: null);
                dt = ds.Tables[0];

                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    barinfo += "{'VistDate': '" + dt.Rows[i][dt.Columns[0].ToString()].ToString() + "', 'Randomised': " + dt.Rows[i][dt.Columns[1].ToString()].ToString() + "},";
                }

                hfrandomised.Value = "[" + barinfo.TrimEnd(',') + "]";
            }
            catch (Exception ex)
            {
                //lblErrorMsg.Text = ex.ToString();
                throw;
            }
        }

        public void graphExposureNSCLC()
        {
            try
            {
                DataSet ds = new DataSet();
                DataTable dt = new DataTable();
                string barinfo = "";

                ds = dal.getMedicalMonitoringSummary(Action: "SummaryOfExposure_NSCLC", Project_ID: Session["PROJECTID"].ToString(), INVID: null);
                dt = ds.Tables[0];


                for (int i = 1; i < dt.Columns.Count; i++)
                {
                    if (dt.Rows[0][i].ToString() == "")
                        barinfo += "{'Dose' : '" + dt.Columns[i].ToString() + "', 'value' : 0},";
                    else
                        barinfo += "{'Dose' : '" + dt.Columns[i].ToString() + "', 'value' : " + dt.Rows[0][i].ToString() + "},";
                }
                hfExposureNSCLC.Value = "[" + barinfo.TrimEnd(',') + "]";
            }
            catch (Exception ex)
            {
                //lblErrorMsg.Text = ex.ToString();
                throw;
            }
        }

        public void graphExposuremCRC()
        {
            try
            {
                DataSet ds = new DataSet();
                DataTable dt = new DataTable();
                string barinfo = "";

                ds = dal.getMedicalMonitoringSummary(Action: "SummaryOfExposure_mCRC", Project_ID: Session["PROJECTID"].ToString(), INVID: null);
                dt = ds.Tables[0];


                for (int i = 1; i < dt.Columns.Count; i++)
                {
                    if (dt.Rows[0][i].ToString() == "")
                        barinfo += "{'Dose' : '" + dt.Columns[i].ToString() + "', 'value' : 0},";
                    else
                        barinfo += "{'Dose' : '" + dt.Columns[i].ToString() + "', 'value' : " + dt.Rows[0][i].ToString() + "},";
                }
                hfExposuremCRC.Value = "[" + barinfo.TrimEnd(',') + "]";
            }
            catch (Exception ex)
            {
                //lblErrorMsg.Text = ex.ToString();
                throw;
            }
        }

        public void graphStatusNSCLC()
        {
            try
            {
                DataSet ds = new DataSet();
                DataTable dt = new DataTable();
                string barinfo = "";
                string[] col = { "#3c8dbc", "#FFFF00", "#A52A2A", "#008000", "#FF6347" };

                ds = dal.getMedicalMonitoringSummary(Action: "Overall_Study_Status_NSCLC", Project_ID: Session["PROJECTID"].ToString(), INVID: null);
                dt = ds.Tables[0];

                for (int i = 0; i < dt.Columns.Count; i++)
                {
                    barinfo += "{'status': '" + dt.Columns[i].ToString() + "', 'study': " + dt.Rows[0][dt.Columns[i].ToString()].ToString() + ", 'color': '" + col[i] + "' },";
                }

                hfStatusNSCLC.Value = "[" + barinfo.TrimEnd(',') + "]";
            }
            catch (Exception ex)
            {
                //lblErrorMsg.Text = ex.ToString();
                throw;
            }
        }

        public void pdminmoj()
        {
            try
            {
                DataSet ds = new DataSet();
                DataTable dt = new DataTable();
                string pieinfo = "";

                ds = dal.getpd(Action: "PDMAJMIN", Project_ID: Session["PROJECTID"].ToString(), INVID: null);
                dt = ds.Tables[0];

                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    pieinfo += "{ 'Cat': '" + dt.Rows[i][1].ToString() + "', 'CNTPDMAJMIN': " + dt.Rows[i][2].ToString() + "},";
                }
                hfpd.Value = "[" + pieinfo.TrimEnd(',') + "]";
            }
            catch (Exception ex)
            {
                //lblErrorMsg.Text = ex.ToString();
                throw;
            }
        }

        public void graphSiteWisemCRC()
        {
            try
            {
                DataSet ds = new DataSet();
                DataTable dt = new DataTable();
                string barinfo = "";

                ds = dal.getMedicalMonitoringSummary(Action: "Study_Status_Sitewise_mCRC", Project_ID: Session["PROJECTID"].ToString(), INVID: null);
                dt = ds.Tables[0];

                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    barinfo += "{ 'Site' : " + dt.Rows[i][0].ToString() + ", '" + dt.Columns[1].ToString() + "' : " + dt.Rows[i][1].ToString() + " , '" + dt.Columns[2].ToString() + "' : " + dt.Rows[i][2].ToString() + ", '" + dt.Columns[3].ToString() + "' : " + dt.Rows[i][3].ToString() + ", '" + dt.Columns[4].ToString() + "' : " + dt.Rows[i][4].ToString() + ", '" + dt.Columns[5].ToString() + "' : " + dt.Rows[i][5].ToString() + "},";
                }
                //hfmulti.Value = "[" + barinfo.TrimEnd(',') + "]";
            }
            catch (Exception ex)
            {
                //lblErrorMsg.Text = ex.ToString();
                throw;
            }
        }

        public void dashboarddetail()
        {
            try
            {
                DataSet ds = new DataSet();
                DataTable dt = new DataTable();

                ds = dal.dashboard(Action: "Total_SAE", Project_ID: Session["PROJECTID"].ToString(), INVID: null);
                dt = ds.Tables[0];
                if (dt.Rows.Count > 0)
                {
                    lbltotalsae.Text = dt.Rows[0]["COUNT"].ToString();
                }
                else
                {
                    lbltotalsae.Text = "0";
                }
                ds = dal.dashboard(Action: "TotalProtocolDeviation", Project_ID: Session["PROJECTID"].ToString(), INVID: null);
                dt = ds.Tables[0];
                if (dt.Rows.Count > 0)
                {
                    lbltotalprotocoldeviation.Text = dt.Rows[0]["COUNT"].ToString(); ;
                }
                else
                {
                    lbltotalprotocoldeviation.Text = "0";
                }

                ds = dal.dashboard(Action: "TotalOpenIssues", Project_ID: Session["PROJECTID"].ToString(), INVID: null);
                dt = ds.Tables[0];
                if (dt.Rows.Count > 0)
                {
                    lbltotalopenissue.Text = dt.Rows[0]["COUNT"].ToString();
                }
                else
                {
                    lbltotalopenissue.Text = "0";

                }

                ds = dal.dashboard(Action: "TotalCriticalRisks", Project_ID: Session["PROJECTID"].ToString(), INVID: null);
                dt = ds.Tables[0];
                if (dt.Rows.Count > 0)
                {
                    lbltotalcriticalrisks.Text = dt.Rows[0]["COUNT"].ToString();
                }
                else
                {
                    lbltotalcriticalrisks.Text = "0";
                }

                ds = dal.dashboard(Action: "SAELast2Months", Project_ID: Session["PROJECTID"].ToString(), INVID: null);
                dt = ds.Tables[0];
                if (dt.Rows.Count > 0)
                {
                    lbllast2mnt.Text = dt.Rows[0]["COUNT"].ToString();
                }
                else
                {
                    lbllast2mnt.Text = "0";
                }

                ds = dal.enrollmentcombinegraph(Action: "EnrollmentRate", Project_ID: Session["PROJECTID"].ToString(), INVID: null);
                dt = ds.Tables[0];
                if (dt.Rows.Count > 0)
                {
                    lblenrollmentrate.Text = dt.Rows[0]["EnrollmentRate"].ToString();
                }
                else
                {
                    lblenrollmentrate.Text = "0";
                }

                ds = dal.dashboard(Action: "SCREEN_FAIL_RATE_TOTAL", Project_ID: Session["PROJECTID"].ToString(), INVID: null);
                dt = ds.Tables[0];
                if (dt.Rows.Count > 0)
                {
                    lblscreenfailurerate.Text = dt.Rows[0]["SCREEN_FAIL_RATE"].ToString() + "%";
                }
                else
                {
                    lblscreenfailurerate.Text = "0";
                }

                ds = dal.dashboard(Action: "TotalNoofDropouts", Project_ID: Session["PROJECTID"].ToString(), INVID: null);
                dt = ds.Tables[0];
                if (dt.Rows.Count > 0)
                {
                    lbldropouts.Text = dt.Rows[0]["Column1"].ToString();
                }
                else
                {
                    lbldropouts.Text = "0";
                }

                ds = dal.enrollmentcombinegraph(Action: "DoseDiscontSAE", Project_ID: Session["PROJECTID"].ToString(), INVID: null);
                dt = ds.Tables[0];
                if (dt.Rows.Count > 0)
                {
                    lbldiscontinue.Text = dt.Rows[0]["Count"].ToString();
                }
                else
                {
                    lbldiscontinue.Text = "0";
                }

                ds = dal.getMMwidget(Action: "TotalDeaths", Project_ID: Session["PROJECTID"].ToString(), INVID: null);
                dt = ds.Tables[0];
                if (dt.Rows.Count > 0)
                {
                    lbldeath.Text = dt.Rows[0]["TotalDeaths"].ToString();
                }
                else
                {
                    lbldeath.Text = "0";
                }
            }
            catch (Exception ex)
            {
                //lblErrorMsg.Text = ex.ToString();
                throw;
            }
        }
        public void countrywisetotalsae()
        {
            try
            {
                DataSet ds = new DataSet();
                DataTable dt = new DataTable();
                string info = "";
                ds = dal.dashboard(Action: "SAE_COUNTRY_WISE", Project_ID: Session["PROJECTID"].ToString(), INVID: null);
                dt = ds.Tables[0];
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    info += "{'COUNTRY': '" + dt.Rows[i][2].ToString() + "', 'COUNT': " + dt.Rows[i][dt.Columns[3].ToString()].ToString() + " },";
                }
            }
            catch (Exception ex)
            {
                //lblErrorMsg.Text = ex.ToString();
                throw;
            }
            //hftotalcsae.Value = "[" + info.TrimEnd(',') + "]";
        }
        public void gradewisesae()
        {
            try
            {
                DataSet ds = new DataSet();
                DataTable dt = new DataTable();
                string info = "";
                ds = dal.dashboard(Action: "SAE_Grade_WISE", Project_ID: Session["PROJECTID"].ToString(), INVID: null);
                dt = ds.Tables[0];
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    info += "{'AETOXGR': '" + dt.Rows[i][1].ToString() + "', 'COUNT': " + dt.Rows[i][dt.Columns[2].ToString()].ToString() + " },";
                }
            }
            catch (Exception ex)
            {
                //lblErrorMsg.Text = ex.ToString();
                throw;
            }
            //hfgradewise.Value = "[" + info.TrimEnd(',') + "]";
        }
        public void saebymonth()
        {
            try
            {
                DataSet ds = new DataSet();
                DataTable dt = new DataTable();
                string info = "";
                ds = dal.dashboard(Action: "SAE_by_Month", Project_ID: Session["PROJECTID"].ToString(), INVID: null);
                dt = ds.Tables[0];
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    info += "{'Month': '" + dt.Rows[i][2].ToString() + "', 'COUNT': " + dt.Rows[i][dt.Columns[3].ToString()].ToString() + " },";
                }

                //hfmonth.Value = "[" + info.TrimEnd(',') + "]";
            }
            catch (Exception ex)
            {
                //lblErrorMsg.Text = ex.ToString();
                throw;
            }
        }
        public void saebyquarter()
        {
            try
            {
                DataSet ds = new DataSet();
                DataTable dt = new DataTable();
                string info = "";
                ds = dal.dashboard(Action: "SAE_by_Quarter", Project_ID: Session["PROJECTID"].ToString(), INVID: null);
                dt = ds.Tables[0];
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    info += "{'Quarter': '" + dt.Rows[i][1].ToString() + "-Q" + dt.Rows[i][2].ToString() + "', 'COUNT': " + dt.Rows[i][dt.Columns[3].ToString()].ToString() + " },";
                }
            }
            catch (Exception ex)
            {
                //lblErrorMsg.Text = ex.ToString();
                throw;
            }
            //hfquarter.Value = "[" + info.TrimEnd(',') + "]";
        }
    }
}