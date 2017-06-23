     $( function() {
            var $signupForm = $( '#preinsc4Form' );
            
            $signupForm.validate({
                errorElement: 'div',
                submitHandler: function (form) { 
                    //alert('submitted');
                    form.submit();
                }
            });
            
            $signupForm.formToWizard({
                submitButton: 'preinscribirse',
                nextBtnClass: 'btn btn-primary next pull-right',
                prevBtnClass: 'btn btn-default prev',
                buttonTag:    'button',
                showProgress: true,
                nextBtnName: 'Siguiente >>',
                prevBtnName: '<< Volver',
                validateBeforeNext: function(form, step) {
                    var stepIsValid = true;
                    var validator = form.validate();
                    $(':input', step).each( function(index) {
                        var xy = validator.element(this);
                        stepIsValid = stepIsValid && (typeof xy == 'undefined' || xy);
                    });
                    return stepIsValid;
                },
                progress: function (i, count) {
                    $('#progress-complete').width(''+(i/count*100)+'%');
                }
            });
        });