class CreatePhuongAn < ActiveRecord::Migration[5.0]
  def change
    create_table :phuong_an do |t|
      t.integer :cau_hoi_id
      t.text :phuong_an
      t.boolean :dap_an_dung

      t.timestamps
    end

    add_foreign_key :phuong_an, :cau_hoi, column: :cau_hoi_id
  end
end
