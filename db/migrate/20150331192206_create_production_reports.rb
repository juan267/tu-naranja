class CreateProductionReports < ActiveRecord::Migration
  def change
    create_table :production_reports do |t|
      t.float :amount , null: false
      t.belongs_to :sub_lote

      t.timestamps null: false
    end
  end
end
