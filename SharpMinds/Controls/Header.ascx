<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Header.ascx.cs" Inherits="SharpMinds.Controls.Header" %>
<header class="row">
    <div class="col-md-4">
    <h2>
        This is header
    </h2>
    </div>
    <div class="col-md-4"></div>
    <div class="col-md-4">
        <asp:LoginStatus  runat="server" ID="loginStatus"/>
    </div>
    
</header>