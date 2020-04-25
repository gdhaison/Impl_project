$(document).on('turbolinks:load', function () {
  star = $('#star_total').attr('star')
  $('#load_more_user').attr('star', star)
  $('#load_more').on("click", function() {
    var num = parseInt($(this).attr("page"))
    var search = $(this).attr("search")
    var next_page = num + 1 
  
    $('#load-btn').html('<center><a page="' + next_page + '" search="gdhaison" id="load_more" class="btn btn-primary" data-remote="true" href="/search?page=' + next_page + '&amp;search=' + search + '">Load more</a></center>')
  });

  $('#load_more_user').on("click", function() {
    var num = parseInt($(this).attr("page"))
    var next_page = num + 1 
    star = $('#star_total').attr('star')
    
    $('#load-btn').html('<center><a page="' + next_page + '" id="load_more_user" class="btn btn-primary" data-remote="true" href="/repos?page=' + next_page + '&amp;star=' + star + '&amp;star_url=https%3A%2F%2Fapi.github.com%2Frepos%2Fheartcombo%2Fdevise-encryptable%2Fstargazers">Load more</a></center>')
  });
})