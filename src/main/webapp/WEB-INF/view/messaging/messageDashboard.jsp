<%--
  Created by IntelliJ IDEA.
  User: saran
  Date: 2/4/18
  Time: 9:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@include file="../jspf/header.jsp" %>
<%@include file="../jspf/navbar.jspf" %>
<%@ page import="edu.ben.model.Conversation" %>
<%@ page import="edu.ben.model.User" %>
<%@ page import="java.util.List" %>
<body>
<div class="uk-section uk-section-muted">
    <div class="uk-container">
        <h1>Messages</h1>
        <div class="uk-grid uk-child-width-1-1\@m">
            <div>

            </div>
        </div>
    </div>
</div>
<hr class="uk-divider-icon">
<div class="uk-section uk-section-muted">
    <div class="uk-container">
        <div class="uk-child-width-expand@s" uk-grid>
            <div>
            <%
                List<Conversation> conversations = (List<Conversation>) session.getAttribute("userConversations");
                User usr = (User) session.getAttribute("user");
                if (conversations != null && !conversations.isEmpty()) {
                    for (int i = 0; i < conversations.size(); i++) {
            %>

                </html>
                <form method="post" action="viewConversation">
                    <div class="uk-card uk-card-default uk-card-body">
                        <span uk-icon="icon: user; ratio: 1.5"></span>
                        <%
                            if (conversations.get(i).getUser1().getUserID() == usr.getUserID()) {
                        %>
                        <span><%=conversations.get(i).getUser2().getUsername()%></span>
                        <button class="uk-button uk-button-default uk-position-right"
                                value="<%=conversations.get(i).getUser2().getSchoolEmail()%>" name="UserConversation"
                                type="submit">
                            Message
                        </button>
                        <%
                            }else if (conversations.get(i).getUser2().getUserID() == usr.getUserID()) {
                        %>
                        <span><%=conversations.get(i).getUser2().getUsername()%></span>
                        <button class="uk-button uk-button-default uk-position-right"
                                value="<%=conversations.get(i).getUser1().getSchoolEmail()%>" name="UserConversation"
                                type="submit">
                            Message
                        </button>
                        <%
                            }
                        %>
                    </div>
                </form>

            <%
                    }

                }
            %>
            </div>
            <div>
                <div class="uk-card uk-card-default uk-card-body">
                    <button class="uk-button uk-position-center"
                            href="${pageContext.request.contextPath}/generateConversation">
                        <span uk-icon="icon: plus-circle; ratio: 2" class="uk-position-center"></span>
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>

</body>