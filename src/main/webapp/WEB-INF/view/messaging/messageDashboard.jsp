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
                <button class="uk-button uk-button-default" type="button" uk-toggle="target: #chat-offcanvas">Side Chat</button>
            </div>
        </div>
    </div>
</div>
<script>
    setInterval(function () {
       //$('#chatSearch').empty();
        updateConversation();
    }, 2000);
    jQuery(document).ready(updateConversation());
    function updateConversation(){
        $.ajax({
                url: 'getConversation',
                type: 'GET',
                dataType: 'json',
                contentType: 'application/json',
                success: function(result){
                    console.log(result);
                    var sessionUser = ${sessionScope.user.userID};
                    var text = "";
                    for(var key in result){

                        text +=  '<div id="chatSearch"><li>'+
                            '<div class="uk-card uk-card-default uk-width-1-3\@l" style="background: rgba(34,34,34,0.85);">' +
                            '<div class="uk-card-header">' +
                            '<div class="uk-grid-small uk-flex-middle" uk-grid>' +
                            '<div class="uk-width-auto">' +
                            '<img class="uk-border-rounded" width="40" height="40" src="">' +
                            '</div>' +
                            '<div class="uk-width-expand"> ';

                        if(sessionUser == result[key].user1Id ){
                            text += '<h4 class="uk-card-title uk-margin-remove-bottom uk-text-muted">' + result[key].user2Username + '</h4>'+
                                '<p class="uk-text-meta uk-margin-remove-top uk-text-muted">' + result[key].user2FirstName + ' ' + result[key].user2LastName +'</p>';
                        }
                        else{
                            text += '<h4 class="uk-card-title uk-margin-remove-bottom uk-text-muted">' + result[key].user1Username +'</h4>'+
                                '<p class="uk-text-meta uk-margin-remove-top uk-text-muted">'+ result[key].user1FirstName + ' ' + result[key].user1LastName +'</p>';
                        }
                        text +=  '</div>'+
                            '<div>'+
                            '<form>' +
                            '<button uk-icon="icon: comment" type="submit"></button>' +
                            '</form>'+
                            '</div>'+
                            '</div>'+
                            '</div>'+
                            '</div>'+
                            '</li> </div>';
                        $('#chatSearch').append(text);
                        text="";
                    }

                }
            }
        )
    }

    function getMessages(){

    }
</script>
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

<div id="chat-offcanvas" uk-offcanvas="flip: true" class="uk-background-muted">
    <div class="uk-offcanvas-bar">

        <ul class="uk-nav uk-nav-default">
            <li>
                <form class="uk-search uk-search-default">
                    <a href="" uk-search-icon></a>
                    <input class="uk-search-input uk-border-rounded" style="width:100%;" type="search" placeholder="Search Users">
                </form>
            <li class="uk-nav-divider"></li>
            </li>
            <div id="chatSearch">
            <li>
                <div class="uk-card uk-card-default uk-width-1-3\@l" style="background: rgba(34,34,34,0.85);">
                    <div class="uk-card-header">
                        <div class="uk-grid-small uk-flex-middle" uk-grid>
                            <div class="uk-width-auto">
                                <img class="uk-border-rounded" width="40" height="40" src="">
                            </div>
                            <div class="uk-width-expand">
                                <h4 class="uk-card-title uk-margin-remove-bottom uk-text-muted">Username</h4>
                                <p class="uk-text-meta uk-margin-remove-top uk-text-muted">First Last</p>
                            </div>
                            <div>
                                <form>
                                    <button uk-icon="icon: comment" type="submit"></button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </li>
            </div>
        </ul>
    </div>
</div>
</body>
