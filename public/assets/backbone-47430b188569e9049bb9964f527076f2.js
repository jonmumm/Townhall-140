//     Backbone.js 0.5.3
//     (c) 2010 Jeremy Ashkenas, DocumentCloud Inc.
//     Backbone may be freely distributed under the MIT license.
//     For all details and documentation:
//     http://documentcloud.github.com/backbone
((function(){var a=this,b=a.Backbone,c;typeof exports!="undefined"?c=exports:c=a.Backbone={},c.VERSION="0.5.3";var d=a._;!d&&typeof require!="undefined"&&(d=require("underscore")._);var e=a.jQuery||a.Zepto||a.ender;c.noConflict=function(){return a.Backbone=b,this},c.emulateHTTP=!1,c.emulateJSON=!1,c.Events={bind:function(a,b,c){var d=this._callbacks||(this._callbacks={}),e=d[a]||(d[a]=[]);return e.push([b,c]),this},unbind:function(a,b){var c;if(!a)this._callbacks={};else if(c=this._callbacks)if(!b)c[a]=[];else{var d=c[a];if(!d)return this;for(var e=0,f=d.length;e<f;e++)if(d[e]&&b===d[e][0]){d[e]=null;break}}return this},trigger:function(a){var b,c,d,e,f,g=2;if(!(c=this._callbacks))return this;while(g--){d=g?a:"all";if(b=c[d])for(var h=0,i=b.length;h<i;h++)(e=b[h])?(f=g?Array.prototype.slice.call(arguments,1):arguments,e[0].apply(e[1]||this,f)):(b.splice(h,1),h--,i--)}return this}},c.Model=function(a,b){var c;a||(a={});if(c=this.defaults)d.isFunction(c)&&(c=c.call(this)),a=d.extend({},c,a);this.attributes={},this._escapedAttributes={},this.cid=d.uniqueId("c"),this.set(a,{silent:!0}),this._changed=!1,this._previousAttributes=d.clone(this.attributes),b&&b.collection&&(this.collection=b.collection),this.initialize(a,b)},d.extend(c.Model.prototype,c.Events,{_previousAttributes:null,_changed:!1,idAttribute:"id",initialize:function(){},toJSON:function(){return d.clone(this.attributes)},get:function(a){return this.attributes[a]},escape:function(a){var b;if(b=this._escapedAttributes[a])return b;var c=this.attributes[a];return this._escapedAttributes[a]=w(c==null?"":""+c)},has:function(a){return this.attributes[a]!=null},set:function(a,b){b||(b={});if(!a)return this;a.attributes&&(a=a.attributes);var c=this.attributes,e=this._escapedAttributes;if(!b.silent&&this.validate&&!this._performValidation(a,b))return!1;this.idAttribute in a&&(this.id=a[this.idAttribute]);var f=this._changing;this._changing=!0;for(var g in a){var h=a[g];d.isEqual(c[g],h)||(c[g]=h,delete e[g],this._changed=!0,b.silent||this.trigger("change:"+g,this,h,b))}return!f&&!b.silent&&this._changed&&this.change(b),this._changing=!1,this},unset:function(a,b){if(a in this.attributes){b||(b={});var c=this.attributes[a],d={};return d[a]=void 0,!b.silent&&this.validate&&!this._performValidation(d,b)?!1:(delete this.attributes[a],delete this._escapedAttributes[a],a==this.idAttribute&&delete this.id,this._changed=!0,b.silent||(this.trigger("change:"+a,this,void 0,b),this.change(b)),this)}return this},clear:function(a){a||(a={});var b,c=this.attributes,d={};for(b in c)d[b]=void 0;if(!a.silent&&this.validate&&!this._performValidation(d,a))return!1;this.attributes={},this._escapedAttributes={},this._changed=!0;if(!a.silent){for(b in c)this.trigger("change:"+b,this,void 0,a);this.change(a)}return this},fetch:function(a){a||(a={});var b=this,d=a.success;return a.success=function(c,e,f){if(!b.set(b.parse(c,f),a))return!1;d&&d(b,c)},a.error=v(a.error,b,a),(this.sync||c.sync).call(this,"read",this,a)},save:function(a,b){b||(b={});if(a&&!this.set(a,b))return!1;var d=this,e=b.success;b.success=function(a,c,f){if(!d.set(d.parse(a,f),b))return!1;e&&e(d,a,f)},b.error=v(b.error,d,b);var f=this.isNew()?"create":"update";return(this.sync||c.sync).call(this,f,this,b)},destroy:function(a){a||(a={});if(this.isNew())return this.trigger("destroy",this,this.collection,a);var b=this,d=a.success;return a.success=function(c){b.trigger("destroy",b,b.collection,a),d&&d(b,c)},a.error=v(a.error,b,a),(this.sync||c.sync).call(this,"delete",this,a)},url:function(){var a=t(this.collection)||this.urlRoot||u();return this.isNew()?a:a+(a.charAt(a.length-1)=="/"?"":"/")+encodeURIComponent(this.id)},parse:function(a,b){return a},clone:function(){return new this.constructor(this)},isNew:function(){return this.id==null},change:function(a){this.trigger("change",this,a),this._previousAttributes=d.clone(this.attributes),this._changed=!1},hasChanged:function(a){return a?this._previousAttributes[a]!=this.attributes[a]:this._changed},changedAttributes:function(a){a||(a=this.attributes);var b=this._previousAttributes,c=!1;for(var e in a)d.isEqual(b[e],a[e])||(c=c||{},c[e]=a[e]);return c},previous:function(a){return!a||!this._previousAttributes?null:this._previousAttributes[a]},previousAttributes:function(){return d.clone(this._previousAttributes)},_performValidation:function(a,b){var c=this.validate(a);return c?(b.error?b.error(this,c,b):this.trigger("error",this,c,b),!1):!0}}),c.Collection=function(a,b){b||(b={}),b.comparator&&(this.comparator=b.comparator),d.bindAll(this,"_onModelEvent","_removeReference"),this._reset(),a&&this.reset(a,{silent:!0}),this.initialize.apply(this,arguments)},d.extend(c.Collection.prototype,c.Events,{model:c.Model,initialize:function(){},toJSON:function(){return this.map(function(a){return a.toJSON()})},add:function(a,b){if(d.isArray(a))for(var c=0,e=a.length;c<e;c++)this._add(a[c],b);else this._add(a,b);return this},remove:function(a,b){if(d.isArray(a))for(var c=0,e=a.length;c<e;c++)this._remove(a[c],b);else this._remove(a,b);return this},get:function(a){return a==null?null:this._byId[a.id!=null?a.id:a]},getByCid:function(a){return a&&this._byCid[a.cid||a]},at:function(a){return this.models[a]},sort:function(a){a||(a={});if(!this.comparator)throw new Error("Cannot sort a set without a comparator");return this.models=this.sortBy(this.comparator),a.silent||this.trigger("reset",this,a),this},pluck:function(a){return d.map(this.models,function(b){return b.get(a)})},reset:function(a,b){return a||(a=[]),b||(b={}),this.each(this._removeReference),this._reset(),this.add(a,{silent:!0}),b.silent||this.trigger("reset",this,b),this},fetch:function(a){a||(a={});var b=this,d=a.success;return a.success=function(c,e,f){b[a.add?"add":"reset"](b.parse(c,f),a),d&&d(b,c)},a.error=v(a.error,b,a),(this.sync||c.sync).call(this,"read",this,a)},create:function(a,b){var c=this;b||(b={}),a=this._prepareModel(a,b);if(!a)return!1;var d=b.success;return b.success=function(a,e,f){c.add(a,b),d&&d(a,e,f)},a.save(null,b),a},parse:function(a,b){return a},chain:function(){return d(this.models).chain()},_reset:function(a){this.length=0,this.models=[],this._byId={},this._byCid={}},_prepareModel:function(a,b){if(a instanceof c.Model)a.collection||(a.collection=this);else{var d=a;a=new this.model(d,{collection:this}),a.validate&&!a._performValidation(d,b)&&(a=!1)}return a},_add:function(a,b){b||(b={}),a=this._prepareModel(a,b);if(!a)return!1;var c=this.getByCid(a);if(c)throw new Error(["Can't add the same model to a set twice",c.id]);this._byId[a.id]=a,this._byCid[a.cid]=a;var d=b.at!=null?b.at:this.comparator?this.sortedIndex(a,this.comparator):this.length;return this.models.splice(d,0,a),a.bind("all",this._onModelEvent),this.length++,b.silent||a.trigger("add",a,this,b),a},_remove:function(a,b){return b||(b={}),a=this.getByCid(a)||this.get(a),a?(delete this._byId[a.id],delete this._byCid[a.cid],this.models.splice(this.indexOf(a),1),this.length--,b.silent||a.trigger("remove",a,this,b),this._removeReference(a),a):null},_removeReference:function(a){this==a.collection&&delete a.collection,a.unbind("all",this._onModelEvent)},_onModelEvent:function(a,b,c,d){if(a!="add"&&a!="remove"||c==this)a=="destroy"&&this._remove(b,d),b&&a==="change:"+b.idAttribute&&(delete this._byId[b.previous(b.idAttribute)],this._byId[b.id]=b),this.trigger.apply(this,arguments);else return}});var f=["forEach","each","map","reduce","reduceRight","find","detect","filter","select","reject","every","all","some","any","include","contains","invoke","max","min","sortBy","sortedIndex","toArray","size","first","rest","last","without","indexOf","lastIndexOf","isEmpty","groupBy"];d.each(f,function(a){c.Collection.prototype[a]=function(){return d[a].apply(d,[this.models].concat(d.toArray(arguments)))}}),c.Router=function(a){a||(a={}),a.routes&&(this.routes=a.routes),this._bindRoutes(),this.initialize.apply(this,arguments)};var g=/:([\w\d]+)/g,h=/\*([\w\d]+)/g,i=/[-[\]{}()+?.,\\^$|#\s]/g;d.extend(c.Router.prototype,c.Events,{initialize:function(){},route:function(a,b,e){c.history||(c.history=new c.History),d.isRegExp(a)||(a=this._routeToRegExp(a)),c.history.route(a,d.bind(function(c){var d=this._extractParameters(a,c);e.apply(this,d),this.trigger.apply(this,["route:"+b].concat(d))},this))},navigate:function(a,b){c.history.navigate(a,b)},_bindRoutes:function(){if(!this.routes)return;var a=[];for(var b in this.routes)a.unshift([b,this.routes[b]]);for(var c=0,d=a.length;c<d;c++)this.route(a[c][0],a[c][1],this[a[c][1]])},_routeToRegExp:function(a){return a=a.replace(i,"\\$&").replace(g,"([^/]*)").replace(h,"(.*?)"),new RegExp("^"+a+"$")},_extractParameters:function(a,b){return a.exec(b).slice(1)}}),c.History=function(){this.handlers=[],d.bindAll(this,"checkUrl")};var j=/^#*/,k=/msie [\w.]+/,l=!1;d.extend(c.History.prototype,{interval:50,getFragment:function(a,b){if(a==null)if(this._hasPushState||b){a=window.location.pathname;var c=window.location.search;c&&(a+=c),a.indexOf(this.options.root)==0&&(a=a.substr(this.options.root.length))}else a=window.location.hash;return decodeURIComponent(a.replace(j,""))},start:function(a){if(l)throw new Error("Backbone.history has already been started");this.options=d.extend({},{root:"/"},this.options,a),this._wantsPushState=!!this.options.pushState,this._hasPushState=!!(this.options.pushState&&window.history&&window.history.pushState);var b=this.getFragment(),c=document.documentMode,f=k.exec(navigator.userAgent.toLowerCase())&&(!c||c<=7);f&&(this.iframe=e('<iframe src="javascript:0" tabindex="-1" />').hide().appendTo("body")[0].contentWindow,this.navigate(b)),this._hasPushState?e(window).bind("popstate",this.checkUrl):"onhashchange"in window&&!f?e(window).bind("hashchange",this.checkUrl):setInterval(this.checkUrl,this.interval),this.fragment=b,l=!0;var g=window.location,h=g.pathname==this.options.root;if(this._wantsPushState&&!this._hasPushState&&!h)return this.fragment=this.getFragment(null,!0),window.location.replace(this.options.root+"#"+this.fragment),!0;this._wantsPushState&&this._hasPushState&&h&&g.hash&&(this.fragment=g.hash.replace(j,""),window.history.replaceState({},document.title,g.protocol+"//"+g.host+this.options.root+this.fragment));if(!this.options.silent)return this.loadUrl()},route:function(a,b){this.handlers.unshift({route:a,callback:b})},checkUrl:function(a){var b=this.getFragment();b==this.fragment&&this.iframe&&(b=this.getFragment(this.iframe.location.hash));if(b==this.fragment||b==decodeURIComponent(this.fragment))return!1;this.iframe&&this.navigate(b),this.loadUrl()||this.loadUrl(window.location.hash)},loadUrl:function(a){var b=this.fragment=this.getFragment(a),c=d.any(this.handlers,function(a){if(a.route.test(b))return a.callback(b),!0});return c},navigate:function(a,b){var c=(a||"").replace(j,"");if(this.fragment==c||this.fragment==decodeURIComponent(c))return;if(this._hasPushState){var d=window.location;c.indexOf(this.options.root)!=0&&(c=this.options.root+c),this.fragment=c,window.history.pushState({},document.title,d.protocol+"//"+d.host+c)}else window.location.hash=this.fragment=c,this.iframe&&c!=this.getFragment(this.iframe.location.hash)&&(this.iframe.document.open().close(),this.iframe.location.hash=c);b&&this.loadUrl(a)}}),c.View=function(a){this.cid=d.uniqueId("view"),this._configure(a||{}),this._ensureElement(),this.delegateEvents(),this.initialize.apply(this,arguments)};var m=function(a){return e(a,this.el)},n=/^(\S+)\s*(.*)$/,o=["model","collection","el","id","attributes","className","tagName"];d.extend(c.View.prototype,c.Events,{tagName:"div",$:m,initialize:function(){},render:function(){return this},remove:function(){return e(this.el).remove(),this},make:function(a,b,c){var d=document.createElement(a);return b&&e(d).attr(b),c&&e(d).html(c),d},delegateEvents:function(a){if(!a&&!(a=this.events))return;d.isFunction(a)&&(a=a.call(this)),e(this.el).unbind(".delegateEvents"+this.cid);for(var b in a){var c=this[a[b]];if(!c)throw new Error('Event "'+a[b]+'" does not exist');var f=b.match(n),g=f[1],h=f[2];c=d.bind(c,this),g+=".delegateEvents"+this.cid,h===""?e(this.el).bind(g,c):e(this.el).delegate(h,g,c)}},_configure:function(a){this.options&&(a=d.extend({},this.options,a));for(var b=0,c=o.length;b<c;b++){var e=o[b];a[e]&&(this[e]=a[e])}this.options=a},_ensureElement:function(){if(!this.el){var a=this.attributes||{};this.id&&(a.id=this.id),this.className&&(a["class"]=this.className),this.el=this.make(this.tagName,a)}else d.isString(this.el)&&(this.el=e(this.el).get(0))}});var p=function(a,b){var c=s(this,a,b);return c.extend=this.extend,c};c.Model.extend=c.Collection.extend=c.Router.extend=c.View.extend=p;var q={create:"POST",update:"PUT","delete":"DELETE",read:"GET"};c.sync=function(a,b,f){var g=q[a],h=d.extend({type:g,dataType:"json"},f);return h.url||(h.url=t(b)||u()),!h.data&&b&&(a=="create"||a=="update")&&(h.contentType="application/json",h.data=JSON.stringify(b.toJSON())),c.emulateJSON&&(h.contentType="application/x-www-form-urlencoded",h.data=h.data?{model:h.data}:{}),c.emulateHTTP&&(g==="PUT"||g==="DELETE")&&(c.emulateJSON&&(h.data._method=g),h.type="POST",h.beforeSend=function(a){a.setRequestHeader("X-HTTP-Method-Override",g)}),h.type!=="GET"&&!c.emulateJSON&&(h.processData=!1),e.ajax(h)};var r=function(){},s=function(a,b,c){var e;return b&&b.hasOwnProperty("constructor")?e=b.constructor:e=function(){return a.apply(this,arguments)},d.extend(e,a),r.prototype=a.prototype,e.prototype=new r,b&&d.extend(e.prototype,b),c&&d.extend(e,c),e.prototype.constructor=e,e.__super__=a.prototype,e},t=function(a){return!a||!a.url?null:d.isFunction(a.url)?a.url():a.url},u=function(){throw new Error('A "url" property or function must be specified')},v=function(a,b,c){return function(d){a?a(b,d,c):b.trigger("error",b,d,c)}},w=function(a){return a.replace(/&(?!\w+;|#\d+;|#x[\da-f]+;)/gi,"&amp;").replace(/</g,"&lt;").replace(/>/g,"&gt;").replace(/"/g,"&quot;").replace(/'/g,"&#x27;").replace(/\//g,"&#x2F;")}})).call(this)