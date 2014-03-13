# Dbc Overflow
##Learning Competencies

##Summary

 Let's get our feet wet building a substantial Rails application from the ground up: a [StackOverflow](stackoverflow.com) clone.  The goal is to focus on building a well-structured Rails application with a good mixture of front-end and back-end features.

Use the "DBC Rails stack": enable rspec, shoulda, and factory_girl, but disable coffeescript and Sass. Remember, to create a new Rails application without the default testing framework run:

```text
$ rails new dbc_overflow -T
```

## Strategy

Before you dive to deeply into the code, be clear with your team on three things things:

1. Decide on your MVP
2. Break your MVP down into deliverable features

## Objectives

These instructions are left deliberately ambiguous, both to give you flexibility in your implementation and because clarifying ambiguous requirements is at least 30% of an engineer's job.  At.  Least.

Users should be able to post questions.  Other users should be able to answer them.  Users should be able to respond to both answers and questions.  Like StackOverflow, the responses should just be a flat list.

The person who posted a question can declare one of the user-submitted answers "the best."

Users should be able to vote on questions, answers, and responses (both upvotes and downvotes).

Users cannot add a question, answer, or vote unless they're logged in, but they can view all of the above when logged out.

Users should be able to see questions sorted three ways: highest-voted, most recent, and "trending."

Responses should be sorted chronologically, with oldest first.  Answers should be sorted by "the best" first, followed by most highly-voted.

### Testing

Your app must be fully tested.  If you want to stretch yourself by TDDing your way, go for it, but timebox yourself. The goal of this is to actually build a functional and well tested app.

### Polymorphic Associations

Because there are multiple "votable" models &mdash; questions, answers, and responses &mdash; we have the opportunity to use [polymorphic associations](http://guides.rubyonrails.org/association_basics.html#polymorphic-associations).  Instead of having three vote-related tables like `answer_votes`, `question_votes`, etc. polymorphic associations enable you to have a single `votes` table with a `type` column that indicates what kind of thing was voted on.

Likewise, a `Response` can belong to either an `Answer` or a `Question`.

That is, instead of the "type" being encoded in the table name, it's encoded as a field in the table.
