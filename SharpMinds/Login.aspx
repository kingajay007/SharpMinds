<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SharpMinds.Login" %>

<%@ Register Src="~/Controls/LoginControl.ascx" TagPrefix="uc1" TagName="LoginControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    <uc1:LoginControl runat="server" ID="LoginControl" />
</asp:Content>
