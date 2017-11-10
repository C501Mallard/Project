<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SearchFA.aspx.cs" Inherits="SearchFA" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:constr %>" SelectCommand="SELECT distinct 類別 FROM FA61">
            </asp:SqlDataSource>
            <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="true" DataSourceID="SqlDataSource2" DataTextField="類別">
               <%-- <asp:ListItem Text="查資料"></asp:ListItem>--%>
              <%--  <asp:ListItem Text="(三) 抗氧化劑"></asp:ListItem>
                <asp:ListItem Text="(七) 品質改良用、釀造用及食品製造用劑"></asp:ListItem>
                --%>
            </asp:DropDownList>


            <asp:Button ID="Button1" runat="server" Text="查詢" OnClick="Button1_Click" />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:constr %>" SelectCommand="table_query2" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="table_class" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <%--         預存程式
                        create proc table_query
	                        @table_name nvarchar(10)
                        as
                        begin
	                        exec ('select * from '+@table_name)
                        end
                所以  SelectCommand 要對應 預存程式的名稱  table_query，ControlParameter的Name 要對應 預存程式的變數 @table_name
            --%>
            <hr />
            <asp:GridView ID="GridView2" runat="server" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" GridLines="None">
                <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#594B9C" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#33276A" />
            </asp:GridView>
        </div>
    </form>
</body>
</html>
