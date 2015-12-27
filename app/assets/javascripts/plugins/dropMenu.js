(function ($) {
    $.dropMenu = function () {
        var config,
            methods,
            voidClick;

        config = {
            triggeredClassName: 'active',
            trigger: {},
            menu: {}
        };

        if (arguments.length)
            config = $.extend({}, config, arguments[0]);

        methods = {
            toggleMenu: function () {
                config.trigger.toggleClass(config.triggeredClassName);
                config.menu.fadeToggle(200);
            },
            createListeners: function () {
                config.trigger.on('click', function () {
                    voidClick = true;
                    methods.toggleMenu();
                });

                $(document).on('click', function () {
                    if (config.menu.is(':visible') && !voidClick)
                        methods.toggleMenu();

                    voidClick = false;
                });
            }
        };

        if (config.trigger.length && config.menu.length)
            methods.createListeners();
    };
})(jQuery);
