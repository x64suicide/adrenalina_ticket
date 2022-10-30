window.addEventListener('message', function (event) {
    let data = event.data;

    if (data.display == true) {
      $('.watermark').fadeIn(300);
    } else if (data.display == false) {
      $('.watermark').fadeOut(300);
    }
        
    if (data.id != undefined) {
        $('#player-counter').text(event.data.id);
    }
});