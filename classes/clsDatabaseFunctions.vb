Imports System.Data.SqlClient


Public Class clsDatabaseFunctions

    Public sConnectionString As String = ConfigurationManager.ConnectionStrings("myDemo").ConnectionString

    Public Function ExecuteCmd(ByVal cmd As SqlCommand, ByRef sErrorMessage As String) As Boolean
        Dim con As New SqlConnection(sConnectionString)

        cmd.Connection = con

        Try
            con.Open()
            cmd.ExecuteNonQuery()
            Return True

        Catch ex As Exception
            sErrorMessage = Err.Description.ToString
            Return False

        Finally
            con.Close()
            con.Dispose()
        End Try
    End Function

    Public Function GetDataTable(ByVal cmd As SqlCommand, ByRef sErrorMessage As String, Optional ByVal sDataTableName As String = "DataTable1") As DataTable

        Dim con As New SqlConnection(sConnectionString)
        Dim dt As New DataTable(sDataTableName)
        Dim sda As New SqlDataAdapter

        cmd.Connection = con

        Try
            con.Open()
            sda.SelectCommand = cmd
            sda.Fill(dt)

            Return dt

        Catch ex As Exception
            sErrorMessage = ex.Message.ToString

            Return Nothing

        Finally
            con.Close()
            sda.Dispose()
            con.Dispose()

        End Try



    End Function

End Class
