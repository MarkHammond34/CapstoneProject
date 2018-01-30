<%@ include file="../jspf/header.jsp" %>

<body>
<div class="row">
    <div
            class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">

        <%@ include file="../jspf/messages.jsp" %>

        <form role="form" id="form" data-toggle="validator" commandName="user"
              method="post" action="create">
            <h2>Sign Up</h2>
            <hr class="colorgraph">
            <div class="row">
                <div class="col-xs-12 col-sm-6 col-md-6">
                    <div class="form-group">
                        <div class="input-group" data-validate="length" data-length="2">
                            <input type="text" name="firstName" path="firstName"
                                   id="firstName" class="form-control input-lg"
                                   placeholder="First Name" tabindex="1" data-minlength="2"
                                   data-minlength="30" required>
                            <span class="input-group-addon danger"><span
                                    class="glyphicon glyphicon-remove"></span></span>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-6">
                    <div class="form-group">
                        <div class="input-group" data-validate="length" data-length="2">
                            <input type="text" name="lastName" path="lastName" id="lastName"
                                   class="form-control input-lg" placeholder="Last Name"
                                   tabindex="2" data-minlength="2" data-minlength="30" required>
                            <span class="input-group-addon danger"><span
                                    class="glyphicon glyphicon-remove"></span></span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12">
                    <div class="form-group">
                        <div class="input-group" data-validate="length" data-length="8">
                            <input type="text" name="username" path="username" id="username"
                                   class="form-control input-lg" placeholder="Username" tabindex="3"
                                   required>
                            <span class="input-group-addon danger"><span
                                    class="glyphicon glyphicon-remove"></span></span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12">
                    <div class="form-group">
                        <div class="input-group" data-validate="phone">
                            <input type="tel" name="phoneNumber" id="phoneNumber" path="phoneNumber"
                                   class="form-control input-lg"
                                   placeholder="Phone Number" tabindex="3" min="9" required>
                            <span class="input-group-addon danger"><span
                                    class="glyphicon glyphicon-remove"></span></span>
                        </div>
                    </div>
                </div>
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
                        <div class="input-group" data-validate="email">
                            <input type="email" name="schoolEmail" path="schoolEmail" id="schoolEmail"
                                   class="form-control input-lg"
                                   placeholder="Benedictine Email Address" tabindex="4" required>
                            <span class="input-group-addon danger"><span
                                    class="glyphicon glyphicon-remove"></span></span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-12 col-sm-6 col-md-6">
                    <div class="form-group">
                        <div class="input-group" data-validate="length" data-length="6">
                            <input type="password" name="password" path="password"
                                   id="password" class="form-control input-lg"
                                   placeholder="Password" tabindex="5" data-minlength="8" required>
                            <span class="input-group-addon danger"><span
                                    class="glyphicon glyphicon-remove"></span></span>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-6">
                    <div class="form-group">
                        <div class="input-group" data-validate="password" data-length="6">
                            <input type="password" name="passwordConfirm"
                                   id="passwordConfirm" class="form-control input-lg"
                                   placeholder="Confirm Password" tabindex="6"
                                   data-match="#password" data-match-error="Passwords Do Not Match" required>
                            <span class="input-group-addon danger"><span
                                    class="glyphicon glyphicon-remove"></span></span>
                        </div>
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
                           class="btn btn-primary btn-block btn-lg" tabindex="7" disabled>
                </div>
                <div class="col-xs-12 col-md-6">
                    <a href="login" class="btn btn-success btn-block btn-lg">Sign
                        In</a>
                </div>
            </div>
        </form>
    </div>
</div>
<%@ include file="terms-and-conditions.jsp" %>

<script>
    $(document).ready(function () {
        $('.input-group input[required], .input-group textarea[required], .input-group select[required]').on('keyup change', function () {
            var $form = $(this).closest('form'),
                $group = $(this).closest('.input-group'),
                $addon = $group.find('.input-group-addon'),
                $icon = $addon.find('span'),
                state = false;

            if (!$group.data('validate')) {
                state = $(this).val() ? true : false;
            } else if ($group.data('validate') == "email") {
                state = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/.test($(this).val())
            } else if ($group.data('validate') == 'phone') {
                state = /^[(]{0,1}[0-9]{3}[)]{0,1}[-\s\.]{0,1}[0-9]{3}[-\s\.]{0,1}[0-9]{4}$/.test($(this).val())
            } else if ($group.data('validate') == "length") {
                state = $(this).val().length >= $group.data('length') ? true : false;
            } else if ($group.data('validate') == "number") {
                state = !isNaN(parseFloat($(this).val())) && isFinite($(this).val());
            } else if ($group.data('validate') == "password") {
                state = $('#password').val() == $('#passwordConfirm').val();
            }

            if (state) {
                $addon.removeClass('danger');
                $addon.addClass('success');
                $icon.attr('class', 'glyphicon glyphicon-ok');
            } else {
                $addon.removeClass('success');
                $addon.addClass('danger');
                $icon.attr('class', 'glyphicon glyphicon-remove');
            }

            if ($form.find('.input-group-addon.danger').length == 0) {
                $form.find('[type="submit"]').prop('disabled', false);
            } else {
                $form.find('[type="submit"]').prop('disabled', true);
            }
        });

        $('.input-group input[required], .input-group textarea[required], .input-group select[required]').trigger('change');


    });
</script>
</body>
</html>