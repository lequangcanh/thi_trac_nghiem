class AddDeThiIdToLopMonHoc < ActiveRecord::Migration[5.0]
  def change
    add_column :lop_mon_hoc, :de_thi_gk_id, :integer
    add_column :lop_mon_hoc, :de_thi_ck_id, :integer
  end
end
