<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Pokemon.aspx.vb" Inherits="WebFormDemo.Pokemon" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    

<asp:gridview id="gvPokemon" 
  datasourceid="sdsPokemon" 
  autogeneratecolumns="False"
  emptydatatext="No data available." 
  allowpaging="True" 
  runat="server" DataKeyNames="PokemonId"
    class="table table-striped">
    <Columns>
        <asp:BoundField DataField="PokemonId" HeaderText="PokemonId" 
            InsertVisible="False" ReadOnly="True" SortExpression="RegionId" Visible="False" />
        <asp:BoundField DataField="PokemonName" HeaderText="PokemonName" 
            SortExpression="PokemonName" />
        <asp:BoundField DataField="PokedexNumber" HeaderText="PokedexNumber" 
            SortExpression="PokedexNumber" />
        <asp:BoundField DataField="RegionName" HeaderText="RegionName" 
            SortExpression="RegionName" />
        <asp:BoundField DataField="Type1" HeaderText="Type1" 
            SortExpression="Type1" />
        <asp:BoundField DataField="Type2" HeaderText="Type2" 
            SortExpression="Type2" />
    </Columns>
</asp:gridview>



    <asp:sqldatasource id="sdsPokemon"
          selectcommand="SELECT PokemonId, PokemonName, PokedexNumber, R.RegionName, T1.TypeName AS Type1, T2.TypeName AS Type2
                            FROM dbo.dtPokemon P
                            INNER JOIN dbo.luRegions R ON R.RegionId = P.Region
                            INNER JOIN dbo.luTypes T1 ON T1.TypeId = P.Type1
                            INNER JOIN dbo.luTypes T2 ON T2.TypeId = P.Type2
                            ORDER BY PokedexNumber"
          connectionstring="<%$ ConnectionStrings: myDemo %>" 
          runat="server"/>

</asp:Content>
