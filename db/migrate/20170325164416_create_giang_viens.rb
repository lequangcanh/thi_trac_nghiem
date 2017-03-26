class CreateGiangViens < ActiveRecord::Migration[5.0]
  def change
    create_table :giang_viens do |t|
      t.string :msgv
      t.string :password
      t.string :ho
      t.string :ten
      t.string :email
      t.string :sdt

      t.timestamps
    end
  end
end
