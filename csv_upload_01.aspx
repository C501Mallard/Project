<%@ Page Language="C#" AutoEventWireup="true" CodeFile="csv_upload_01.aspx.cs" Inherits="csv_upload_01" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:test2ConnectionString %>" InsertCommand="新增原始食品添加物資料集" InsertCommandType="StoredProcedure"></asp:SqlDataSource>
            <asp:FileUpload ID="FileUpload1" runat="server"></asp:FileUpload>


            <asp:Button ID="Button1" runat="server" Text="顯示資料" OnClick="Button1_Click" />
            <%--<asp:Button ID="Button2" runat="server" Text="匯入SQL Server" OnClick="Button2_Click" />--%>


            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FA_ODBCConnectionString %>" ProviderName="<%$ ConnectionStrings:FA_ODBCConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [FA61]"></asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4">
                <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                <RowStyle BackColor="White" ForeColor="#330099" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                <SortedAscendingCellStyle BackColor="#FEFCEB" />
                <SortedAscendingHeaderStyle BackColor="#AF0101" />
                <SortedDescendingCellStyle BackColor="#F6F0C0" />
                <SortedDescendingHeaderStyle BackColor="#7E0000" />
            </asp:GridView>

        </div>
    </form>
</body>
</html>
