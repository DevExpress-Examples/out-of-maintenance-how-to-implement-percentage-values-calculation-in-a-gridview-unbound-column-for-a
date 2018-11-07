<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>


<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <dx:ASPxGridView ID="grid" runat="server" AutoGenerateColumns="False" DataSourceID="sds"
                KeyFieldName="ProductID" OnCustomUnboundColumnData="grid_CustomUnboundColumnData">
                <TotalSummary>
                    <dx:ASPxSummaryItem DisplayFormat="c2" FieldName="UnitPrice" SummaryType="Sum" />
                </TotalSummary>
                <GroupSummary>
					<dx:ASPxSummaryItem DisplayFormat="c2" FieldName="UnitPrice" 
						ShowInGroupFooterColumn="UnitPrice" SummaryType="Sum" />
				</GroupSummary>
                <Columns>
					<dx:GridViewDataTextColumn FieldName="ProductID" ReadOnly="True" VisibleIndex="0">
						<EditFormSettings Visible="False" />
					</dx:GridViewDataTextColumn>
					<dx:GridViewDataTextColumn FieldName="ProductName" VisibleIndex="1">
					</dx:GridViewDataTextColumn>
					<dx:GridViewDataTextColumn FieldName="CategoryID" GroupIndex="0" SortIndex="0" SortOrder="Ascending"
						VisibleIndex="2">
					</dx:GridViewDataTextColumn>
					<dx:GridViewDataTextColumn FieldName="UnitPrice" VisibleIndex="3">
						<PropertiesTextEdit DisplayFormatString="c2">
						</PropertiesTextEdit>
					</dx:GridViewDataTextColumn>
					<dx:GridViewDataTextColumn FieldName="percent" UnboundType="Decimal" VisibleIndex="3">
						<PropertiesTextEdit DisplayFormatString="p2">
						</PropertiesTextEdit>
						<EditFormSettings Visible="False" />
					</dx:GridViewDataTextColumn>
                </Columns>
                <Settings ShowFooter="True" ShowGroupFooter="VisibleIfExpanded" ShowGroupPanel="True" />
            </dx:ASPxGridView>
            <asp:SqlDataSource ID="sds" runat="server" ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>"
                SelectCommand="SELECT TOP 20 [ProductID], [ProductName], [CategoryID], [UnitPrice] FROM [Products]"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
