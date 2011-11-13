TownHall140.Views.TwitterStreamView = Backbone.View.extend({
  render: function() {
    new TWTR.Widget({
      version: 2,
        type: 'search',
        search: 'occupyharvard',
        interval: 30000,
        title: 'occupyharvard',
        subject: 'Chat with Admin_namawefwaf',
        width: 250,
        height: 300,
        theme: {
          shell: {
                   background: '#8ec1da',
        color: '#ffffff'
                 },
        tweets: {
                  background: '#ffffff',
        color: '#444444',
        links: '#1985b5'
                }
        },
        features: {
                    scrollbar: false,
                    loop: true,
                    live: true,
                    behavior: 'default'
                  }
    }).render().start();
  }
});
