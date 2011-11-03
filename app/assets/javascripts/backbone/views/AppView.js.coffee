Showjo.Views.AppView = Backbone.View.extend
  template: JST["backbone/templates/app"]

  render: ->
    @el.html @template

    panelView = new Showjo.Views.PanelView
      el: $(".panel", @el)
    panelView.render()

    stageView = new Showjo.Views.StageView
      el: $(".stage", @el)
      collection: app.get('participants')
