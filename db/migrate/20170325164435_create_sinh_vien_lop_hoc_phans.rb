class CreateSinhVienLopHocPhans < ActiveRecord::Migration[5.0]
  def change
    create_table :sinh_vien_lop_hoc_phans do |t|
      t.references :sinh_vien, foreign_key: true
      t.references :lop_hoc_phan, foreign_key: true
      t.boolean :cam_thi

      t.timestamps
    end
  end
end
