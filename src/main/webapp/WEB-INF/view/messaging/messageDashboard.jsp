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
            <%
                List<Conversation> conversations = (List<Conversation>) session.getAttribute("userConversations");
                for(int i = 0; i < conversations.size(); i++ ){
            %>
            <div>
                <form method="post" action="AdminUserLock">
                    <div class="uk-card uk-card-default uk-card-body">
                        <span uk-icon="icon: user; ratio: 1.5"></span>
                        <span><%=conversations.get(i).getUser2().getUsername()%></span>
                        <button class="uk-button uk-button-default uk-position-right" value="<%=conversations.get(i).getUser1().getSchoolEmail()%>" name="UserLock"
                                type="submit">
                            Message
                        </button>
                    </div>
                </form>
            </div>
            <%
                }
            %>
            <div>
                <div class="uk-card uk-card-default uk-card-body">
                    <a href="${pageContext.request.contextPath}/generateConversation"><button class="uk-button uk-position-center" value="" name="UserLock">
                        <span uk-icon="icon: plus-circle; ratio: 2" class="uk-position-center"></span>
                    </button></a>
                    <a><span uk-icon="icon: plus-circle; ratio: 2" class="uk-position-center"></span></a>
                    <p></p>
                    <p hidden>test</p>
                    <p hidden>test</p>
                </div>
            </div>
        </div>
    </div>
</div>

</body>