class ChangeBaiThiChiTietPhuongAn < ActiveRecord::Migration[5.0]
  def change
    remove_column :bai_thi_chi_tiet_phuong_an, :phuong_an
    remove_column :bai_thi_chi_tiet_phuong_an, :thi_sinh_chon
    remove_column :bai_thi_chi_tiet_phuong_an, :dap_an_dung
    add_column :bai_thi_chi_tiet_phuong_an, :phuong_an_chon_id, :integer
  end
end
