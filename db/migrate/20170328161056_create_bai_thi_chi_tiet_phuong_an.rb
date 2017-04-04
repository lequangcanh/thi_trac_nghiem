class CreateBaiThiChiTietPhuongAn < ActiveRecord::Migration[5.0]
  def change
    create_table :bai_thi_chi_tiet_phuong_an do |t|
      t.integer :bai_thi_chi_tiet_cau_hoi_id
      t.text :phuong_an
      t.boolean :thi_sinh_chon
      t.boolean :dap_an_dung

      t.timestamps
    end

    add_foreign_key :bai_thi_chi_tiet_phuong_an, :bai_thi_chi_tiet_cau_hoi, column: :bai_thi_chi_tiet_cau_hoi_id
  end
end
