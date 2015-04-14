<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Create.aspx.cs" Inherits="SharpMinds.Category.Create" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateInsertButton="True" OnItemInserting="DetailsView1_ItemInserting" AutoGenerateRows="False" CellPadding="4" DataKeyNames="CategoryId" DataSourceID="SqlDataSource1" DefaultMode="Insert" ForeColor="#333333" GridLines="None" Height="50px" Width="125px" OnItemCreated="DetailsView1_ItemCreated">
        <AlternatingRowStyle BackColor="White" />
        <CommandRowStyle BackColor="#C5BBAF" Font-Bold="True" />
        <EditRowStyle BackColor="#7C6F57" />
        <FieldHeaderStyle BackColor="#D0D0D0" Font-Bold="True" />
        <Fields>
            
            <asp:BoundField DataField="CategoryName" HeaderText="Name" SortExpression="CategoryName" />
            
        </Fields>
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" />
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:SharpMindsConnectionString %>" 
        DeleteCommand="DELETE FROM [Category] WHERE [CategoryId] = @original_CategoryId AND [CategoryName] = @original_CategoryName AND [CreatedOn] = @original_CreatedOn AND [ModifiedOn] = @original_ModifiedOn AND [CreatedBy] = @original_CreatedBy AND [Updatedby] = @original_Updatedby" 
        InsertCommand="INSERT INTO [Category] ([CategoryName], [CreatedBy], [Updatedby]) VALUES ( @CategoryName, @CreatedBy, @Updatedby)"
         OldValuesParameterFormatString="original_{0}" 
        SelectCommand="SELECT * FROM [Category]" 
        UpdateCommand="UPDATE [Category] SET [CategoryName] = @CategoryName, [CreatedOn] = @CreatedOn, [ModifiedOn] = @ModifiedOn, [CreatedBy] = @CreatedBy, [Updatedby] = @Updatedby WHERE [CategoryId] = @original_CategoryId AND [CategoryName] = @original_CategoryName AND [CreatedOn] = @original_CreatedOn AND [ModifiedOn] = @original_ModifiedOn AND [CreatedBy] = @original_CreatedBy AND [Updatedby] = @original_Updatedby">
        <DeleteParameters>
            <asp:Parameter Name="original_CategoryId" Type="Int32" />
            <asp:Parameter Name="original_CategoryName" Type="String" />
            <asp:Parameter DbType="Date" Name="original_CreatedOn" />
            <asp:Parameter DbType="Date" Name="original_ModifiedOn" />
            <asp:Parameter Name="original_CreatedBy" Type="Object" />
            <asp:Parameter Name="original_Updatedby" Type="Object" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="CategoryName" Type="String" />
           
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="CategoryName" Type="String" />
            <asp:Parameter DbType="Date" Name="CreatedOn" />
            <asp:Parameter DbType="Date" Name="ModifiedOn" />
            <asp:Parameter Name="CreatedBy" />
            <asp:Parameter Name="Updatedby" />
            <asp:Parameter Name="original_CategoryId" Type="Int32" />
            <asp:Parameter Name="original_CategoryName" Type="String" />
           <%-- <asp:Parameter DbType="Date" Name="original_CreatedOn" />
            <asp:Parameter DbType="Date" Name="original_ModifiedOn" />--%>
           <%-- <asp:Parameter Name="original_CreatedBy" Type="Object" />
            <asp:Parameter Name="original_Updatedby" Type="Object" />--%>
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
