class User < ApplicationRecord
  attr_writer :login
  has_many :lessons 
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, authentication_keys: [:login]
  validates :name, uniqueness: true 

  def login
    @login || self.name
  end
  def email_required?
    false
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
      if (login = conditions.delete(:login))
        where(conditions.to_h).where(["lower(name) = :value OR lower(email) = :value", { :value => login.downcase }]).first
      elsif conditions.has_key?(:name) || conditions.has_key?(:email)
        where(conditions.to_h).first
      end 
    
  end
end
