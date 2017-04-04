class CreateBaiThi < ActiveRecord::Migration[5.0]
  def change
    create_table :bai_thi do |t|
      t.integer :de_thi_id
      t.integer :sinh_vien_id
      t.date :gio_bat_dau
      t.date :gio_nop_bai
      t.integer :so_cau_dung
      t.float :tong_diem

      t.timestamps
    end

    add_foreign_key :bai_thi, :de_thi, column: :de_thi_id
    add_foreign_key :bai_thi, :sinh_vien, column: :sinh_vien_id
  end
end
