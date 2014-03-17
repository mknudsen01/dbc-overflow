var View = function() {};
View.prototype = {
    showVotes: function(target, votecount) {
        $(target).parents('.votes').find('.vote-count').text(votecount);
    },
    appendToQuestion: function(target, object) {
        $(target).hide();
        $('.question').append(object);
    },
    appendAnswer: function(object) {
        $('.answers').append(object);
    }
};