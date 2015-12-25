$(document).on('ready page:load', function () {
    $('.post__content__options').each(function () {
            var $this = $(this);

            $.dropMenu({
                trigger: $this,
                menu:    $this.find('.post__content__options__menu')
            });
    });
});
