class AddDeThiThuToLopHocPhan < ActiveRecord::Migration[5.0]
  def change
    add_column :lop_mon_hoc, :de_thi_thu_id, :integer
    remove_column :de_thi, :trang_thai
    remove_column :de_thi, :ngay_bat_dau_thi
  end
end
