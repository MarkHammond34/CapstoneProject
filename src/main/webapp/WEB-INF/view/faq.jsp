<%@include file="jspf/header.jsp" %>
<body>

<%@include file="jspf/navbar.jspf" %>

<%@include file="jspf/messages.jsp" %>

<div class="uk-grid-large" style="margin-top: 40px;" uk-grid>
    <div class="uk-width-3-4 uk-align-center">
        <h2 class="uk-heading-bullet">Frequently Asked Questions</h2>
        <hr>
        <ul uk-accordion="multiple: true" class="uk-grid-large" uk-grid>
            <c:forEach var="faq" items="${faqs}">
                <li class="uk-width-3-4 uk-align-center">
                    <a class="uk-accordion-title" href="#"
                       style="background-color: #ff695c; border-radius: 5px; color: white">Q: ${faq.question}</a>
                    <div class="uk-accordion-content" style="text: white">
                        <h4>A: ${faq.answer}</h4>
                    </div>
                </li>
            </c:forEach>
        </ul>
    </div>
</div>
<%@include file="jspf/footer.jspf" %>
</body>
</html>
