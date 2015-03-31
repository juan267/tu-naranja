class Lote < ActiveRecord::Base
  belongs_to :farm
  has_many :sub_lotes
  validates :name, presence: true
  validates :size, presence: true
  validates :fruit_type, presence: true
end
