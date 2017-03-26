class CreateSinhViens < ActiveRecord::Migration[5.0]
  def change
    create_table :sinh_viens do |t|
      t.string :mssv
      t.string :password
      t.string :ho
      t.string :ten
      t.string :ngay_sinh
      t.string :cmnd

      t.timestamps
    end
  end
end
