<%@include file="jspf/header.jsp" %>

<body class="uk-background-muted uk-height-viewport">

<%@include file="jspf/navbar.jspf" %>

<%@include file="jspf/messages.jsp" %>

<div class="uk-grid uk-margin-large-bottom" uk-grid>
    <div class="uk-width-2-5@m uk-width-3-4@s uk-align-center">
        <div class="uk-card uk-card-default uk-card-body uk-margin-large uk-padding-large">
            <h3>Login</h3>
            <form action="loginUser"
                  method="post">
                <div class="uk-width-1-1 uk-margin-small">
                    <label class="uk-form-label">Email</label>
                    <input class="uk-input" type="text" name="email"
                           value="${email}" placeholder="Email">
                </div>
                <div class="uk-width-1-1 uk-margin-small">
                    <label class="uk-form-label">Password</label>
                    <input class="uk-input" type="password" name="password"
                           placeholder="Password">

                </div>
                <div class="uk-width-1-1 uk-margin-small">
                    <button type="submit" class="uk-button uk-button-primary uk-border-rounded uk-float-right">Login
                    </button>
                    <br>
                    <br>
                    <span>
                        <a href="${pageContext.request.contextPath}/resetPage" class="uk-link-text uk-float-left">Forgot
                            Password</a>
                        <a href="${pageContext.request.contextPath}/unlock"
                           class="uk-link-text uk-float-right">Unlock</a>
                    </span>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
<%@include file="jspf/footer.jspf" %>
</html>
