class CreateCauHoi < ActiveRecord::Migration[5.0]
  def change
    create_table :cau_hoi do |t|
      t.integer :chuong_id
      t.integer :giao_vien_id
      t.text :noi_dung
      t.integer :do_kho

      t.timestamps
    end

    add_foreign_key :cau_hoi, :chuong, column: :chuong_id
    add_foreign_key :cau_hoi, :giao_vien, column: :giao_vien_id
  end
end
