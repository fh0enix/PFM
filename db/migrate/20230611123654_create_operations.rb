class CreateOperations < ActiveRecord::Migration[7.0]
  def change
    create_table :operations do |t|
      t.float :sum
      t.date :date
      t.string :description
      t.boolean :type
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
