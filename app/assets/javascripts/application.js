//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).on('ready page:load', function () {
    $.dropMenu({
        trigger: $('#currentMember-menu-trigger'),
        menu:    $('#currentMember-menu-menu')
    });
});
