var Binder = function(opts) {
    this.controller = opts.controller;
};
Binder.prototype = {
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
            self.controller.votedAction(e, response);
        });
    }
};