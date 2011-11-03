Showjo.Views.ParticipantView = Backbone.View.extend
  template: JST["backbone/templates/participant"]

  render: ->
    @el.html @template

    app.get('session').publish "videoContainer"
