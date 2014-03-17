var Controller = function(opts) {
    this.view = opts.view;
    this.assets = opts.assets;
};
Controller.prototype = {
    votedAction: function(e, response) {
        var votecount = response.responseJSON.votecount;
        var target = e.target;
        this.view.showVotes(target, votecount);
    },
    newAnswerFormAction: function(e, response) {
        var object = response.responseText;
        var target = e.target;
        this.view.appendToQuestion(target, object);
    },
    newAnswerAction: function(e, response) {
        var button = assets.newAnswerButton;
        var answer = response.responseText;
        var target = e.target;
        this.view.appendToQuestion(target, button);
        this.view.appendAnswer(answer);
    }
};