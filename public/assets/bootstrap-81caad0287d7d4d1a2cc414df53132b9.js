/* ==========================================================
 * bootstrap-alerts.js v1.4.0
 * http://twitter.github.com/bootstrap/javascript.html#alerts
 * ==========================================================
 * Copyright 2011 Twitter, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * ========================================================== */
!function(a){"use strict";var b;a(document).ready(function(){a.support.transition=function(){var a=document.body||document.documentElement,b=a.style,c=b.transition!==undefined||b.WebkitTransition!==undefined||b.MozTransition!==undefined||b.MsTransition!==undefined||b.OTransition!==undefined;return c}(),a.support.transition&&(b="TransitionEnd",a.browser.webkit?b="webkitTransitionEnd":a.browser.mozilla?b="transitionend":a.browser.opera&&(b="oTransitionEnd"))});var c=function(b,c){if(c=="close")return this.close.call(b);this.settings=a.extend({},a.fn.alert.defaults,c),this.$element=a(b).delegate(this.settings.selector,"click",this.close)};c.prototype={close:function(c){function f(){d.remove()}var d=a(this),e="alert-message";d=d.hasClass(e)?d:d.parent(),c&&c.preventDefault(),d.removeClass("in"),a.support.transition&&d.hasClass("fade")?d.bind(b,f):f()}},a.fn.alert=function(b){return b===!0?this.data("alert"):this.each(function(){var d=a(this),e;if(typeof b=="string"){e=d.data("alert");if(typeof e=="object")return e[b].call(d)}a(this).data("alert",new c(this,b))})},a.fn.alert.defaults={selector:".close"},a(document).ready(function(){new c(a("body"),{selector:".alert-message[data-alert] .close"})})}(window.jQuery||window.ender),!function(a){function b(b,c){var d="disabled",e=a(b),f=e.data();c+="Text",f.resetText||e.data("resetText",e.html()),e.html(f[c]||a.fn.button.defaults[c]),setTimeout(function(){c=="loadingText"?e.addClass(d).attr(d,d):e.removeClass(d).removeAttr(d)},0)}function c(b){a(b).toggleClass("active")}"use strict",a.fn.button=function(a){return this.each(function(){if(a=="toggle")return c(this);a&&b(this,a)})},a.fn.button.defaults={loadingText:"loading..."},a(function(){a("body").delegate(".btn[data-toggle]","click",function(){a(this).button("toggle")})})}(window.jQuery||window.ender),!function(a){function c(){a(b).parent("li").removeClass("open")}"use strict",a.fn.dropdown=function(e){return this.each(function(){a(this).delegate(e||b,"click",function(b){var d=a(this).parent("li"),e=d.hasClass("open");return c(),!e&&d.toggleClass("open"),!1})})};var b="a.menu, .dropdown-toggle";a(function(){a("html").bind("click",c),a("body").dropdown("[data-dropdown] a.menu, [data-dropdown] .dropdown-toggle")})}(window.jQuery||window.ender),!function(a){function d(){var a=this,c=setTimeout(function(){a.$element.unbind(b),e.call(a)},500);this.$element.one(b,function(){clearTimeout(c),e.call(a)})}function e(a){this.$element.hide().trigger("hidden"),f.call(this)}function f(c){var d=this,e=this.$element.hasClass("fade")?"fade":"";if(this.isShown&&this.settings.backdrop){var f=a.support.transition&&e;this.$backdrop=a('<div class="modal-backdrop '+e+'" />').appendTo(document.body),this.settings.backdrop!="static"&&this.$backdrop.click(a.proxy(this.hide,this)),f&&this.$backdrop[0].offsetWidth,this.$backdrop.addClass("in"),f?this.$backdrop.one(b,c):c()}else!this.isShown&&this.$backdrop?(this.$backdrop.removeClass("in"),a.support.transition&&this.$element.hasClass("fade")?this.$backdrop.one(b,a.proxy(g,this)):g.call(this)):c&&c()}function g(){this.$backdrop.remove(),this.$backdrop=null}function h(){var b=this;this.isShown&&this.settings.keyboard?a(document).bind("keyup.modal",function(a){a.which==27&&b.hide()}):this.isShown||a(document).unbind("keyup.modal")}"use strict";var b;a(document).ready(function(){a.support.transition=function(){var a=document.body||document.documentElement,b=a.style,c=b.transition!==undefined||b.WebkitTransition!==undefined||b.MozTransition!==undefined||b.MsTransition!==undefined||b.OTransition!==undefined;return c}(),a.support.transition&&(b="TransitionEnd",a.browser.webkit?b="webkitTransitionEnd":a.browser.mozilla?b="transitionend":a.browser.opera&&(b="oTransitionEnd"))});var c=function(b,c){return this.settings=a.extend({},a.fn.modal.defaults,c),this.$element=a(b).delegate(".close","click.modal",a.proxy(this.hide,this)),this.settings.show&&this.show(),this};c.prototype={toggle:function(){return this[this.isShown?"hide":"show"]()},show:function(){var c=this;return this.isShown=!0,this.$element.trigger("show"),h.call(this),f.call(this,function(){var d=a.support.transition&&c.$element.hasClass("fade");c.$element.appendTo(document.body).show(),d&&c.$element[0].offsetWidth,c.$element.addClass("in"),d?c.$element.one(b,function(){c.$element.trigger("shown")}):c.$element.trigger("shown")}),this},hide:function(b){b&&b.preventDefault();if(!this.isShown)return this;var c=this;return this.isShown=!1,h.call(this),this.$element.trigger("hide").removeClass("in"),a.support.transition&&this.$element.hasClass("fade")?d.call(this):e.call(this),this}},a.fn.modal=function(b){var d=this.data("modal");return d?b===!0?d:(typeof b=="string"?d[b]():d&&d.toggle(),this):(typeof b=="string"&&(b={show:/show|toggle/.test(b)}),this.each(function(){a(this).data("modal",new c(this,b))}))},a.fn.modal.Modal=c,a.fn.modal.defaults={backdrop:!1,keyboard:!1,show:!1},a(document).ready(function(){a("body").delegate("[data-controls-modal]","click",function(b){b.preventDefault();var c=a(this).data("show",!0);a("#"+c.attr("data-controls-modal")).modal(c.data())})})}(window.jQuery||window.ender),!function(a){function b(a,b){b.find("> .active").removeClass("active").find("> .dropdown-menu > .active").removeClass("active"),a.addClass("active"),a.parent(".dropdown-menu")&&a.closest("li.dropdown").addClass("active")}function c(c){var d=a(this),e=d.closest("ul:not(.dropdown-menu)"),f=d.attr("href"),g,h;if(/^#\w+/.test(f)){c.preventDefault();if(d.parent("li").hasClass("active"))return;g=e.find(".active a").last()[0],h=a(f),b(d.parent("li"),e),b(h,h.parent()),d.trigger({type:"change",relatedTarget:g})}}"use strict",a.fn.tabs=a.fn.pills=function(b){return this.each(function(){a(this).delegate(b||".tabs li > a, .pills > li > a","click",c)})},a(document).ready(function(){a("body").tabs("ul[data-tabs] li > a, ul[data-pills] > li > a")})}(window.jQuery||window.ender),!function(a){function c(c,d){var e=a.proxy(this.processScroll,this);this.$topbar=a(c),this.selector=d||"li > a",this.refresh(),this.$topbar.delegate(this.selector,"click",e),b.scroll(e),this.processScroll()}"use strict";var b=a(window);c.prototype={refresh:function(){this.targets=this.$topbar.find(this.selector).map(function(){var b=a(this).attr("href");return/^#\w/.test(b)&&a(b).length?b:null}),this.offsets=a.map(this.targets,function(b){return a(b).offset().top})},processScroll:function(){var a=b.scrollTop()+10,c=this.offsets,d=this.targets,e=this.activeTarget,f;for(f=c.length;f--;)e!=d[f]&&a>=c[f]&&(!c[f+1]||a<=c[f+1])&&this.activateButton(d[f])},activateButton:function(a){this.activeTarget=a,this.$topbar.find(this.selector).parent(".active").removeClass("active"),this.$topbar.find(this.selector+'[href="'+a+'"]').parent("li").addClass("active")}},a.fn.scrollSpy=function(b){var d=this.data("scrollspy");return d?b===!0?d:(typeof b=="string"&&d[b](),this):this.each(function(){a(this).data("scrollspy",new c(this,b))})},a(document).ready(function(){a("body").scrollSpy("[data-scrollspy] li > a")})}(window.jQuery||window.ender),!function(a){function d(a,b,c){return typeof a=="function"?a.apply(b,c):a}"use strict";var b;a(document).ready(function(){a.support.transition=function(){var a=document.body||document.documentElement,b=a.style,c=b.transition!==undefined||b.WebkitTransition!==undefined||b.MozTransition!==undefined||b.MsTransition!==undefined||b.OTransition!==undefined;return c}(),a.support.transition&&(b="TransitionEnd",a.browser.webkit?b="webkitTransitionEnd":a.browser.mozilla?b="transitionend":a.browser.opera&&(b="oTransitionEnd"))});var c=function(b,c){this.$element=a(b),this.options=c,this.enabled=!0,this.fixTitle()};c.prototype={show:function(){var b,c,e,f,g,h;if(this.hasContent()&&this.enabled){g=this.tip(),this.setContent(),this.options.animate&&g.addClass("fade"),g.remove().css({top:0,left:0,display:"block"}).prependTo(document.body),b=a.extend({},this.$element.offset(),{width:this.$element[0].offsetWidth,height:this.$element[0].offsetHeight}),c=g[0].offsetWidth,e=g[0].offsetHeight,f=d(this.options.placement,this,[g[0],this.$element[0]]);switch(f){case"below":h={top:b.top+b.height+this.options.offset,left:b.left+b.width/2-c/2};break;case"above":h={top:b.top-e-this.options.offset,left:b.left+b.width/2-c/2};break;case"left":h={top:b.top+b.height/2-e/2,left:b.left-c-this.options.offset};break;case"right":h={top:b.top+b.height/2-e/2,left:b.left+b.width+this.options.offset}}g.css(h).addClass(f).addClass("in")}},setContent:function(){var a=this.tip();a.find(".twipsy-inner")[this.options.html?"html":"text"](this.getTitle()),a[0].className="twipsy"},hide:function(){function e(){d.remove()}var c=this,d=this.tip();d.removeClass("in"),a.support.transition&&this.$tip.hasClass("fade")?d.bind(b,e):e()},fixTitle:function(){var a=this.$element;(a.attr("title")||typeof a.attr("data-original-title")!="string")&&a.attr("data-original-title",a.attr("title")||"").removeAttr("title")},hasContent:function(){return this.getTitle()},getTitle:function(){var a,b=this.$element,c=this.options;return this.fixTitle(),typeof c.title=="string"?a=b.attr(c.title=="title"?"data-original-title":c.title):typeof c.title=="function"&&(a=c.title.call(b[0])),a=(""+a).replace(/(^\s*|\s*$)/,""),a||c.fallback},tip:function(){return this.$tip=this.$tip||a('<div class="twipsy" />').html(this.options.template)},validate:function(){this.$element[0].parentNode||(this.hide(),this.$element=null,this.options=null)},enable:function(){this.enabled=!0},disable:function(){this.enabled=!1},toggleEnabled:function(){this.enabled=!this.enabled},toggle:function(){this[this.tip().hasClass("in")?"hide":"show"]()}},a.fn.twipsy=function(b){return a.fn.twipsy.initWith.call(this,b,c,"twipsy"),this},a.fn.twipsy.initWith=function(b,c,d){function i(e){var f=a.data(e,d);return f||(f=new c(e,a.fn.twipsy.elementOptions(e,b)),a.data(e,d,f)),f}function j(){var a=i(this);a.hoverState="in",b.delayIn==0?a.show():(a.fixTitle(),setTimeout(function(){a.hoverState=="in"&&a.show()},b.delayIn))}function k(){var a=i(this);a.hoverState="out",b.delayOut==0?a.hide():setTimeout(function(){a.hoverState=="out"&&a.hide()},b.delayOut)}var e,f,g,h;return b===!0?this.data(d):typeof b=="string"?(e=this.data(d),e&&e[b](),this):(b=a.extend({},a.fn[d].defaults,b),b.live||this.each(function(){i(this)}),b.trigger!="manual"&&(f=b.live?"live":"bind",g=b.trigger=="hover"?"mouseenter":"focus",h=b.trigger=="hover"?"mouseleave":"blur",this[f](g,j)[f](h,k)),this)},a.fn.twipsy.Twipsy=c,a.fn.twipsy.defaults={animate:!0,delayIn:0,delayOut:0,fallback:"",placement:"above",html:!1,live:!1,offset:0,title:"title",trigger:"hover",template:'<div class="twipsy-arrow"></div><div class="twipsy-inner"></div>'},a.fn.twipsy.rejectAttrOptions=["title"],a.fn.twipsy.elementOptions=function(b,c){var d=a(b).data(),e=a.fn.twipsy.rejectAttrOptions,f=e.length;while(f--)delete d[e[f]];return a.extend({},c,d)}}(window.jQuery||window.ender),!function(a){"use strict";var b=function(b,c){this.$element=a(b),this.options=c,this.enabled=!0,this.fixTitle()};b.prototype=a.extend({},a.fn.twipsy.Twipsy.prototype,{setContent:function(){var a=this.tip();a.find(".title")[this.options.html?"html":"text"](this.getTitle()),a.find(".content > *")[this.options.html?"html":"text"](this.getContent()),a[0].className="popover"},hasContent:function(){return this.getTitle()||this.getContent()},getContent:function(){var a,b=this.$element,c=this.options;return typeof this.options.content=="string"?a=b.attr(this.options.content):typeof this.options.content=="function"&&(a=this.options.content.call(this.$element[0])),a},tip:function(){return this.$tip||(this.$tip=a('<div class="popover" />').html(this.options.template)),this.$tip}}),a.fn.popover=function(c){return typeof c=="object"&&(c=a.extend({},a.fn.popover.defaults,c)),a.fn.twipsy.initWith.call(this,c,b,"popover"),this},a.fn.popover.defaults=a.extend({},a.fn.twipsy.defaults,{placement:"right",content:"data-content",template:'<div class="arrow"></div><div class="inner"><h3 class="title"></h3><div class="content"><p></p></div></div>'}),a.fn.twipsy.rejectAttrOptions.push("content")}(window.jQuery||window.ender)