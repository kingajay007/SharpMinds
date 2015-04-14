<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="SharpMinds.Category.Edit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="CategoryId" DataSourceID="SqlDataSource1" DefaultMode="Edit" Height="50px" Width="125px" AutoGenerateEditButton="True" OnItemUpdating="DetailsView1_ItemUpdating" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <CommandRowStyle BackColor="#C5BBAF" Font-Bold="True" />
        <EditRowStyle BackColor="#7C6F57" />
        <FieldHeaderStyle BackColor="#D0D0D0" Font-Bold="True" />
        <Fields>
            <asp:BoundField DataField="CategoryId" HeaderText="Category Id" InsertVisible="False" ReadOnly="True" SortExpression="CategoryId" />
            <asp:BoundField DataField="CategoryName" HeaderText="Name" SortExpression="CategoryName" />
            <asp:TemplateField HeaderText="Created On" SortExpression="CreatedOn">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("CreatedOn","{0:d}") %>'></asp:Label>
                </EditItemTemplate>
               
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("CreatedOn") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Modified On" SortExpression="ModifiedOn">
                <EditItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("ModifiedOn","{0:d}") %>'></asp:Label>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("ModifiedOn") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("ModifiedOn") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Fields>
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" />
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="Data Source=.\SQLEXPRESS;Initial Catalog=SharpMinds;Integrated Security=True;User ID=sa;Password=admin@123"   OldValuesParameterFormatString="original_{0}" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [Category] where CategoryId =@CategoryId" UpdateCommand="UPDATE [Category] SET [CategoryName] = @CategoryName,[UpdatedBy] = @UpdatedBy WHERE [CategoryId] = @original_CategoryId " >
       
       <SelectParameters>
           <asp:QueryStringParameter QueryStringField="Id" Name="CategoryId" DbType="Int32" />
       </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="CategoryName" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
