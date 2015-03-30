class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.text :description
      t.text :result
      t.integer :status, default: 0
      t.integer :priority, null: false
      t.belongs_to :user, index: true
      t.datetime :end_date

      t.timestamps null: false
    end
  end
end
