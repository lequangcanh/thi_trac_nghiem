class CreateChuongs < ActiveRecord::Migration[5.0]
  def change
    create_table :chuongs do |t|
      t.string :ten
      t.text :noi_dung_chinh
      t.references :mon_hoc, foreign_key: true

      t.timestamps
    end
  end
end
