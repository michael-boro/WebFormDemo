<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Types.aspx.vb" Inherits="WebFormDemo.Types" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:sqldatasource id="sdsTypes"
          selectcommand="SELECT * FROM dbo.luTypes ORDER BY TypeName"
          connectionstring="<%$ ConnectionStrings: myDemo %>" 
          runat="server"/>

<asp:gridview id="gvTypes" 
  datasourceid="sdsTypes" 
  autogeneratecolumns="False"
  emptydatatext="No data available." 
  allowpaging="True" 
  runat="server" DataKeyNames="TypeId"
    class="table table-striped">
    <Columns>
        <asp:BoundField DataField="TypeId" HeaderText="TypeId" 
            InsertVisible="False" ReadOnly="True" SortExpression="TypeId"  Visible="False"  />
        <asp:BoundField DataField="TypeName" HeaderText="TypeName" 
            SortExpression="TypeName" />
    </Columns>
</asp:gridview>
</asp:Content>
