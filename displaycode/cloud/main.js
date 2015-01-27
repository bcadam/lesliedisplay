
// Use Parse.Cloud.define to define as many cloud functions as you want.
// For example:
Parse.Cloud.define("hello", function(request, response) {
  response.success("Hello world!");
});

Parse.Cloud.define("fetchNewEvents", function(request, response) {
  
	var data;
	
  $.getJSON("http://events.nyu.edu/live/json/events/group/entrepreneurial-institute", function(data) {
    console.log(data); // use data as a generic object 
	});


  query.find({
    success: function(results) {
      var sum = 0;
      for (var i = 0; i < results.length; ++i) {
        sum += results[i].get("stars");
      }
      response.success(sum / results.length);
    },
    error: function() {
      response.error("movie lookup failed");
    }
  });
});