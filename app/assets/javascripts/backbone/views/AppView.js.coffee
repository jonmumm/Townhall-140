TownHall140.Views.AppView = Backbone.View.extend
  template: JST["backbone/templates/app"]

  render: ->
    connectView = new TownHall140.Views.ConnectModalView
    connectView.render()
    loginView = new TownHall140.Views.LoginModalView
      el: $("#loginModal")

    questionView = new TownHall140.Views.QuestionModalView
      el: $("#questionModal")

    chatVIew = new TownHall140.Views.ChatView
      el: $(".chat")

    panelView = new TownHall140.Views.PanelView
      el: $(".panel")
    panelView.render()

    stageView = new TownHall140.Views.StageView
      el: $(".stage")
      collection: app.get('participants')
