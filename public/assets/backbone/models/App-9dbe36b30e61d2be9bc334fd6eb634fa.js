((function(){TownHall140.Models.App=Backbone.Model.extend({setup:function(){return this.set({participants:new TownHall140.Collections.ParticipantCollection,events:new TownHall140.Collections.EventManager})},start:function(){return this.get("session").connect(this.get("opentok_api_key"),this.get("opentok_token"))}})})).call(this)