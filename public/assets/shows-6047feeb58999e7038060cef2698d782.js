((function(){$(document).ready(function(){return console.log("ready"),$("#msg").change(function(){return console.log("hi")}),$(".tweetForm textarea").keypress(function(a){var b;return b=a.target.value,$(".tweetForm #submitButton").attr("href",function(a,c){return"https://twitter.com/intent/tweet?text="+encodeURIComponent(b)})})})})).call(this)