Imports System.Data.SqlClient

Public Class AddPokemon
    Inherits System.Web.UI.Page

    Dim dbf As New clsDatabaseFunctions

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            divErrorMessage.Visible = False
        End If

    End Sub

    Protected Sub btnSubmit_Click()
        divErrorMessage.Visible = False

        If ValidateForm() = False Then
            divErrorMessage.InnerText = "Please fill out all fields correctly"
            divErrorMessage.Attributes.Add("class", "alert alert-danger text-center")
            divErrorMessage.Visible = True
        Else

            Dim sErrorMessage As String = ""

            Using cmd As New SqlCommand()
                cmd.CommandText = "INSERT INTO dbo.dtPokemon (PokemonName, PokedexNumber, Type1, Type2, Region) VALUES (@PokemonName, @PokedexNumber, @Type1, @Type2, @Region)"
                cmd.Parameters.AddWithValue("@PokemonName", tbxPokemonName.Text)
                cmd.Parameters.AddWithValue("@PokedexNumber", tbxPokedex.Text)
                cmd.Parameters.AddWithValue("@Type1", ddlType1.SelectedValue)
                cmd.Parameters.AddWithValue("@Type2", ddlType2.SelectedValue)
                cmd.Parameters.AddWithValue("@Region", ddlRegion.SelectedValue)

                dbf.ExecuteCmd(cmd, sErrorMessage)
            End Using

            If sErrorMessage <> "" Then
                divErrorMessage.InnerText = sErrorMessage
                divErrorMessage.Visible = True
                divErrorMessage.Attributes.Add("class", "alert alert-danger text-center")
            Else
                divErrorMessage.InnerText = "Pokemon Added Successfully"
                divErrorMessage.Visible = True
                divErrorMessage.Attributes.Add("class", "alert alert-success text-center")

            End If
        End If
    End Sub

    Protected Function ValidateForm() As Boolean
        Dim check As Boolean = True

        If ddlType1.SelectedValue = 0 Or ddlType1.SelectedValue = 19 Then
            check = False
        End If

        If ddlType2.SelectedValue = 0 Then
            check = False
        End If

        If ddlRegion.SelectedValue = 0 Then
            check = False
        End If

        If tbxPokedex.Text = "" Then
            check = False
        End If

        If tbxPokemonName.Text = "" Then
            check = False
        End If

        Return check
    End Function

End Class