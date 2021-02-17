class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #has_many :events
  #has_many :joins

  with_options presence: true do
    validates :name
    validates :email, format: { with: /\A.+?@.+\z/ }
    validates :password, confirmation: true, length: { minimum: 8 }, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
    validates :password_confirmation
    validates :tel, format: { with: /\A\d{11}\z/ }
  end
end
