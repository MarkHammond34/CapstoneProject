<%--
  Created by IntelliJ IDEA.
  User: saran
  Date: 2/6/18
  Time: 9:22 AM
  To change this template use File | Settings | File Templates.
--%>
<%@include file="../jspf/header.jsp" %>
<%@include file="../jspf/navbar.jspf" %>
<%@ page import="edu.ben.model.Conversation" %>
<%@ page import="java.util.List" %>
<body>
<div class="uk-section uk-section-muted">
    <div class="uk-container">
        <h1>Chat</h1>
        <div class="uk-grid uk-child-width-1-2\@l uk-position-center uk-card">
            <div class="uk-panel uk-panel-scrollable uk-overflow-auto ">
            <div class="uk-description-list uk-description-list-divider">
                <dt>Description term</dt>
                <dd>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</dd>
                <dt>Description term</dt>
                <dd>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</dd>
                <dt>Description term</dt>
                <dd>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</dd>
            </div>
            </div>
            </br>
            <form>
                <input class="uk-input uk-form-width-large" type="text" placeholder="Large">
                <button class="uk-button uk-button-primary" type="submit">Send</button>
            </form>
        </div>
    </div>
</div>
</body>
