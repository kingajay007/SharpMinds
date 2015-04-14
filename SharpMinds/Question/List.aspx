<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="SharpMinds.Question.List" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="QuestionId" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="TagName" HeaderText="TagName" SortExpression="TagName" />
            <asp:BoundField DataField="Query" HeaderText="Query" SortExpression="Query" />
            <asp:HyperLinkField DataNavigateUrlFields="QuestionId" DataNavigateUrlFormatString="Edit.aspx?Id={0}" Text="Edit" />
            <asp:HyperLinkField DataNavigateUrlFields="QuestionId" DataNavigateUrlFormatString="~/Option/Create.aspx?QId={0}" Text="Add Option" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=.\SQLEXPRESS;Initial Catalog=SharpMinds;Integrated Security=True;User ID=sa;Password=admin@123" ProviderName="System.Data.SqlClient" SelectCommand="SELECT Tag.TagName, Question.* FROM Question INNER JOIN Tag ON Question.TagId = Tag.TagId"></asp:SqlDataSource>
</asp:Content>
