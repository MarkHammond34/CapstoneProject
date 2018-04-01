<div class="uk-grid-medium" uk-grid>
    <div class="uk-width-1-2 uk-align-center" id="messageBox">
        <%@ page import="java.util.ArrayList" %>
        <c:if test="${not empty successMessages}">
            <%
                String successMessage = "";
                ArrayList<String> successes = (ArrayList<String>) request.getSession().getAttribute("successMessages");
                for (String s : successes) {
                    successMessage += s + "\n";
            %>
            <div class="uk-alert-success" style="text-align: center; margin-top: 40px;" uk-alert>
                <a class="uk-alert-close" uk-close></a>
                <p><%=successMessage%>
                </p>
            </div>
            <%
                }
                successes.clear();
            %>
        </c:if>
        <c:if test="${not empty warningMessages}">
            <%
                String warningMessage = "";
                ArrayList<String> warnings = (ArrayList<String>) request.getSession().getAttribute("warningMessages");
                for (String w : warnings) {
                    warningMessage += w + "\n";
            %>
            <div class="uk-alert-warning" style="text-align: center; margin-top: 40px;" uk-alert>
                <a class="uk-alert-close" uk-close></a>
                <p><%=warningMessage%>
                </p>
            </div>
            <%
                }
                warnings.clear();
            %>
        </c:if>
        <c:if test="${not empty errorMessages}">
            <%
                String errorMessage = "";
                ArrayList<String> errors = (ArrayList<String>) request.getSession().getAttribute("errorMessages");
                for (String e : errors) {
                    errorMessage += e + "\n";
            %>
            <div class="uk-alert-danger" style="text-align: center; margin-top: 40px;" uk-alert>
                <a class="uk-alert-close" uk-close></a>
                <p><%=errorMessage%>
                </p>
            </div>
            <%
                }
                errors.clear();
            %>
        </c:if>
    </div>
</div>
</div>