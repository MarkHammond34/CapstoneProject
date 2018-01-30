<%@ include file="../jspf/header.jsp"%>

<body>
<div class="row">
    <div
            class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">

        <%@ include file="../jspf/messages.jsp"%>

        <form role="form" data-toggle="validator" commandName="user"
              method="post" action="/admin-create">
            <h2>Admin Sign Up</h2>
            <hr class="colorgraph">
            <div class="row">
                <div class="col-xs-12 col-sm-6 col-md-6">
                    <div class="form-group">
                        <input type="text" name="firstName" path="firstName"
                               id="firstName" class="form-control input-lg"
                               placeholder="First Name" tabindex="1" data-minlength="2"
                               data-minlength="30" required>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-6">
                    <div class="form-group">
                        <input type="text" name="lastName" path="lastName" id="lastName"
                               class="form-control input-lg" placeholder="Last Name"
                               tabindex="2" data-minlength="2" data-minlength="30" required>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <input type="text" name="username" path="username" id="username"
                       class="form-control input-lg" placeholder="Username" tabindex="3"
                       required>
            </div>
            <div class="form-group">
                <input type="number" name="phoneNumber" path="phoneNumber"
                       id="phoneNumber" class="form-control input-lg"
                       placeholder="Phone Number" tabindex="3" required>
            </div>
            <div class="row">
                <div class="col-xs-12 col-sm-6 col-md-6">
                    <div class="form-group">
                        <input type="email" name="email" path="email" id="email"
                               class="form-control input-lg"
                               placeholder="Personal Email Address (Optional)" tabindex="4">
                    </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-6">
                    <div class="form-group">
                        <input type="email" name="benEmail" path="benEmail" id="benEmail"
                               class="form-control input-lg"
                               placeholder="Benedictine Email Address" tabindex="4" required>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-12 col-sm-6 col-md-6">
                    <div class="form-group">
                        <input type="password" name="password" path="password"
                               id="password" class="form-control input-lg"
                               placeholder="Password" tabindex="5" data-minlength="8" required>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-6">
                    <div class="form-group">
                        <input type="password" name="passwordConfirm"
                               id="passwordConfirm" class="form-control input-lg"
                               placeholder="Confirm Password" tabindex="6"
                               data-match="#password" data-match-error="Passwords Do Not Match" required>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12">
                    By clicking <strong class="label label-primary">Register</strong>,
                    you agree to the <a href="#" data-toggle="modal"
                                        data-target="#termsAndConditionsModal">Terms and Conditions</a>
                    set out by this site, including our Cookie Use.
                </div>
            </div>

            <hr class="colorgraph">
            <div class="row">
                <div class="col-xs-12 col-md-6">
                    <input type="submit" value="Register"
                           class="btn btn-primary btn-block btn-lg" tabindex="7">
                </div>
                <div class="col-xs-12 col-md-6">
                    <a href="login" class="btn btn-success btn-block btn-lg">Sign
                        In</a>
                </div>
            </div>
        </form>
    </div>
</div>
<%@ include file="../registration/terms-and-conditions.jsp"%>
</body>
</html>