class CreateBedrooms < ActiveRecord::Migration
  def change
    create_table :bedrooms do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
