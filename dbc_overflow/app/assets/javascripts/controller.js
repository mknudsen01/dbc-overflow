var Controller = function(opts) {
    this.view = opts.view;
};
Controller.prototype = {
    votedAction: function(e, response) {
        var votecount = response.responseJSON.votecount;
        var target = e.target;
        this.view.showVotes(target, votecount);
    }
};