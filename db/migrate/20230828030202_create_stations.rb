class CreateStations < ActiveRecord::Migration[6.0]
  def change
    create_table :stations do |t|
      t.string :route
      t.string :station
      t.string :walking_minutes
      t.references :property, null: false, foreign_key: true

      t.timestamps
    end
  end
end
