$(document).ready(function(){
  var minute = Number($('#time-exam-minute').text());
  var second = Number($('#time-exam-second').text());
  var timeout = null;
  var bai_thi_id = $('.btn-submit-examination').attr('data-id');
  var data = {};

  function start_exam() {
    if(second == -1) {
      minute -= 1;
      second = 59;
    }

    if(minute == -1) {
      $('.btn-submit-examination').click();
      return false;
    }

    $('#time-exam-minute').text(minute);
    $('#time-exam-second').text(second);

    timeout = setTimeout(function(){
      second--;
      start_exam();
    }, 1000);
  }

  start_exam();

  $('.btn-submit-examination').on('click', function(){
    clearTimeout(timeout);
    update_examination('submit');
  });

  function update_examination(type) {
    $('.bai-thi-chi-tiet').find('.bai-thi-cau-hoi').each(function(){
      var cau_hoi_id = this.dataset.id;
      var phuong_an_chon = [];

      $('#bai-thi-cau-hoi-' + cau_hoi_id).find('.bai-thi-phuong-an').each(function(){
        if($(this).find('input[type="checkbox"]').is(':checked')){
          phuong_an_chon.push(this.dataset.id);
        }
      });

      data[cau_hoi_id] = phuong_an_chon;
    });

    $.ajax({
      type: 'patch',
      url: '/sv/bai_this/' + bai_thi_id,
      data: {bai_thi: JSON.stringify(data), type: type},
      success: function(data) {
        if(data.type === 'submit'){
          $('#correct-answer-result').text(data.so_cau_dung);
          $('#score-result').text(data.tong_diem);
          $('#ketquaModal').modal('show');
          $('#ketquaModal').on('hidden.bs.modal', function() {
            window.location.href = '/sv';
          });
        }
        else{
          auto_update();
        }
      },
      error: function(error) {
        $.growl.error({message: error});
        location.reload();
      }
    });
  }

  function auto_update(){
    setTimeout(function(){
      update_examination('auto');
    }, 5000);
  }

  auto_update();
});
