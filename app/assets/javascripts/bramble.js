$(document).ready(function() {
  $("#post_button").click(function() {
    alert($("#post_data").data("story_id"));
    $.post("/stories/" + $("#post_data").data("story-id") + "/add",
    {
      text: document.getElementById("post_text").value,
      user_id: $("#post_data").data("user_id")
    },
    function(data, status) {
      alert("Data: " + data + "\nStatus: " + status);
    });
  });
});
