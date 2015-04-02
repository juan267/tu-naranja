class Task < ActiveRecord::Base
  belongs_to :user
  delegate :farm , to: :user
  validates :title, presence: true
  validates :priority, presence: true
  validates_numericality_of :status, :in => 0..100
end
