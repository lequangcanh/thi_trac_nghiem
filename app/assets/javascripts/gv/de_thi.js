$(document).ready(function(){
  $('#random-difficult').hide();
  var total_question;
  var phan_tram_nho, phan_tram_hieu, phan_tram_phan_tich, phan_tram_van_dung, phan_tram_tong_hop;
  var do_kho_nho, do_kho_hieu, do_kho_phan_tich, do_kho_van_dung, do_kho_tong_hop;

  $('#de_thi_so_cau_hoi').on('change', function() {
    $('#random-difficult').show();
    total_question = Number($('#de_thi_so_cau_hoi').val());
  });

  $('#phan_tram_nho').on('keyup mouseup', function() {
    get_value_percent();
    $('#phan_tram_total').val(total_percent());
    $('#do_kho_nho').val(Math.round((total_question / 100) * phan_tram_nho));
    get_value_question();
    $('#do_kho_total').val(total_question_input())
  });

  $('#phan_tram_hieu').on('keyup mouseup', function() {
    get_value_percent();
    $('#phan_tram_total').val(total_percent());
    $('#do_kho_hieu').val(Math.round((total_question / 100) * phan_tram_hieu));
    get_value_question();
    $('#do_kho_total').val(total_question_input())
  });

  $('#phan_tram_phan_tich').on('keyup mouseup', function() {
    get_value_percent();
    $('#phan_tram_total').val(total_percent());
    $('#do_kho_phan_tich').val(Math.round((total_question / 100) * phan_tram_phan_tich));
    get_value_question();
    $('#do_kho_total').val(total_question_input())
  });

  $('#phan_tram_van_dung').on('keyup mouseup', function() {
    get_value_percent();
    $('#phan_tram_total').val(total_percent());
    $('#do_kho_van_dung').val(Math.round((total_question / 100) * phan_tram_van_dung));
    get_value_question();
    $('#do_kho_total').val(total_question_input())
  });

  $('#phan_tram_tong_hop').on('keyup mouseup', function() {
      get_value_percent();
      $('#phan_tram_total').val(total_percent());
      $('#do_kho_tong_hop').val(Math.round((total_question / 100) * phan_tram_tong_hop));
      get_value_question();
      $('#do_kho_total').val(total_question_input())
    });


  var get_value_percent = function() {
    phan_tram_nho = Number($('#phan_tram_nho').val());
    phan_tram_hieu = Number($('#phan_tram_hieu').val());
    phan_tram_phan_tich = Number($('#phan_tram_phan_tich').val());
    phan_tram_van_dung = Number($('#phan_tram_van_dung').val());
    phan_tram_tong_hop = Number($('#phan_tram_tong_hop').val());
  }

  var total_percent = function() {
    return (phan_tram_nho + phan_tram_hieu + phan_tram_phan_tich + phan_tram_van_dung + phan_tram_tong_hop);
  }

  var get_value_question = function() {
    do_kho_nho = Number($('#do_kho_nho').val());
    do_kho_hieu = Number($('#do_kho_hieu').val());
    do_kho_phan_tich = Number($('#do_kho_phan_tich').val());
    do_kho_van_dung = Number($('#do_kho_van_dung').val());
    do_kho_tong_hop = Number($('#do_kho_tong_hop').val());
  }

  var total_question_input = function() {
    return (do_kho_hieu + do_kho_nho + do_kho_tong_hop + do_kho_van_dung + do_kho_phan_tich);
  }
});
