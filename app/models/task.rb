class Task < ActiveRecord::Base
  belongs_to :user
  has_one :finca, through: :user
  validates :title, presence: true
  validates_numericality_of :status, :in => 0..100
end
