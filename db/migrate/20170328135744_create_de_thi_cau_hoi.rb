class CreateDeThiCauHoi < ActiveRecord::Migration[5.0]
  def change
    create_table :de_thi_cau_hoi do |t|
      t.integer :de_thi_id
      t.integer :cau_hoi_id

      t.timestamps
    end

    add_foreign_key :de_thi_cau_hoi, :de_thi, column: :de_thi_id
    add_foreign_key :de_thi_cau_hoi, :cau_hoi, column: :cau_hoi_id
  end
end
