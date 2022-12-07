Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Configuration
Imports System.Collections
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls

Partial Public Class _Default
	Inherits System.Web.UI.Page
	Protected Sub grid_CustomUnboundColumnData(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridViewColumnDataEventArgs)
		If e.Column.FieldName = "percent" Then
			If (grid.GroupCount > 0) Then
				Dim itemKeyValue As String = e.GetListSourceFieldValue("ProductID").ToString()
				Dim summaryValue As Object = grid.GetGroupSummaryValue(GetGroupIndex(itemKeyValue), grid.GroupSummary(0))
				If summaryValue IsNot Nothing Then
					e.Value = CDec(e.GetListSourceFieldValue("UnitPrice")) / CDec(summaryValue)
				End If
			Else
				e.Value = CDec(e.GetListSourceFieldValue("UnitPrice")) / CDec(grid.GetTotalSummaryValue(grid.TotalSummary(0)))
			End If

		End If
	End Sub

	Protected Function GetGroupIndex(ByVal itemKeyValue As String) As Integer
		Dim itemIndex As Integer = grid.FindVisibleIndexByKeyValue(itemKeyValue)
		Dim i As Integer = itemIndex - 1
		Do While i >= 0
			If grid.IsGroupRow(i) Then
				Return i
			End If
			i += -1
		Loop
		Return -1
	End Function

End Class
