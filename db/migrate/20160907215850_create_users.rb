class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.references :group, index: true
      t.references :home_place, index: true
      t.references :work_place, index: true
      t.timestamps
    end
    add_foreign_key :users, :groups, column: :group_id
    add_foreign_key :users, :places, column: :home_place_id
    add_foreign_key :users, :places, column: :work_place_id
  end
end
