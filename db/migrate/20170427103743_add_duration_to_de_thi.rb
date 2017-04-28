class AddDurationToDeThi < ActiveRecord::Migration[5.0]
  def change
    add_column :de_thi, :thoi_gian_mo_de, :datetime
    add_column :de_thi, :thoi_gian_dong_de, :datetime
  end
end
