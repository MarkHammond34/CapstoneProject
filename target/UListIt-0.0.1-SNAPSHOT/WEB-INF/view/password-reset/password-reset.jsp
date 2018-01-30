<%@ include file="../jspf/header.jsp" %>

<body>
<div class="row">
    <div
            class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">

        <%@ include file="../jspf/messages.jsp" %>

        <form role="form" data-toggle="validator" commandName="user"
              method="post" action="create">
            <h2>Reset Password</h2>
            <hr class="colorgraph">
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12">
                    <div class="form-group">
                        <input type="email" name="email" path="email" id="email"
                               class="form-control input-lg" placeholder="Email Address"
                               tabindex="1" data-minlength="2" data-minlength="30" required>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-12 col-sm-6 col-md-6">
                    <div class="form-group has-feedback">
                        <label class="input-group">
                            <span class="input-group-addon">
                                <input type="radio" name="emailType" id="personal" value="personal"/>
                            </span>
                            <div class="form-control form-control-static">
                                Personal Email Address
                            </div>
                            <span class="glyphicon form-control-feedback "></span>
                        </label>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-6">
                    <div class="form-group has-feedback">
                        <label class="input-group">
                            <span class="input-group-addon">
                                <input type="radio" name="emailType" id="school" value="school"/>
                            </span>
                            <div class="form-control form-control-static">
                                School Email Address
                            </div>
                            <span class="glyphicon form-control-feedback "></span>
                        </label>
                    </div>
                </div>
            </div>
            <hr class="colorgraph">
            <div class="row">
                <div class="col-xs-12 col-md-12">
                    <button class="btn btn-success btn-block btn-lg">Continue</button>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>