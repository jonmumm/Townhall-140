((function(){this.JST||(this.JST={}),this.JST["backbone/templates/panel"]=function(obj){var __p=[],print=function(){__p.push.apply(__p,arguments)};with(obj||{})__p.push(""),app.get("role")=="moderator"?__p.push('\n  <button class="btn primary startShowBtn" disabled="disabled">Start Event</button>\n  <button class="btn stopShowBtn" disabled="disabled">Stop Event</button>\n'):__p.push('\n  <button class="btn primary joinShowBtn" disabled="disabled">Join Event</button>\n  <button class="btn leaveShowBtn" disabled="disabled">Leave Event</button>\n'),__p.push("\n");return __p.join("")}})).call(this)