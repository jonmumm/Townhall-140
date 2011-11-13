TownHall140.Views.AppView = Backbone.View.extend
  template: JST["backbone/templates/app"]

  render: ->
    connectView = new TownHall140.Views.ConnectModalView
    connectView.render()

    panelView = new TownHall140.Views.PanelView
      el: $(".panel")
    panelView.render()

    stageView = new TownHall140.Views.StageView
      el: $(".stage")
      collection: app.get('participants')
