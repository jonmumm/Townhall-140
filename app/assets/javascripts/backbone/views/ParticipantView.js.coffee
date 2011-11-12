Gov140.Views.ParticipantView = Backbone.View.extend
  template: JST["backbone/templates/participant"]

  render: ->
    @el.html @template

    if @model.get('stream')
      app.get('session').subscribe @model.get('stream'), "videoContainer"
    else
      app.get('session').publish "videoContainer"
