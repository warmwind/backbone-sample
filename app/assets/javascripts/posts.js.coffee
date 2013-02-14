# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  window.Post = Backbone.Model.extend
    defaults:
      title: "new post"
      content: "this is a post"
      comment: ""
#      ts: new Date().getTime()
    initialize: ->
      this.set("timestamp", new Date().getTime())

    validate: (attrs) ->
      return "title cannot be empty" if $.trim(attrs.title) ==""

  window.Posts = Backbone.Collection.extend
    model: Post

  window.NewPostView = Backbone.View.extend
    template: _.template """
<div class="new_post">
  <div class='field'>
    <label for='title_<%= timestamp%>'>title</label><br />
    <input id='title_<%= timestamp%>' type='text' value='<%= title %>'/>
  </div>
  <div class='field'>
    <label for='content_<%= timestamp%>'>content</label><br />
    <textarea  id="content_<%= timestamp%>" cols="30" rows="10"><%= content %></textarea>
  </div>
  <div class='field'>
    <label for='comment_<%= timestamp%>'>comment</label><br />
    <textarea id="comment_<%= timestamp%>" cols="30" rows="10"><%= comment %></textarea>
  </div>
</div>
                         """
    render: ->
      this.$el.append this.template this.model.attributes
      return this

  $("#add_one").on 'click', ->
    new NewPostView({model: new Post(), el: "#new_area"}).render()