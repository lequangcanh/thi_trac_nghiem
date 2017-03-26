class CreateBaiThiChiTiets < ActiveRecord::Migration[5.0]
  def change
    create_table :bai_thi_chi_tiets do |t|
      t.integer :cau_hoi_id
      t.text :sinh_vien_chon
      t.string :dap_an
      t.references :bai_thi, foreign_key: true

      t.timestamps
    end
  end
end
