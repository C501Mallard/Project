using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

//https://www.aspsnippets.com/Articles/Import-Upload-CSV-file-data-to-SQL-Server-database-in-ASPNet-using-C-and-VBNet.aspx
//http://www.parallelcodes.com/import-csv-file-to-ms-sql-server-using-asp-net-c/
public partial class CS : System.Web.UI.Page
{
    protected void Upload(object sender, EventArgs e)
    {
        //Upload and save the file
        string csvPath = Server.MapPath("~/Files/") + Path.GetFileName(FileUpload1.PostedFile.FileName);
        FileUpload1.SaveAs(csvPath);

        DataTable dt = new DataTable();
        dt.Columns.AddRange(new DataColumn[3] { new DataColumn("Id", typeof(int)),
            new DataColumn("Name", typeof(string)),
            new DataColumn("Country",typeof(string)) });


        string csvData = File.ReadAllText(csvPath);
        foreach (string row in csvData.Split('\n'))
        {
            if (!string.IsNullOrEmpty(row))
            {
                dt.Rows.Add();
                int i = 0;
                foreach (string cell in row.Split(','))
                {
                    dt.Rows[dt.Rows.Count - 1][i] = cell;
                    i++;
                }
            }
        }

        string consString = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        using (SqlConnection con = new SqlConnection(consString))
        {
            using (SqlBulkCopy sqlBulkCopy = new SqlBulkCopy(con))
            {
                //Set the database table name
                sqlBulkCopy.DestinationTableName = "dbo.Customers";
                con.Open();
                sqlBulkCopy.WriteToServer(dt);
                con.Close();
            }
        }
    }
}