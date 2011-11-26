((function(){window.TownHall140={Models:{},Collections:{},Routers:{},Views:{}}})).call(this),function(){this.JST||(this.JST={}),this.JST["backbone/templates/app"]=function(obj){var __p=[],print=function(){__p.push.apply(__p,arguments)};with(obj||{})__p.push("");return __p.join("")}}.call(this),function(){this.JST||(this.JST={}),this.JST["backbone/templates/connectmodal"]=function(obj){var __p=[],print=function(){__p.push.apply(__p,arguments)};with(obj||{})__p.push('<div class="modal-header">\n  <h3>Connecting...</h3>\n</div>\n<div class="modal-body">\n  <p>Sit tight while you connect to the town hall.</p>\n</div>\n');return __p.join("")}}.call(this),function(){this.JST||(this.JST={}),this.JST["backbone/templates/panel"]=function(obj){var __p=[],print=function(){__p.push.apply(__p,arguments)};with(obj||{})__p.push(""),app.get("is_moderator")?__p.push('\n  <button class="btnStd go startShowBtn" disabled="disabled">Start Event</button>\n  <button class="btnStd stop stopShowBtn" disabled="disabled">Stop Event</button>\n'):__p.push('\n  <button class="btnStd go joinShowBtn" disabled="disabled">Join Event</button>\n  <button class="btnStd stop leaveShowBtn" disabled="disabled">Leave Event</button>\n'),__p.push("\n");return __p.join("")}}.call(this),function(){this.JST||(this.JST={}),this.JST["backbone/templates/participant"]=function(obj){var __p=[],print=function(){__p.push.apply(__p,arguments)};with(obj||{})__p.push('<div class="participant">\n  <div class="participant-wrapper">\n    <h3>Press <strong>Allow</strong></h3>\n    <div class="video">\n      <div id="videoContainer"></div>\n    </div>\n    <div class="buttons">\n      <div class="buttons-wrapper">\n        <a href="javascript:void(0)" class="btnStd stop remove">Remove</a>\n        <a href="javascript:void(0)" class="btnStd go tostage">Move to Stage</a>\n        <a href="javascript:void(0)" class="btnStd go offstage">Move off Stage</a>\n      </div>\n    </div>\n  </div>\n</div>\n');return __p.join("")}}.call(this),function(){TownHall140.Models.App=Backbone.Model.extend({setup:function(){return this.set({participants:new TownHall140.Collections.ParticipantCollection,events:new TownHall140.Collections.EventManager})},start:function(){return this.get("session").connect(this.get("opentok_api_key"),this.get("opentok_token"))}})}.call(this),function(){TownHall140.Models.Event=Backbone.Model.extend({initialize:function(){return this.updateParticipant(),this.bind("change:state",this.onStateChange)},onStateChange:function(){return this.updateParticipant()},updateParticipant:function(){var a;a=app.get("participants").get(this.id);if(a!=null)return a.set({state:this.get("state")})}})}.call(this),function(){TownHall140.Collections.EventManager=Backbone.Collection.extend({initialize:function(){var a;a=app.get("show_id"),$(document).bind("toStage",$.proxy(this.onToStage,this)),$(document).bind("offStage",$.proxy(this.onOffStage,this)),$.getJSON("/event/current",{show_id:app.get("show_id")},$.proxy(this.onEventsInit,this)),app.get("pusher").subscribe(""+a).bind("state",$.proxy(this.onEventNew,this));if(app.get("is_moderator"))return app.get("session").addEventListener("streamCreated",$.proxy(this.onStreamCreate,this))},onEventsInit:function(a){var b,c,d,e;e=[];for(c=0,d=a.length;c<d;c++)b=a[c],e.push(this.processEvent(b));return e},onEventNew:function(a){return this.processEvent(a)},processEvent:function(a){return this.get(a.stream_id)?this.get(a.stream_id).set({state:a.state}):this.add(new TownHall140.Models.Event({id:a.stream_id,state:a.state}))},onToStage:function(a,b){return this.postEvent(b.id,"guest")},onOffStage:function(a,b){return this.postEvent(b.id,"queue")},onStreamCreate:function(a){var b,c;return c=a.streams[0],c.connection.connectionId===app.get("session").connection.connectionId?b="host":b="queue",this.postEvent(c.streamId,b)},postEvent:function(a,b){return $.ajax({type:"post",url:"/event",data:{show_id:app.get("show_id"),stream_id:a,state:b}})}})}.call(this),function(){TownHall140.Models.Participant=Backbone.Model.extend({initialize:function(){return app.get("session").addEventListener("streamCreated",$.proxy(this.onStreamCreate,this))},defaults:{id:"myPublisher",state:"publish"},onStreamCreate:function(a){var b,c;c=a.streams[0];if(this.id==="myPublisher"&&c.connection.connectionId===app.get("session").connection.connectionId)return app.get("is_moderator")?b="host":b="queue",this.set({id:c.streamId,stream:c,state:b})}})}.call(this),function(){TownHall140.Collections.ParticipantCollection=Backbone.Collection.extend({initialize:function(){return $(document).bind("startShow",$.proxy(this.onStartShow,this)),$(document).bind("stopShow",$.proxy(this.onStopShow,this)),$(document).bind("joinShow",$.proxy(this.onJoinShow,this)),$(document).bind("leaveShow",$.proxy(this.onLeaveShow,this)),$(document).bind("remove",$.proxy(this.onRemove,this)),app.get("session").addEventListener("sessionConnected",$.proxy(this.onSessionConnect,this)),app.get("session").addEventListener("streamCreated",$.proxy(this.onStreamCreate,this)),app.get("session").addEventListener("streamDestroyed",$.proxy(this.onStreamDestroy,this))},model:TownHall140.Models.Participant,onStartShow:function(){return this.add(new TownHall140.Models.Participant)},onStopShow:function(){},onJoinShow:function(){return this.add(new TownHall140.Models.Participant)},onLeaveShow:function(){},onSessionConnect:function(a){var b,c,d,e,f;e=a.streams,f=[];for(c=0,d=e.length;c<d;c++)b=e[c],f.push(this.addParticipant(b));return f},onStreamCreate:function(a){var b,c,d,e,f;e=a.streams,f=[];for(c=0,d=e.length;c<d;c++)b=e[c],f.push(this.addParticipant(b));return f},onStreamDestroy:function(a){var b;return b=this.get(a.streams[0].streamId),this.remove(b)},onRemove:function(a,b){var c;return c=app.get("session"),c.forceUnpublish(b.id)},addParticipant:function(a){var b,c;if(a.connection.connectionId!==app.get("session").connection.connectionId)return b=app.get("events").get(a.streamId),b!=null?c=b.get("state"):c="queue",this.add(new TownHall140.Models.Participant({id:a.streamId,stream:a,state:c}))}})}.call(this),function(){TownHall140.Views.AppView=Backbone.View.extend({template:JST["backbone/templates/app"],render:function(){var a,b,c;return a=new TownHall140.Views.ConnectModalView,a.render(),b=new TownHall140.Views.PanelView({el:$(".panel")}),b.render(),c=new TownHall140.Views.StageView({el:$(".stage"),collection:app.get("participants")})}})}.call(this),function(){TownHall140.Views.ConnectModalView=Backbone.View.extend({initialize:function(){return app.get("session").addEventListener("sessionConnected",$.proxy(this.onSessionConnect,this)),app.get("session").addEventListener("exception",$.proxy(this.onException,this))},template:JST["backbone/templates/connectmodal"],render:function(){return this.el=$(this.make("div",{id:"connectModal","class":"modal hide fade"})),this.el.html(this.template),this.el.appendTo("body"),this.el.modal({backdrop:!0,show:!0})},onSessionConnect:function(){return this.el.modal("hide")},onException:function(a){return $(".modal-header h3",this.el).text(a.title),$(".modal-body p",this.el).text(a.message)}})}.call(this),function(){TownHall140.Views.PanelView=Backbone.View.extend({initialize:function(){return app.get("session").addEventListener("sessionConnected",this.onSessionConnect)},template:JST["backbone/templates/panel"],render:function(){return this.el.html(this.template)},onSessionConnect:function(){return $(".startShowBtn").removeAttr("disabled"),$(".joinShowBtn").removeAttr("disabled")},events:{"click .startShowBtn":"onStartShowClick","click .stopShowBtn":"onStopShowClick","click .joinShowBtn":"onJoinShowClick","click .leaveShowBtn":"onLeaveShowClick"},onStartShowClick:function(){return $(document).trigger("startShow"),$(".startShowBtn").attr("disabled","disabled"),$(".stopShowBtn").removeAttr("disabled")},onStopShowClick:function(){return $(document).trigger("stopShow"),$(".stopShowBtn").attr("disabled","disabled")},onJoinShowClick:function(){return $(document).trigger("joinShow"),$(".joinShowBtn").attr("disabled","disabled"),$(".leaveShowBtn").removeAttr("disabled")},onLeaveShowClick:function(){return $(document).trigger("leaveShow"),$(".leaveShowBtn").attr("disabled","disabled")}})}.call(this),function(){TownHall140.Views.ParticipantView=Backbone.View.extend({initialize:function(){return this.model.bind("change:id",$.proxy(this.onIdChange,this)),this.model.bind("change:state",$.proxy(this.onStateChange,this))},template:JST["backbone/templates/participant"],events:{"click .remove":"onRemoveClick","click .tostage":"onToStageClick","click .offstage":"offStageClick"},onRemoveClick:function(){return $(document).trigger("remove",this.model)},onToStageClick:function(){return $(document).trigger("toStage",this.model)},offStageClick:function(){return $(document).trigger("offStage",this.model)},onIdChange:function(a){return this.el.attr("id",a.id)},onStateChange:function(a,b){return this.el.removeClass(),this.el.addClass(a.get("state")),this.setAudioSubscribe()},render:function(){var a;return this.el.html(this.template),this.model.get("stream")?(a=app.get("session").subscribe(this.model.get("stream"),"videoContainer"),this.model.set({subscriber:a}),this.setAudioSubscribe()):app.get("session").publish("videoContainer")},setAudioSubscribe:function(){var a;a=this.model.get("subscriber");if(a!=null)return this.model.get("state")==="guest"||this.model.get("state")==="host"?this.model.get("subscriber").subscribeToAudio(!0):this.model.get("subscriber").subscribeToAudio(!1)}})}.call(this),function(){TownHall140.Views.StageView=Backbone.View.extend({initialize:function(){return this.collection.bind("add",$.proxy(this.onParticipantAdd,this)),this.collection.bind("remove",$.proxy(this.onParticipantRemove,this))},onParticipantAdd:function(a){var b,c;return b=$(this.make("div",{id:a.get("id"),"class":a.get("state")})),b.appendTo(this.el),c=new TownHall140.Views.ParticipantView({el:b,model:a}),c.render()},onParticipantRemove:function(a){return $("#"+a.get("id")).remove()}})}.call(this),TownHall140.Views.TwitterStreamView=Backbone.View.extend({render:function(){(new TWTR.Widget({version:2,type:"search",search:"occupyharvard",interval:3e4,title:"occupyharvard",subject:"Chat with Admin_namawefwaf",width:250,height:300,theme:{shell:{background:"#8ec1da",color:"#ffffff"},tweets:{background:"#ffffff",color:"#444444",links:"#1985b5"}},features:{scrollbar:!1,loop:!0,live:!0,behavior:"default"}})).render().start()}})