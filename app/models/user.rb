class User < ActiveRecord::Base
  has_one :profile
  has_many :images

  include Redis::Objects
  counter :viewer
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  attr_accessor :login
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:bdfzer], :authentication_keys => [:login]
  enum power: {
    user: 0,
    editor: 1,
    leader: 2,
    admin: 3
  }

  after_create do
    self.profile = Profile.new
  end

  def login=(login)
    @login = login
  end

  def login
    @login || self.username || self.email
  end

  def nickname
    (self.profile.nickname)?(self.profile.nickname ):(self.username)
  end

  def avatar
    self.profile.avatar.url || "demo/avatar.jpg"
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end
end
