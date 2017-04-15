$(document).ready(function(){
  var data = {};
  $('.btn-submit-examination').on('click', function(){
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
