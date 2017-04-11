class AddColumnDifficultTypeToDeThi < ActiveRecord::Migration[5.0]
  def change
    add_column :de_thi, :so_cau_nho, :integer
    add_column :de_thi, :so_cau_hieu, :integer
    add_column :de_thi, :so_cau_phan_tich, :integer
    add_column :de_thi, :so_cau_van_dung, :integer
    add_column :de_thi, :so_cau_tong_hop, :integer
  end
end
