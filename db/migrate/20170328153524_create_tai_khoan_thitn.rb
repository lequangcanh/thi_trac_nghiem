class CreateTaiKhoanThitn < ActiveRecord::Migration[5.0]
  def change
    create_table :tai_khoan_thitn do |t|
      t.string :ma_nguoi_dung
      t.string :password
      t.string :nguoi_dung_type
      t.integer :nguoi_dung_id

      t.timestamps
    end
  end
end
