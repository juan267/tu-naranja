class Farm < ActiveRecord::Base
  has_many :employees, class_name: "User"
  has_many :lotes
  belongs_to :admin, class_name: "User"
end
