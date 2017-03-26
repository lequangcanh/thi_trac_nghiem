class CreateChuyenMons < ActiveRecord::Migration[5.0]
  def change
    create_table :chuyen_mons do |t|
      t.references :giang_vien, foreign_key: true
      t.references :mon_hoc, foreign_key: true

      t.timestamps
    end
  end
end
