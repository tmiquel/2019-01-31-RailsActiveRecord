class CreateStrolls < ActiveRecord::Migration[5.2]
  def change
    create_table :strolls do |t|
      t.belongs_to :dog, index: true
      t.belongs_to :dog_sitter, index: true
      t.datetime :date
      t.timestamps
    end
    add_reference :strolls, :city, foreign_key: true
  end
end
