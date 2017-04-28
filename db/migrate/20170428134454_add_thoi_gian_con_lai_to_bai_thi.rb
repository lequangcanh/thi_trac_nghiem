class AddThoiGianConLaiToBaiThi < ActiveRecord::Migration[5.0]
  def change
    add_column :bai_thi, :thoi_gian_con_lai, :integer
  end
end
