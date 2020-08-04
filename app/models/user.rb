class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :recoverable, :registerable,
  # :timeoutable, :validatable and :omniauthable
  devise :database_authenticatable, :rememberable, :trackable,
   :authentication_keys => [:username]

end
