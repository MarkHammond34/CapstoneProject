<%@ page import="java.util.ArrayList" %>
<c:if test="${not empty successMessages}">
    <%
        String message = "";
        ArrayList<String> successes = (ArrayList<String>) request.getAttribute("successMessages");
        for (String s : successes) {
            message += s + "\n";
    %>
    <div class="uk-alert-success" style="text-align: center" uk-alert>
        <a class="uk-alert-close" uk-close></a>
        <p><%=message%>
        </p>
    </div>
    <% }
        successes.clear();
    %>
</c:if>
<c:if test="${not empty warningMessages}">
    <%
        String message = "";
        ArrayList<String> warnings = (ArrayList<String>) request.getAttribute("warningMessages");
        for (String w : warnings) {
            message += w + "\n";
    %>
    <div class="uk-alert-warning" style="text-align: center" uk-alert>
        <a class="uk-alert-close" uk-close></a>
        <p><%=message%>
        </p>
    </div>
    <% }
        warnings.clear();
    %>
</c:if>
<c:if test="${not empty errorMessages}">
    <%
        String message = "";
        ArrayList<String> errors = (ArrayList<String>) request.getAttribute("errorMessages");
        for (String e : errors) {
            message += e + "\n";
    %>
    <div class="uk-alert-danger" style="text-align: center" uk-alert>
        <a class="uk-alert-close" uk-close></a>
        <p><%=message%>
        </p>
    </div>
    <% }
        errors.clear();
    %>
</c:if>