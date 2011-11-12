Gov140.Views.AppView = Backbone.View.extend
  template: JST["backbone/templates/app"]

  render: ->
    @el.html @template

    panelView = new Gov140.Views.PanelView
      el: $(".panel", @el)
    panelView.render()

    stageView = new Gov140.Views.StageView
      el: $(".stage", @el)
      collection: app.get('participants')
