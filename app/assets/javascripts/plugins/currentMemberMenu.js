(function ($) {
    $.currentMemberMenu = function (options) {
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

        $.extend({}, config, options);

        methods = {
            createListeners: function () {
                $trigger.on('click', function (e) {
                    e.stopPropagation();
                    $menu.toggle();
                });

                $(document).on('click', function () {
                    $menu.hide();
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
