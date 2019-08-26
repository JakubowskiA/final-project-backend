class CreateEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :entries do |t|
      t.integer :pre_level
      t.text :stressors
      t.text :evaluation
      t.text :action
      t.text :positivity
      t.integer :post_level
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
