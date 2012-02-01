TownHall140.Views.AppView = Backbone.View.extend
  template: JST["backbone/templates/app"]

  render: ->
    connectView = new TownHall140.Views.ConnectModalView
    connectView.render()
    loginView = new TownHall140.Views.LoginModalView
      el: $("#loginModal")

    questionModalView = new TownHall140.Views.QuestionModalView
      el: $("#questionModal")

    # TESTING TODO hook me up to a button!
    # questionModalView.render()

    questionsView = new TownHall140.Views.QuestionsView
      el: $("#questions"),
      collection: app.get('questions'),
      model: TownHall140.Models.Question
    questionsView.render()

    chatVIew = new TownHall140.Views.ChatView
      el: $(".chat")

    panelView = new TownHall140.Views.PanelView
      el: $(".panel")
    panelView.render()

    stageView = new TownHall140.Views.StageView
      el: $(".stage")
      collection: app.get('participants')
