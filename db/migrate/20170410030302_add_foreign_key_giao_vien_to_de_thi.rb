class AddForeignKeyGiaoVienToDeThi < ActiveRecord::Migration[5.0]
  def change
    add_column :de_thi, :giao_vien_id, :integer
    add_foreign_key :de_thi, :giao_vien, column: :giao_vien_id
  end
end
