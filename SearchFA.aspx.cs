using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SearchFA : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

       
        //SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        //SqlDataAdapter da = new SqlDataAdapter("select distinct  類別  from 食品添加物資料集61 order by  類別 asc", conn);

        //DataSet ds = new DataSet();

        //da.Fill(ds);
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

    }
}