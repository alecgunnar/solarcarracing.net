(function ($) {
    $.currentMemberMenu = function () {
        var config,
            methods,
            $trigger,
            $menu;

        config = {
            identifiers: {
                trigger: '#currentMember-menu-trigger',
                menu:    '#currentMember-menu-menu'
            }
        };

        if (arguments.length)
            $.extend({}, config, arguments[0]);

        methods = {
            createListeners: function () {
                $trigger.on('click', function () {
                    $trigger.toggleClass($trigger.data('triggered-classname'));
                    $menu.toggle();
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
