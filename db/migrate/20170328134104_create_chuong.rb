class CreateChuong < ActiveRecord::Migration[5.0]
  def change
    create_table :chuong do |t|
      t.string :ten
      t.text :noi_dung_chinh
      t.integer :mon_hoc_id

      t.timestamps
    end

    add_foreign_key :chuong, :mon_hoc, column: :mon_hoc_id
  end
end
