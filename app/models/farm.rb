class Farm < ActiveRecord::Base
  has_many :employees, class_name: "User"
  belongs_to :admin, class_name: "User"
end
