<%@ page import="edu.ben.model.Notification" %>
<%@include file="jspf/header.jsp" %>
<body>

<%@include file="jspf/navbar.jspf" %>

<%@include file="jspf/messages.jsp" %>

<div style="margin-top: 50px;">

    <div class="uk-grid-large" uk-grid>
        <div class="uk-width-3-4 uk-align-center">
            <h2 class="uk-heading-primary uk-margin-left">Notifications</h2>

            <ul class="uk-list uk-list-striped" uk-grid>
                <% int pageCount = (int) request.getAttribute("pageCount");
                    for (int i = 0; i < pageCount; i++) {
                        ArrayList<Notification> currentPage = (ArrayList<Notification>) request.getAttribute("page" + i + 1);
                        for (Notification n : currentPage) {
                %>
                <li class="uk-width-1-1" style="border-radius: 5px; margin-left: 5%"><%=n.getMessage()%>

                    <a
                        href="" class="uk-float-right" title="Delete" style="color: red"
                        id="notif<%=n.getNotificationID()%>"
                        uk-icon="icon: trash"></a>
                </li>
                <%
                        }
                    }
                %>
            </ul>
        </div>
    </div>
</div>
</div>

<%@include file="jspf/footer.jspf" %>
</body>
</html>