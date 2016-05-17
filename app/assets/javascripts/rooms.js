$(document).ready(function(){
  $(".showup").hide()
    $('.click').click(function(event){
        event.stopPropagation();
         $(".showup").slideToggle("fast");
    });
    $(".showup").on("click", function (event) {
        event.stopPropagation();
    });
});

$(document).on("click", function () {
    $(".showup").hide();
});
