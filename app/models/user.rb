class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :bikes
  # validates :first_name, :last_name, format: { with "/^[a-z]+$/i" }
  # validates :postcode, format: { with "^[a-zA-Z0-9]*$",
  # message: "has to be a UK postcode"
  # }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
