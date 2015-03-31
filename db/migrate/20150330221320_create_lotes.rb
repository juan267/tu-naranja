class CreateLotes < ActiveRecord::Migration
  def change
    create_table :lotes do |t|
      t.string :name
      t.float :size
      t.string :fruit_type
      t.belongs_to :farm

      t.timestamps null: false
    end
  end
end
