((function(){TownHall140.Views.LoginModalView=Backbone.View.extend({initialize:function(){return $(document).bind("loginRequired",$.proxy(this.onLoginRequire,this)),this.el.bind("hide",this.onModalHide)},events:{"click a":"onCancel"},onCancel:function(){return this.el.modal("hide")},onLoginRequire:function(){return this.render()},onModalHide:function(){return $(document).trigger("joinCancelled")},render:function(){return this.el.modal({backdrop:!0,show:!0})}})})).call(this)