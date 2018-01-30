<%@ page import="java.util.ArrayList" %>
<c:if test="${not empty successMessages}">
    <div class="alert alert-success panel-body" style="margin-top: 5%;">
        <a class="close" data-dismiss="alert" href="#">x</a>
        <div style="text-align: center;">
            <h3>Success</h3>
        </div>
        <ul style="list-style: none;">
            <%
                ArrayList<String> successes = (ArrayList<String>) request.getAttribute("successMessages");
                for (String s : successes) {
            %>
            <li><h4><%=s%>
            </h4></li>
            <% }
                successes.clear();
            %>
        </ul>
    </div>
</c:if>
<c:if test="${not empty warningMessages}">
    <div class="alert alert-warning panel-body" style="margin-top: 5%;>
        <a class=">
        <a class="close" data-dismiss="alert" href="#">x</a>
        <div style="text-align: center;">
            <h3>Warning</h3>
        </div>
        <ul style="list-style: none;">
            <%
                ArrayList<String> warnings = (ArrayList<String>) request.getAttribute("warningMessages");
                for (String w : warnings) {
            %>
            <li><h4><%=w%>
            </h4></li>
            <% }
                warnings.clear();
            %>
        </ul>
    </div>
</c:if>
<c:if test="${not empty errorMessages}">
    <div class="alert alert-danger panel-body" style="margin-top: 5%;>
        <a class=">
        <a class="close" data-dismiss="alert" href="#">x</a>
        <div style="text-align: center;">
            <h3>Error</h3>
        </div>
        <ul style="list-style: none;">
            <%
                ArrayList<String> errors = (ArrayList<String>) request.getAttribute("errorMessages");
                for (String e : errors) {
            %>
            <li><h4><%=e%>
            </h4></li>
            <% }
                errors.clear();
            %>
        </ul>
    </div>
</c:if>