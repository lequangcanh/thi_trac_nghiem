class AddXemKetQuaToDeThi < ActiveRecord::Migration[5.0]
  def change
    add_column :de_thi, :xem_ket_qua, :boolean, default: false
  end
end
