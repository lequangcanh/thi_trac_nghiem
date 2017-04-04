class CreateDeThi < ActiveRecord::Migration[5.0]
  def change
    create_table :de_thi do |t|
      t.integer :mon_hoc_id
      t.string :tieu_de
      t.integer :thoi_gian
      t.integer :so_cau_hoi
      t.text :theo_do_kho
      t.text :theo_chuong
      t.date :ngay_bat_dau_thi
      t.integer :trang_thai

      t.timestamps
    end

    add_foreign_key :de_thi, :mon_hoc, column: :mon_hoc_id
  end
end
