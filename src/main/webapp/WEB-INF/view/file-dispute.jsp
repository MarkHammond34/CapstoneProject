<%@include file="jspf/header.jsp" %>
<body>

<%@include file="jspf/navbar.jspf" %>
<%@include file="jspf/footer.jspf" %>

<div>

    <div class="uk-section">
        <div class="uk-grid-medium" ukgrid>
            <div class="uk-width-1-2 uk-align-center">

                <%@include file="jspf/messages.jsp" %>

                <h1 class="uk-heading-bullet">File A Dispute</h1>
                <p>Explain how it works</p>
                <hr>
                <form action="/dispute" method="post">
                    <span class="uk-badge uk-float-right" id="remainingCharacters">Remaining Characters: 1000</span>
                    <textarea class="uk-textarea" placeholder="Enter Complaint" name="complaint" id="" cols="30"
                              rows="10" maxlength="1000"></textarea>
                    <br>
                    <br>
                    <button type="submit" class="uk-button-primary uk-button-large">Submit</button>
                </form>
            </div>
        </div>
    </div>
</div>
<script>
    $('textarea').keypress(function () {
        if (this.value.length > 999) {
            $('#remainingCharacters').textContent = "Remaining Characters: 0";
        } else {
            document.getElementById("remainingCharacters").textContent = "Remaining Characters: " + (999 - this.value.length);
        }
    })
</script>
</body>
</html>