jQuery ->
  window.app = new TownHall140.Models.App app_config
  app.setup()

  view = new TownHall140.Views.AppView
    model: app
    el: $(".app")

  view.render()
  app.start()

