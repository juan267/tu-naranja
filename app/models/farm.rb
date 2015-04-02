class Farm < ActiveRecord::Base
  has_many :lotes
  has_many :sub_lotes,through: :lotes
  has_many :employees, class_name: "User"
  has_many :tasks, through: :employees
  belongs_to :admin, class_name: "User"
end
