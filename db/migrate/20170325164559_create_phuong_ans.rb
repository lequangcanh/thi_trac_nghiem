class CreatePhuongAns < ActiveRecord::Migration[5.0]
  def change
    create_table :phuong_ans do |t|
      t.text :phuong_an
      t.boolean :dap_an
      t.references :cau_hoi, foreign_key: true

      t.timestamps
    end
  end
end
