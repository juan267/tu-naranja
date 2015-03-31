class CreateSubLotes < ActiveRecord::Migration
  def change
    create_table :sub_lotes do |t|
      t.string :name
      t.string :code
      t.integer :age
      t.integer :tree_count
      t.string :fruit_variety
      t.belongs_to :lote, index: true

      t.timestamps null: false
    end
  end
end
