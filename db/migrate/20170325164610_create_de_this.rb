class CreateDeThis < ActiveRecord::Migration[5.0]
  def change
    create_table :de_this do |t|
      t.string :tieu_de
      t.integer :thoi_gian
      t.integer :so_cau_hoi
      t.text :theo_do_kho
      t.text :theo_chuong
      t.date :ngay_bat_dau_thi
      t.integer :trang_thai
      t.references :mon_hoc, foreign_key: true

      t.timestamps
    end
  end
end
