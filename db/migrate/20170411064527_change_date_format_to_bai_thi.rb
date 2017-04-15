class ChangeDateFormatToBaiThi < ActiveRecord::Migration[5.0]
  def change
    change_column :bai_thi, :gio_bat_dau, :datetime
    change_column :bai_thi, :gio_nop_bai, :datetime
  end
end
