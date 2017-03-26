class CreateDeThiCauHois < ActiveRecord::Migration[5.0]
  def change
    create_table :de_thi_cau_hois do |t|
      t.references :de_thi, foreign_key: true
      t.references :cau_hoi, foreign_key: true

      t.timestamps
    end
  end
end
