$(document).ready(function() {
  var data = [];

  $('.gv-choose-question').on('change', function(e){
    var id = this.dataset.id;
    var choosen = $('#cau-hoi-'+id).is(':checked');
    var question_count = Number($('.cau-hoi-count').text());
    if(choosen) {
      data.push(id);
      $('.cau-hoi-count').text(question_count + 1);
    }
    else {
      data.splice(data.indexOf(id), 1);
      $('.cau-hoi-count').text(question_count - 1);
    }
    e.preventDefault();
  });

  $('.save-choosen-question').on('click', function(e) {
    de_thi_id = $('#choosen-de-thi').val();
    $.ajax({
      type: 'post',
      url: '/gv/de_thi_cau_hois',
      data: {cau_hoi_ids: data, de_thi_id: de_thi_id},
      success: function(data) {
        $.growl.notice({title: '', message: data.message});
        setTimeout(function(){
          window.location.href = '/gv/de_this/'+de_thi_id;
        }, 1000);
      },
      error: function(error) {
        $.growl.error({title: '', message: error});
      }
    });
    e.preventDefault();
  });
});
