<%@ include file="../header.jsp" %>

<body>
<div class="row">
    <div
            class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">

        <%@ include file="../messages.jsp" %>

        <form role="form" data-toggle="validator"
              method="post" action="validate">
            <h2>Student Validation</h2>
            <hr class="colorgraph">
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12">
                    <div class="form-group">
                        <input type="number" name="userCode" path="email" id="userCode"
                               class="form-control input-lg" placeholder="Enter Your Code"
                               tabindex="1" data-minlength="6" data-minlength="6" required>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-12 col-sm-6 col-md-6">
                    <div class="form-group"></div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-6">
                    <div class="form-group"></div>
                </div>
            </div>
            <hr class="colorgraph">
            <div class="row">
                <div class="col-xs-12 col-md-12">
                    <button class="btn btn-success btn-block btn-lg">Validate</button>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>