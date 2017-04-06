class ChangeForeignKeyToCauHoi < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key :cau_hoi, :chuong
    remove_column :cau_hoi, :chuong_id, :integer
    add_column :cau_hoi, :mon_hoc_id, :integer
    add_foreign_key :cau_hoi, :mon_hoc, column: :mon_hoc_id
    drop_table :chuong
  end
end
