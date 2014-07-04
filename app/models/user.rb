class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:bdfzer], :authentication_keys => [:username]
  enum power: {
    user: 0,
    editor: 1,
    leader: 2,
    admin: 3
  } 
end
