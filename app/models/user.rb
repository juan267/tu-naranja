class User < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  belongs_to :role
  has_many :farms, foreign_key: "admin_id"
  has_many :tasks
  belongs_to :farm
  validates :name, presence: true
  validates :email, presence: true, length: {maximum: 255}, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable, :timeoutable
  validate :farm_association

  def role?(status)
    unless self.role == nil
      self.role.name == status.to_s.camelize
    end
  end

  private
  def farm_association
    if self.role?(:admin)
      errors.add(:rol, "Admins no pertencen a fincas")  if self.farm
    else
      errors.add(:rol, "Empleados no pueden ser dueños de fincas") if farms.any?
    end
  end
end
