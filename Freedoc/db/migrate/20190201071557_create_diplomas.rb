class CreateDiplomas < ActiveRecord::Migration[5.2]
  def change
    create_table :diplomas do |t|
      t.belongs_to :specialty, index: true
      t.references :recipient, index: true
      t.timestamps
    end
  end
end
