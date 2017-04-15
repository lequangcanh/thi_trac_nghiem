class ChangeBaiThiChiTietCauHoi < ActiveRecord::Migration[5.0]
  def change
    remove_column :bai_thi_chi_tiet_cau_hoi, :noi_dung
    add_column :bai_thi_chi_tiet_cau_hoi, :cau_hoi_id, :integer
  end
end
