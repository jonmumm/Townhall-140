$(document).ready ->
  window.app = new Gov140.Models.App app_config
  app.setup()

  view = new Gov140.Views.AppView
    model: app
    el: $(".app")

  view.render()
  app.start()
