TownHall140.Views.ConnectModalView = Backbone.View.extend
  initialize: ->
    app.get('session').addEventListener 'sessionConnected', $.proxy @onSessionConnect, @
    app.get('session').addEventListener 'exception', $.proxy @onException, @

  template: JST["backbone/templates/connectmodal"]

  render: ->
    @el = $(@make "div", { id: "connectModal", class: "modal hide fade" })
    @el.html @template
    @el.appendTo 'body'
    @el.modal
      backdrop: true
      show: true

  onSessionConnect: ->
    @el.modal 'hide'

  onException: (event) ->
    $(".modal-header h3", @el).text(event.title)
    $(".modal-body p", @el).text(event.message)
