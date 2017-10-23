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
using System.Text;

public partial class csv_upload : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlDataSource1.Insert();
        //SqlDataSource2.Insert();
        //SqlDataSource1.SelectCommand = "create table 食品添加集 ( 類別 varchar(50) null, 中文品名 varchar(50) null,英文品名 varchar(50) null, 使用範圍用量限制 nvarchar(50), 使用限制 nvarchar(50),規格 nvarchar(50), 類別說明  nvarchar(50) )";
    }

    protected void Upload(object sender, EventArgs e)
    {
        //Upload and save the file
        string csvPath = Server.MapPath("~/Files/") + Path.GetFileName(FileUpload1.PostedFile.FileName);
        FileUpload1.SaveAs(csvPath);

        DataTable dt = new DataTable();
        dt.Columns.AddRange(new DataColumn[7] { new DataColumn("類別", typeof(string)),
            new DataColumn("中文品名", typeof(string)),
            new DataColumn("英文品名",typeof(string)),
            new DataColumn("使用食品範圍及限量", typeof(string)),
            new DataColumn("使用限制", typeof(string)),
            new DataColumn("規格", typeof(string)),
            new DataColumn("類別說明", typeof(string))});

        string csvData = File.ReadAllText(csvPath, System.Text.Encoding.GetEncoding("utf-8"));
        foreach (string row in csvData.Replace("\"", "").Replace("\r\n", "\r").Trim().Split('\r'))
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
                sqlBulkCopy.DestinationTableName = "dbo.FA61";
                con.Open();
                sqlBulkCopy.WriteToServer(dt);
                con.Close();
            }
        }
    }
}