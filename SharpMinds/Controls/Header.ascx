<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Header.ascx.cs" Inherits="SharpMinds.Controls.Header" %>
<header>
     <header>
        <nav class="navbar navbar-default">
            <div class="container">
                <div class="navbar-header">
                    <button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#example-navbar">
                        <span class="sr-only">Toggle Navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a href="#" class="navbar-brand">Brand</a>
                </div>

                <div id="example-navbar" class="collapse navbar-collapse navbar-right">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="#">Link 1</a></li>
                        <li><a href="#">Link 2</a></li>
                        <li><asp:LoginStatus  runat="server" ID="loginStatus"/></li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="jumbotron">

        </div>
    </header>
</header>