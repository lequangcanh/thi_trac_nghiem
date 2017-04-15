class AddTrangThaiToBaiThi < ActiveRecord::Migration[5.0]
  def change
    add_column :bai_thi, :trang_thai, :integer, default: 0
  end
end
