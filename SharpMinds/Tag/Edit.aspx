<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="SharpMinds.Tag.Edit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:DetailsView ID="DetailsView1" HeaderText="Edit Tag" runat="server" AutoGenerateRows="False" CellPadding="4" DataKeyNames="TagId" DataSourceID="SqlDataSource1" DefaultMode="Edit" ForeColor="#333333" GridLines="None" Height="50px" Width="321px" OnItemUpdating="DetailsView1_ItemUpdating" OnItemUpdated="DetailsView1_ItemUpdated">
        <AlternatingRowStyle BackColor="White" />
        <CommandRowStyle BackColor="#C5BBAF" Font-Bold="True" />
        <EditRowStyle BackColor="#7C6F57" />
        <FieldHeaderStyle BackColor="#D0D0D0" Font-Bold="True" />
        <Fields>
            <asp:BoundField DataField="TagId" HeaderText="Tag Id" InsertVisible="False" ReadOnly="True" SortExpression="TagId" />
            <asp:TemplateField HeaderText="Tag Name" SortExpression="TagName">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" CssClass="form-control" runat="server" Text='<%# Bind("TagName") %>'></asp:TextBox>
                </EditItemTemplate>
               
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Category" SortExpression="CategoryId">
                <EditItemTemplate>
                    <asp:DropDownList CssClass="form-control" DataTextField="CategoryName" DataValueField="CategoryId" runat="server" ID="ddlUpdate" DataSourceID="SqlDataSource2"></asp:DropDownList>
                </EditItemTemplate>
               
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:LinkButton ID="LinkButton1" CssClass="btn btn-primary" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" CssClass="btn btn-default" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                </EditItemTemplate>
               
            </asp:TemplateField>
        </Fields>
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" />
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SharpMindsConnectionString %>"  ProviderName="System.Data.SqlClient" SelectCommand="SELECT [TagName], [TagId], [CategoryId] FROM [Tag] WHERE ([TagId] = @TagId)" UpdateCommand="UPDATE [Tag] SET [TagName] = @TagName, [CategoryId] = @CategoryId WHERE [TagId] = @TagId">
        
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="0" Name="TagId" QueryStringField="Id" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="TagName" Type="String" />
            
            <asp:Parameter Name="TagId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

     <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SharpMindsConnectionString %>" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [CategoryId], [CategoryName] FROM [Category]">

    </asp:SqlDataSource>
</asp:Content>
