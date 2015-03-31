class SubLote < ActiveRecord::Base
  belongs_to :lote
  has_many :production_reports
  validates :name, presence: true
  validates :fruit_variety, presence: true
  validates :plantation_date, presence: true
  validates :code, presence: true
  validates :tree_count, presence: true
end
