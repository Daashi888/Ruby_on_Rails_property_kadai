class CreateProperties < ActiveRecord::Migration[6.0]
  def change
    create_table :properties do |t|
      t.string :property_name
      t.string :rent
      t.text :address
      t.string :property
      t.string :age
      t.text :remarks

      t.timestamps
    end
  end
end
