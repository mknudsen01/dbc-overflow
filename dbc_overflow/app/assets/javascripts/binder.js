var Binder = function(opts) {
    this.controller = opts.controller;
};
Binder.prototype = {
    bind: function() {
        this.bindUpVote();
        this.bindDownVote();
        this.bindNewAnswer();
    },
    // Votes
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
    },
    // Answers
    bindNewAnswer: function() {
        var self = this;
        $("body").on("ajax:complete", '.new_answer', function(e, response) {
            self.controller.newAnswerAction(e, response);
        });
    }
};