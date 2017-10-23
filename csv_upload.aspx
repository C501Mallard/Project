<%@ Page Language="C#" AutoEventWireup="true" CodeFile="csv_upload.aspx.cs" Inherits="csv_upload" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <%-- <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:constr %>" SelectCommand="新增原始食品添加物資料集"></asp:SqlDataSource>--%>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:constr %>" InsertCommand="新增原始食品添加物資料集" InsertCommandType="StoredProcedure">
        
    </asp:SqlDataSource>

<%--<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:FAString %>" ProviderName="<%$ ConnectionStrings:FAString.ProviderName %>" SelectCommand="SELECT * FROM [FAsample.csv]" InsertCommand="SELECT * FROM [FAsample.csv]"></asp:SqlDataSource>--%>
        
    <asp:FileUpload ID="FileUpload1" runat="server" />
    <asp:Button Text="Upload" OnClick="Upload" runat="server" />

        <hr />
       <%-- <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource2"></asp:GridView>--%>
    </div>
    </form>
</body>
</html>
