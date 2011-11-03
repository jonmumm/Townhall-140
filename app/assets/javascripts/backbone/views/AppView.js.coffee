Showjo.Views.AppView = Backbone.View.extend
  template: JST["backbone/templates/app"]

  render: ->
    @el.html @template
