class Heroines < ActiveRecord::Migration[5.1]
  def change
    create_table :heroines do |t|
      t.string :name
      t.string :super_name
      t.integer :power_id

      t.timestamps
    end
  end
end
