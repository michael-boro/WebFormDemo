<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="AddPokemon.aspx.vb" Inherits="WebFormDemo.AddPokemon" %>



<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .divAddPokemonContainer {
            margin: 10px auto;
            width: 50%;
        }
    </style>
    <div class="row divAddPokemonContainer">
        <asp:TextBox ID="tbxPokemonName" runat="server" CssClass="form-control inputSpace" Placeholder="Name" />
        <asp:TextBox ID="tbxPokedex" runat="server" CssClass="form-control inputSpace" TextMode="Number" Placeholder="Number" />
        <asp:DropDownList ID="ddlType1" runat="server" DataSourceID="sdsTypes" DataTextField="TypeName" DataValueField="TypeId" CssClass="form-control inputSpace" />
        <asp:DropDownList ID="ddlType2" runat="server" DataSourceID="sdsTypes" DataTextField="TypeName" DataValueField="TypeId" CssClass="form-control inputSpace" />
        <asp:DropDownList ID="ddlRegion" runat="server" DataSourceID="sdsRegions" DataTextField="RegionName" DataValueField="RegionId" CssClass="form-control inputSpace" />
        <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-block btn-success" OnClick="btnSubmit_Click" />
    </div>
    <br />
    <div id="divErrorMessage" runat="server" class="alert text-center">Test</div>

    <%--SQL Data Sources--%>
    <asp:SqlDataSource
        ConnectionString="<%$ ConnectionStrings: myDemo %>"
        ID="sdsTypes"
        runat="server"
        SelectCommand="SELECT ' Please Select' AS TypeName, 0 AS TypeId UNION ALL SELECT TypeName, TypeId FROM dbo.luTypes ORDER BY TypeName" />

    <asp:SqlDataSource
        ConnectionString="<%$ ConnectionStrings: myDemo %>"
        ID="sdsRegions"
        runat="server"
        SelectCommand="SELECT ' Please Select' AS RegionName, 0 AS RegionId UNION ALL SELECT RegionName, RegionId FROM dbo.luRegions ORDER BY RegionName" />

</asp:Content>
