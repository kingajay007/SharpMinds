<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="SharpMinds.Category.Edit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:DetailsView 
        ID="DetailsView1"
        OnItemUpdated="DetailsView1_ItemUpdated" 
        runat="server" 
        AutoGenerateRows="False" 
        DataKeyNames="CategoryId" 
        DataSourceID="SqlDataSource1" 
        DefaultMode="Edit" 
        Height="50px" Width="125px" 
        AutoGenerateEditButton="True" 
        OnItemUpdating="DetailsView1_ItemUpdating" 
        CellPadding="4" ForeColor="#333333" GridLines="None">

        <AlternatingRowStyle BackColor="White" />
        <CommandRowStyle BackColor="#C5BBAF" Font-Bold="True" />
        <EditRowStyle BackColor="#7C6F57" />
        <FieldHeaderStyle BackColor="#D0D0D0" Font-Bold="True" />
        <Fields>
            <asp:TemplateField HeaderText="Category Id" InsertVisible="False" SortExpression="CategoryId">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("CategoryId") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Name" SortExpression="CategoryName">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("CategoryName") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
        </Fields>
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" />
    </asp:DetailsView>
    <asp:SqlDataSource 
        ID="SqlDataSource1" 
        runat="server"
        OnUpdating="SqlDataSource1_Updating"
        ConflictDetection="CompareAllValues" 
        ConnectionString="<%$ ConnectionStrings:SharpMindsConnectionString %>" 
        UpdateCommandType="StoredProcedure" 
        ProviderName="System.Data.SqlClient" 
        SelectCommand="SELECT * FROM [Category] where CategoryId =@CategoryId" 
        OldValuesParameterFormatString="original_{0}"
        UpdateCommand="uspUpdateCategory" >
       
       <SelectParameters>
           <asp:QueryStringParameter QueryStringField="Id" Name="CategoryId" DbType="Int32" />
       </SelectParameters>
        <UpdateParameters>
           <asp:QueryStringParameter QueryStringField="Id" Name="CategoryId" DbType="Int32" />
            <asp:Parameter Name="CategoryName" Type="String" />
            <asp:Parameter Name="ImageId" Type="Int32" />
            <asp:Parameter Name="UpdatedBy" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
