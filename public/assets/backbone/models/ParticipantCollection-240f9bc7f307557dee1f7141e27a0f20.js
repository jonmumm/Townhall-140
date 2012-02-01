((function(){var a=function(a,b){return function(){return a.apply(b,arguments)}};TownHall140.Collections.ParticipantCollection=Backbone.Collection.extend({initialize:function(){return $(document).bind("startShow",$.proxy(this.onStartShow,this)),$(document).bind("stopShow",$.proxy(this.onStopShow,this)),$(document).bind("joinShow",$.proxy(this.onJoinShow,this)),$(document).bind("enterShow",$.proxy(this.onEnterShow,this)),$(document).bind("leaveShow",$.proxy(this.onLeaveShow,this)),$(document).bind("remove",$.proxy(this.onRemove,this)),app.get("session").addEventListener("sessionConnected",$.proxy(this.onSessionConnect,this)),app.get("session").addEventListener("streamCreated",$.proxy(this.onStreamCreate,this)),app.get("session").addEventListener("streamDestroyed",$.proxy(this.onStreamDestroy,this))},model:TownHall140.Models.Participant,onStartShow:function(){return this.add(new TownHall140.Models.Participant({id:app.get("session").connection.data}))},onStopShow:function(){var b;return b=app.get("session"),this.each(a(function(a){return b.forceUnpublish(a.get("stream"))},this))},onJoinShow:function(){return app.get("role")!=="publisher"?$(document).trigger("loginRequired"):$(document).trigger("enterQuestion")},onEnterShow:function(){if(app.get("role")==="publisher")return this.add(new TownHall140.Models.Participant({id:app.get("session").connection.data}))},onLeaveShow:function(){var a;return a=this.get(app.get("session").connection.data),app.get("session").forceUnpublish(a.get("publisher"))},onSessionConnect:function(a){var b,c,d,e,f;e=a.streams,f=[];for(c=0,d=e.length;c<d;c++)b=e[c],f.push(this.addParticipant(b));return f},onStreamCreate:function(a){var b,c,d,e,f;e=a.streams,f=[];for(c=0,d=e.length;c<d;c++)b=e[c],f.push(this.addParticipant(b));return f},onStreamDestroy:function(a){var b;return b=this.get(a.streams[0].connection.data),this.remove(b)},onRemove:function(a,b){var c;return c=app.get("session"),c.forceUnpublish(b.get("stream"))},addParticipant:function(a){var b,c;if(a.connection.connectionId!==app.get("session").connection.connectionId)return b=app.get("events").get(a.connection.data),b!=null?c=b.get("state"):c="queue",this.add(new TownHall140.Models.Participant({id:a.connection.data,stream:a,state:c}))}})})).call(this)