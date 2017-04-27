class AddDurationToDeThi < ActiveRecord::Migration[5.0]
  def change
    add_column :de_thi, :thoi_gian_mo_de, :datetime
    add_column :de_thi, :thoi_gian_dong_de, :datetime
    remove_column :de_thi, :so_cau_nho
    remove_column :de_thi, :so_cau_hieu
    remove_column :de_thi, :so_cau_phan_tich
    remove_column :de_thi, :so_cau_van_dung
    remove_column :de_thi, :so_cau_tong_hop
  end
end
