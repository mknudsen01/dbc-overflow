// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
DBCOverFlow = {};

var assets = {
    newAnswerButton: '<div class="new_answer_button"><a href="/questions/7/answers/new" data-remote="true">Submit a new answer!</a></div>'
}


$(document).ready(function() {
    DBCOverFlow.view = new View();
    DBCOverFlow.controller = new Controller({
        view: DBCOverFlow.view,
        assets: assets
    });
    DBCOverFlow.binder = new Binder({
        controller: DBCOverFlow.controller
    }).bind();
});