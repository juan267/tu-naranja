class SubLote < ActiveRecord::Base
  belongs_to :lote
  belongs_to :farm
  has_many :production_reports
  validates :name, presence: true
  validates :fruit_variety, presence: true
  validates :plantation_date, presence: true
  validates :code, presence: true
  validates :tree_count, presence: true

  def last_month_production_amount
    self.production_reports.where('created_at BETWEEN ? AND ?', DateTime.now.in_time_zone.beginning_of_month, DateTime.now.in_time_zone.end_of_month).sum(:amount)
  end

end
