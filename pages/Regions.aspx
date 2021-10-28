<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Regions.aspx.vb" Inherits="WebFormDemo.Regions" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:sqldatasource id="sdsRegions"
          selectcommand="SELECT * FROM dbo.luRegions ORDER BY RegionName"
          connectionstring="<%$ ConnectionStrings: myDemo %>" 
          runat="server"/>

<asp:gridview id="gvRegions" 
  datasourceid="sdsRegions" 
  autogeneratecolumns="False"
  emptydatatext="No data available." 
  allowpaging="True" 
  runat="server" DataKeyNames="RegionId"
    class="table table-striped">
    <Columns>
        <asp:BoundField DataField="RegionId" HeaderText="RegionId" 
            InsertVisible="False" ReadOnly="True" SortExpression="RegionId" Visible="False"  />
        <asp:BoundField DataField="RegionName" HeaderText="RegionName" 
            SortExpression="TypeName" />
    </Columns>
</asp:gridview>
</asp:Content>
