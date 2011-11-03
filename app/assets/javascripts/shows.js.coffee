$(document).ready ->
  view = new Showjo.Views.AppView
    model: app
    el: $(".app")

  view.render()
  app.start()
