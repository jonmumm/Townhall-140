TownHall140.Views.LoginModalView = Backbone.View.extend
  initialize: ->
    $(document).bind 'loginRequired', $.proxy @onLoginRequire, @
    @el.bind 'hide', @onModalHide

  onLoginRequire: ->
    @render()

  onModalHide: ->
    $(document).trigger 'joinCancelled'

  render: ->
    @el.modal
      backdrop: true
      show: true
