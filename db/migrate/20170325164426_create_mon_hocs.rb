class CreateMonHocs < ActiveRecord::Migration[5.0]
  def change
    create_table :mon_hocs do |t|
      t.string :ten
      t.integer :so_tin_chi

      t.timestamps
    end
  end
end
