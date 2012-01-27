class Usuario < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable,:encryptable

  validates :email, :uniqueness => true
  validates :username, :presence => true, :uniqueness => true
  validates :password, :length => {:minimum => 5}
  validates :password, :confirmation => true
  attr_accessible :username, :email, :password_confirmation, :remember_me, :encrypted_password, :password_salt, :rol, :password

  has_many :centros
end
