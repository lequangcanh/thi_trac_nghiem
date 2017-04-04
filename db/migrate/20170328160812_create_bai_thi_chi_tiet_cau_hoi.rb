class CreateBaiThiChiTietCauHoi < ActiveRecord::Migration[5.0]
  def change
    create_table :bai_thi_chi_tiet_cau_hoi do |t|
      t.integer :bai_thi_id
      t.text :noi_dung
      t.boolean :tra_loi_dung

      t.timestamps
    end

    add_foreign_key :bai_thi_chi_tiet_cau_hoi, :bai_thi, column: :bai_thi_id
  end
end
