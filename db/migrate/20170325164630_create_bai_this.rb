class CreateBaiThis < ActiveRecord::Migration[5.0]
  def change
    create_table :bai_this do |t|
      t.date :gio_bat_dat
      t.date :gio_nop_bai
      t.integer :so_cau_dung
      t.float :tong_diem
      t.references :de_thi, foreign_key: true
      t.references :sinh_vien, foreign_key: true

      t.timestamps
    end
  end
end
