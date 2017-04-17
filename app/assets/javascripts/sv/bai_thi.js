$(document).ready(function(){
  var minute = Number($('#time-exam-minute').text());
  var second = Number($('#time-exam-second').text());
  var timeout = null;

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

  var data = {};
  $('.btn-submit-examination').on('click', function(){
    clearTimeout(timeout);
    var bai_thi_id = this.dataset.id;

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
      data: {bai_thi: JSON.stringify(data)},
      success: function(data) {
        $('#correct-answer-result').text(data.so_cau_dung);
        $('#score-result').text(data.tong_diem);
        $('#ketquaModal').modal('show');
        $('#ketquaModal').on('hidden.bs.modal', function() {
          window.location.href = '/sv';
        });
      },
      error: function(error) {
        $.growl.error({message: error});
        location.reload();
      }
    });
  });
});
