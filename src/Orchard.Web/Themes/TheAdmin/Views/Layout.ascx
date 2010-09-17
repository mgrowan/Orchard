﻿<%@ Control Language="C#" Inherits="Orchard.Mvc.ViewUserControl" %>
<%@ Import Namespace="Orchard.Security" %>
<%@ Import Namespace="Orchard.DisplayManagement.Descriptors" %>
<%@ Import Namespace="Orchard.UI.Resources" %>
<%@ Import Namespace="Orchard" %>
<%@ Import Namespace="Orchard.ContentManagement" %>
<%
Style.Require("TheAdmin");
Script.Require("TheAdmin");
RegisterLink(new LinkEntry { Condition = "lte IE 8", Rel = "stylesheet", Type = "text/css", Href = ResolveUrl("../Styles/ie.css") }.AddAttribute("media", "screen, projection"));
RegisterLink(new LinkEntry { Condition = "lte IE 6", Rel = "stylesheet", Type = "text/css", Href = ResolveUrl("../Styles/ie6.css") }.AddAttribute("media", "screen, projection"));
    // these are just hacked together to fire existing partials... can change
    Model.Header.Add(Display.Header());

    // <experimentation>
    var thisUser = Html.Resolve<IAuthenticationService>().GetAuthenticatedUser();
    Model.Header.Add(Display.User(CurrentUser: thisUser), "after");
    
    // </experimentation>
    

    // these are just hacked together to fire existing partials... can change

    //Model.Zones.AddRenderPartial("header", "Header", Model);
    //Model.Zones.AddRenderPartial("header:after", "User", Model); // todo: (heskew) should be a user display or widget
%>
<div id="header" role="banner">
    <%: Display(Model.Header) %></div>
<div id="content">
    <div id="navshortcut">
        <a href="#Menu-admin">
            <%: T("Skip to navigation") %></a></div>
    <div id="messages">
        <%: Display(Model.Messages) %>
    </div>
    <div id="main" role="main">
        <%: Display(Model.Content) %></div>
    <div id="menu">
        <%: Display(Model.Navigation) %></div>
</div>
<div id="footer" role="contentinfo">
    <%: Display(Model.Footer) %></div>

<%: Display.DumpShapeTable() %>
