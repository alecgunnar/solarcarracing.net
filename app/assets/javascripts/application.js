//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

function whenReady () {
    $.currentMemberMenu();
}

$(document).ready(whenReady);
$(document).on('page:load', whenReady);
