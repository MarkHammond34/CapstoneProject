<%@include file="jspf/header.jsp" %>
<body>

<%@include file="jspf/navbar.jspf" %>

<%@include file="jspf/messages.jsp" %>

<div class="uk-grid-large" style="margin-top: 40px;" uk-grid>
    <div class="uk-width-3-4 uk-align-center">
        <h2 class="uk-heading-bullet">Frequently Asked Questions</h2>
        <hr>
        <ul uk-accordion="multiple: true">
            <li class="uk-open">
                <a class="uk-accordion-title" href="#">Item 1</a>
                <div class="uk-accordion-content">
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
                        labore et dolore magna aliqua.</p>
                </div>
            </li>
            <li>
                <a class="uk-accordion-title" href="#">Item 2</a>
                <div class="uk-accordion-content">
                    <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
                        consequat. Duis aute irure dolor reprehenderit.</p>
                </div>
            </li>
            <li>
                <a class="uk-accordion-title" href="#">Item 3</a>
                <div class="uk-accordion-content">
                    <p>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
                        pariatur. Excepteur sint occaecat cupidatat proident.</p>
                </div>
            </li>
        </ul>
    </div>
</div>
<%@include file="jspf/footer.jspf" %>
</body>
</html>