TownHall140.Collections.QuestionCollection = Backbone.Collection.extend
  model: TownHall140.Models.Question
  initialize: ->
    @fetch 

