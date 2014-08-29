class User < ActiveRecord::Base
  has_one :profile
  has_many :images
  has_many :articles
  has_many :musics
  has_many :videos
  has_many :dmvideos

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
    self.follower = []
    self.following = []
    self.profile = Profile.new
    self.profile.sex = "unknow"
    self.profile.save
    self.save
  end

  def follow(user)
    self.following += [user.id]
    self.following.uniq!
    user.follower += [self.id]
    user.follower.uniq!
    self.save
    user.save
  end

  def unfollow(user)
    self.following -= [user.id]
    self.following.uniq!
    user.follower -= [self.id]
    user.follower.uniq!
    self.save
    user.save
  end

  def is_verify?
    !!(pku_id)
  end

  def is_followed_by(user)
    self.follower.include? user.id
  end

  def is_following(user)
    user.follower.include? self.id
  end

  def like?(something)
    something.score.liker.include? id
  end

  def favor?(something)
    something.score.favor.include? id
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
