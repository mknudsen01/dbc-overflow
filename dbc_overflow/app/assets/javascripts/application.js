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

DBCOverFlow.Controller = function(opts) {
    this.view = opts.view;
};
DBCOverFlow.Controller.prototype = {
    votedAction: function(e, response) {
        var votecount = response.responseJSON.votecount;
        var target = e.target
        this.view.showVotes(target, votecount);
    }
};

DBCOverFlow.View = function() {}
DBCOverFlow.View.prototype = {
    showVotes: function(target, votecount) {
        $(target).parents('.votes').find('.vote-count').text(votecount);
    }
}


DBCOverFlow.Binder = function(opts) {
    this.controller = opts.controller;
};
DBCOverFlow.Binder.prototype = {
    bind: function() {
        this.bindUpVote();
        this.bindDownVote();
    },
    bindUpVote: function() {
        this.bindVoted('.upvote');
    },
    bindDownVote: function() {
        this.bindVoted('.downvote');
    },
    bindVoted: function(vote) {
        var self = this;
        $("body").on("ajax:complete", vote, function(e, response) {
            console.log('click')
            self.controller.votedAction(e, response);
        });
    }
};

$(document).ready(function() {
    DBCOverFlow.view = new DBCOverFlow.View();
    DBCOverFlow.controller = new DBCOverFlow.Controller({
        view: DBCOverFlow.view
    });
    DBCOverFlow.binder = new DBCOverFlow.Binder({
        controller: DBCOverFlow.controller
    }).bind()
});