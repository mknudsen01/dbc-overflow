var View = function() {};
View.prototype = {
    showVotes: function(target, votecount) {
        $(target).parents('.votes').find('.vote-count').text(votecount);
    }
};