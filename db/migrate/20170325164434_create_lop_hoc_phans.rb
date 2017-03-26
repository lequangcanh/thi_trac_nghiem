class CreateLopHocPhans < ActiveRecord::Migration[5.0]
  def change
    create_table :lop_hoc_phans do |t|
      t.string :ten
      t.integer :trang_thai
      t.references :giang_vien, foreign_key: true
      t.references :mon_hoc, foreign_key: true

      t.timestamps
    end
  end
end
