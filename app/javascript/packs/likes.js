$(function() {
  $('body').on('click', '.fa-heart', function(){
    var active = $(this).hasClass('active');
    var count = $(this).siblings('.like-count');
    var currentCount = parseInt(count.text());
    count.text(active ? currentCount - 1 : currentCount + 1);
    $(this).toggleClass('active');

    $.ajax({
      url: $(this).data('url'),
      type: active ? 'DELETE' : 'POST',
      dataType: 'json',
      data: {'_method': active ? 'DELETE' : 'POST'}
    })
    .done(function(data) {
      console.log(data);
    })
    .fail(function() {
      console.log("error");
    })
    .always(function() {
      console.log("complete");
    });

    return false;
  });
});
