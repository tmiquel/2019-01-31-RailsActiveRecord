class CreateDogs < ActiveRecord::Migration[5.2]
  def change
    create_table :dogs do |t|
      t.string :first_name
      t.timestamps
    end
    add_reference :dogs, :city, foreign_key: true
  end
end
