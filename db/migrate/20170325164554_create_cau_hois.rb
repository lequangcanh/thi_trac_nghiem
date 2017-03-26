class CreateCauHois < ActiveRecord::Migration[5.0]
  def change
    create_table :cau_hois do |t|
      t.text :noi_dung
      t.integer :do_kho
      t.references :chuong, foreign_key: true
      t.references :giang_vien, foreign_key: true

      t.timestamps
    end
  end
end
