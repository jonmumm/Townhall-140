Showjo.Views.PanelView = Backbone.View.extend
  template: JST["backbone/templates/panel"]

  render: ->
    @el.html @template
