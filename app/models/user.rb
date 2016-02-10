class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  has_many :user_roles

  accepts_nested_attributes_for :user_roles

  def admin?
    user_roles.each { |user_role| return true if user_role.admin? }
    false
  end

  def roles
    roles_array = []
    user_roles.each do |user_role|
      roles_array << user_role.role
    end
    roles_array
  end
end
