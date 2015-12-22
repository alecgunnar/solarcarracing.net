(function ($) {
    $.currentMemberMenu = function () {
        var config,
            methods,
            $trigger,
            $menu,
            voidClick;

        config = {
            identifiers: {
                trigger: '#currentMember-menu-trigger',
                menu:    '#currentMember-menu-menu'
            }
        };

        if (arguments.length)
            $.extend({}, config, arguments[0]);

        methods = {
            toggleMenu: function () {
                $trigger.toggleClass($trigger.data('triggered-classname'));
                $menu.toggle();
            },
            createListeners: function () {
                $trigger.on('click', function () {
                    voidClick = true;
                    methods.toggleMenu();
                });

                $(document).on('click', function () {
                    if ($menu.is(':visible') && !voidClick)
                        methods.toggleMenu();

                    voidClick = false;
                });
            },
            initialize: function () {
                $trigger = $(config.identifiers.trigger);
                $menu    = $(config.identifiers.menu);

                if ($trigger.length && $menu.length)
                    methods.createListeners();
            }
        };

        methods.initialize();
    };
})(jQuery);
