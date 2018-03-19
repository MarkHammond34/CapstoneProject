<%@include file="../jspf/header.jsp" %>

<body class="uk-background-muted">

<%@include file="../jspf/navbar.jspf" %>

<%@include file="../jspf/messages.jsp" %>

<div class="uk-container">
    <div class="uk-grid-large" uk-grid>

        <div id="qrcode" class="uk-width-1-2 uk-align-center">
            <table style="width: 256px; height: 256px; border: 0px; border-collapse: collapse; background-color: rgb(255, 255, 255);"></table>
        </div>

        <form action="/seller-pick-up-finish" method="post">
            <input type="hidden" value="${pickUp.pickUpID}" name="pickUpID">
            <button class="uk-button-large uk-button-primary uk-border-rounded" type="submit">Finish</button>
        </form>

    </div>
</div>

<script type="text/javascript" src="../assets/js/jquery.qrcode.js"></script>

<script type="text/javascript" src="../assets/js/qrcode.js"></script>

<script>
    jQuery('#qrcode').qrcode({
        render: "table",
        text: "${qrCodeKey.key}"
    });
</script>
</body>
</html>