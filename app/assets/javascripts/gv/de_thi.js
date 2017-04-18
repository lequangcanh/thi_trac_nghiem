$(document).ready(function(){
  var current_question = Number($('#current-question').text());

  $('.do_kho').on('change', function(){
    var do_kho_nho = Number($('#do_kho_nho').val());
    var do_kho_hieu = Number($('#do_kho_hieu').val());
    var do_kho_phan_tich = Number($('#do_kho_phan_tich').val());
    var do_kho_van_dung = Number($('#do_kho_van_dung').val());
    var do_kho_tong_hop = Number($('#do_kho_tong_hop').val());
    question_count = (current_question + do_kho_nho + do_kho_hieu + do_kho_tong_hop + do_kho_van_dung + do_kho_phan_tich);
    $('#current-question').text(question_count);
  });
});
