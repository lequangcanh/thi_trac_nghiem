class CreateChuyenMon < ActiveRecord::Migration[5.0]
  def change
    create_table :chuyen_mon do |t|
      t.integer :giao_vien_id
      t.integer :mon_hoc_id

      t.timestamps
    end

    add_foreign_key :chuyen_mon, :giao_vien, column: :giao_vien_id
    add_foreign_key :chuyen_mon, :mon_hoc, column: :mon_hoc_id
  end
end
