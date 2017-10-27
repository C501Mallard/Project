using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Odbc;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.OleDb;
using System.IO;
using System.Text.RegularExpressions;

public partial class csv_upload_01 : System.Web.UI.Page
{
    DataTable sdt = new DataTable();
    string csvPath, csvPathT, csvFileT, csvFolder, csvFile, csvFilename;
    DataTable dt = new DataTable();
    string connString, connString1;
    int key = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlDataSource2.Insert();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        csvFolder = Server.MapPath("~/Files/");
        csvFile = Path.GetFileName(FileUpload1.PostedFile.FileName);
        csvPath = csvFolder + csvFile;
        csvFilename = csvFolder + "FA61.csv";
        //csvPath = Server.MapPath("~/Files/") + Path.GetFileName(FileUpload1.PostedFile.FileName);
        if (File.Exists(csvFilename))
        {
            File.Delete(csvFilename);
        }

        FileUpload1.SaveAs(csvPath);
        File.Move(csvPath, csvFilename);

        connString = @"Driver={Microsoft Text Driver (*.txt; *.csv)};Dbq=" + csvFolder + ";Extensions=csv,txt;";
        //string connString = WebConfigurationManager.ConnectionStrings["CsvUTF8ConnectionString"].ConnectionString;
        using (OdbcConnection conn = new OdbcConnection(connString))
        {
            string query = "SELECT * FROM FA61.CSV";
            using (OdbcDataAdapter da = new System.Data.Odbc.OdbcDataAdapter(query, conn))
            {

                da.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();

                sdt = dt;


                dt.Dispose();
                da.Dispose();
            }
        }

        connString1 = WebConfigurationManager.ConnectionStrings["FA_SQLConnectionString"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(connString1))
        {
            conn.Open();
            using (SqlBulkCopy bulkCopy = new SqlBulkCopy(conn))
            {
                bulkCopy.DestinationTableName = "dbo.FA61";

                bulkCopy.WriteToServer(sdt);
            }

            conn.Dispose();
        }

    }




    protected void Button2_Click(object sender, EventArgs e)
    {
        //SqlDataSource1.Insert();
        connString1 = WebConfigurationManager.ConnectionStrings["FA_SQLConnectionString"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(connString1))
        {
            conn.Open();
            using (SqlBulkCopy bulkCopy = new SqlBulkCopy(conn))
            {
                bulkCopy.DestinationTableName = "dbo.FA61";

                bulkCopy.WriteToServer(sdt);
            }

            conn.Dispose();
        }
    }
}