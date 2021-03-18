// Update selected file to choose div
$('.custom-file-input').on('change', function () {
  file = $('.custom-file-input').val().split('\\').pop()
  if(file) {
    $('.upload__name-file').html(file)
  }
})