class CreateTripJoins < ActiveRecord::Migration[5.0]
  def change
    create_table :trip_joins do |t|
      t.references :user, index: true
      t.references :trip, index: true
      t.timestamps
    end
    add_foreign_key :trip_joins, :users
    add_foreign_key :trip_joins, :trips
  end
end
