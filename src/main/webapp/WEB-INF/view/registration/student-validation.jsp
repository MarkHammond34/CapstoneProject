<%@ include file="../jspf/header.jsp" %>

<body>
<%@include file="../jspf/navbar.jspf" %>
<div class="row">
    <div
            class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">

        <%@ include file="../jspf/messages.jsp" %>

        <form role="form" data-toggle="validator"
              method="get" action="validate">
            <h2>Student Validation</h2>
            <hr class="colorgraph">
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12">
                    <div class="form-group">
                        <div class="input-group" data-validate="code" data-length="8">
                            <input type="number" name="userCode" id="userCode"
                                   class="form-control input-lg" placeholder="Enter Your Code"
                                   tabindex="1" data-minlength="6" data-minlength="6" required>
                            <span class="input-group-addon danger"><span
                                    class="glyphicon glyphicon-remove"></span></span>
                        </div>
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
            } else if ($group.data('validate') == "length") {
                state = $(this).val().length >= $group.data('length') ? true : false;
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
<%@include file="../jspf/footer.jspf" %>
</html>