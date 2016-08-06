class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :title
      t.integer :size
      t.integer :bedroom_id
      t.integer :location_id
      t.text :description

      t.timestamps null: false
    end
  end
end
