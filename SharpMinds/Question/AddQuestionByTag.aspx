<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="AddQuestionByTag.aspx.cs" Inherits="SharpMinds.Question.AddQuestionByTag" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:DetailsView ID="DetailsView1" HeaderText="Create Question" runat="server" AutoGenerateRows="False" CellPadding="4" DataKeyNames="QuestionId" ForeColor="#333333" GridLines="None" Height="50px" Width="587px" DefaultMode="Insert" AutoGenerateInsertButton="True" OnItemInserting="DetailsView1_ItemInserting" DataSourceID="SqlDataSource1">
        <AlternatingRowStyle BackColor="White" />
        <CommandRowStyle BackColor="#C5BBAF" Font-Bold="True" />
        <EditRowStyle BackColor="#7C6F57" />
        <FieldHeaderStyle BackColor="#D0D0D0" Font-Bold="True" />
        <Fields>
            <asp:BoundField DataField="QuestionId" HeaderText="QuestionId" InsertVisible="False" ReadOnly="True" SortExpression="QuestionId" />
            <asp:TemplateField HeaderText="Query" SortExpression="Query">
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox2" CssClass="form-control" TextMode="MultiLine" runat="server" Text='<%# Bind("Query") %>' Height="136px" Width="513px"></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Query") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

        </Fields>
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" />
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SharpMindsConnectionString %>" DeleteCommand="DELETE FROM [Question] WHERE [QuestionId] = @QuestionId" InsertCommand="INSERT INTO [Question] ([Query],[CreatedBy],[UpdatedBy], [TagId]) VALUES (@Query, @CreatedBy,@UpdatedBy,@TagId)" SelectCommand="SELECT [Query], [QuestionId], [TagId] FROM [Question] WHERE ([TagId] = @TagId)" UpdateCommand="UPDATE [Question] SET [Query] = @Query, [TagId] = @TagId WHERE [QuestionId] = @QuestionId">
        <DeleteParameters>
            <asp:Parameter Name="QuestionId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Query" Type="String" />
            <asp:Parameter Name="CreatedBy" />
            <asp:Parameter Name="UpdatedBy" />
            <asp:QueryStringParameter DefaultValue="0" Name="TagId" QueryStringField="tagId" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="0" Name="TagId" QueryStringField="tagId" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Query" Type="String" />
            <asp:Parameter Name="TagId" Type="Int32" />
            <asp:Parameter Name="QuestionId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
