class CreateLopHocPhans < ActiveRecord::Migration[5.0]
  def change
    create_table :lop_hoc_phans do |t|
      t.string :ten
      t.integer :trang_thai

      t.timestamps
    end
  end
end
