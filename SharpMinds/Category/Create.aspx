<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Create.aspx.cs" Inherits="SharpMinds.Category.Create" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:DetailsView ID="DetailsView1" runat="server"  OnItemInserting="DetailsView1_ItemInserting" AutoGenerateRows="False" CellPadding="4" DataKeyNames="CategoryId" DataSourceID="SqlDataSource1" DefaultMode="Insert" ForeColor="#333333" HeaderText="Create Category" GridLines="None" Height="50px" Width="324px" >
        <AlternatingRowStyle BackColor="White" />
        <CommandRowStyle BackColor="#C5BBAF" Font-Bold="True" />
        <EditRowStyle BackColor="#7C6F57" />
        <FieldHeaderStyle BackColor="#D0D0D0" Font-Bold="True" />
        <Fields>
            
            <asp:TemplateField HeaderText="Name" SortExpression="CategoryName">
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server" Text='<%# Bind("CategoryName") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="RequiredFieldValidator">Category Name is Required</asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="customValidatoryCategoryName" runat="server" Display="Dynamic" ControlToValidate="TextBox1" OnServerValidate="customValidatoryCategoryName_ServerValidate" ErrorMessage="Category name must contain 3 - 50 characters" ></asp:CustomValidator>
                   
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("CategoryName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
             <asp:TemplateField HeaderText="Image" SortExpression="ImageId">
                <InsertItemTemplate>
                    <asp:FileUpload runat="server" ID="CategoryImageUpload" CssClass="form-control" />
                    <br />
                    <asp:Image  ID="CategoryImage" DescriptionUrl='<%#Bind("ImageId") %>' runat="server"/>
                    <asp:Button runat="server" OnClick="btnUpload_Click" ID="btnUpload" Text="Upload" />
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("CategoryName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            
            <asp:TemplateField ShowHeader="False">
                <InsertItemTemplate>
                    <asp:LinkButton ID="LinkButton1" CssClass="btn btn-primary" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" CssClass="btn btn-info" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                </InsertItemTemplate>
               
            </asp:TemplateField>
            
        </Fields>
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" />
    </asp:DetailsView>
    <asp:SqlDataSource EnableViewState="true" ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:SharpMindsConnectionString %>" 
        InsertCommand="INSERT INTO [Category] ([CategoryName],[ImageId] ,[CreatedBy], [Updatedby]) VALUES ( @CategoryName,@ImageId,@CreatedBy, @Updatedby)"
         OldValuesParameterFormatString="original_{0}" 
        SelectCommand="SELECT * FROM [Category]" 
        >
    
        <InsertParameters>
            <asp:Parameter Name="CategoryName" Type="String" />
           <asp:Parameter Name="ImageId"  Type="Int32"/>
        </InsertParameters>
     
    </asp:SqlDataSource>
</asp:Content>
