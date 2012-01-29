TownHall140.Views.PanelView = Backbone.View.extend
  initialize: ->
    app.get('session').addEventListener 'sessionConnected', @onSessionConnect
    $(document).bind 'joinCancelled', @onJoinCancel

  template: JST["backbone/templates/panel"]

  render: ->
    @el.html @template

  onSessionConnect: ->
    $(".startShowBtn").removeAttr 'disabled'
    $(".joinShowBtn").removeAttr 'disabled'

  events:
    "click .startShowBtn": "onStartShowClick"
    "click .stopShowBtn": "onStopShowClick"
    "click .joinShowBtn": "onJoinShowClick"
    "click .leaveShowBtn": "onLeaveShowClick"

  onStartShowClick: ->
    $(document).trigger 'startShow'
    $(".startShowBtn").attr 'disabled', 'disabled'
    $(".stopShowBtn").removeAttr 'disabled'

  onStopShowClick: ->
    $(document).trigger 'stopShow'
    $(".stopShowBtn").attr 'disabled', 'disabled'

  onJoinShowClick: ->
    $(document).trigger 'joinShow'
    $(".joinShowBtn").attr 'disabled', 'disabled'
    $(".leaveShowBtn").removeAttr 'disabled'

  onLeaveShowClick: ->
    $(document).trigger 'leaveShow'
    $(".leaveShowBtn").attr 'disabled', 'disabled'

  onJoinCancel: ->
    $(".joinShowBtn").removeAttr 'disabled'
    $(".leaveShowBtn").attr 'disabled', 'disabled'
