// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require_tree .

$(function(){ $(document).foundation();
  $('.upvote-review').on("click",function() {
    event.preventDefault();
    var id = this.id.replace('upvote-review-', '');
    var path = '/api/reviews/' + id + '/votes/upvote.json';
    var request = $.ajax({
      url: path,
      method: "POST",
      dataType: "json"
    });
    request.done(function(data) {
      var voteCount = document.getElementById('review-sum-' + id);
      voteCount.innerHTML = data;
    })
  });

  $('.downvote-review').on("click", function(){
    event.preventDefault();
    var id = this.id.replace('downvote-review-', '');
    var path = '/api/reviews/' + id + '/votes/downvote.json';
    var request = $.ajax({
      url: path,
      method: "POST",
      dataType: "json"
    });
    request.done(function(data) {
      var voteCount = document.getElementById('review-sum-' + id);
      voteCount.innerHTML = data;
    })
  });
});
