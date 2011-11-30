class User < ActiveRecord::Base
  has_many :authentications
  has_many :shows
  has_many :events
  has_many :chats

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name

  validates :first_name, :last_name, :presence => true

  def apply_omniauth(omniauth)
    case omniauth['provider']
    when "facebook"
      self.first_name = omniauth['user_info']['first_name'] if first_name.blank?
      self.last_name = omniauth['user_info']['last_name'] if last_name.blank?
    when "twitter"
      self.full_name = omniauth['user_info']['name'] if first_name.blank?
    end
    self.email = omniauth['user_info']['email'] if email.blank?
    authentications.build(:provider => omniauth['provider'], :uid => omniauth['uid'])
  end

  def password_required?
    (authentications.empty? || !password.blank?) && super
  end

  def full_name
    [first_name, last_name].join(' ')
  end

  def full_name=(name)
    split = name.split(" ", 2)
    self.first_name = split.first
    self.last_name = split.last
  end
end
