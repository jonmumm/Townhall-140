TownHall140.Views.StageView = Backbone.View.extend
  initialize: ->
    @collection.bind 'add', $.proxy @onParticipantAdd, @
    @collection.bind 'remove', $.proxy @onParticipantRemove, @

  onParticipantAdd: (model) ->
    participantEl = $(@make "div", { id: model.get('id'), class: model.get('state') } )
    participantEl.appendTo @el

    participantView = new TownHall140.Views.ParticipantView
      el: participantEl
      model: model
    participantView.render()

  onParticipantRemove: (model) ->
    $("##{model.get('id')}").remove()
