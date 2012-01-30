class Usuario < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable,  :validatable,
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable,:encryptable

  validates :username, :presence => true, :uniqueness => true

  validates_presence_of     :password, :on => :create
  validates_confirmation_of :password, :on => :create
  validates :password, :length => {:minimum => 6}, :on => :create

  validates :rol, :inclusion => {:in => %w(admin conector observador)}
  
  attr_accessible :username, :email, :password_confirmation, :remember_me, :encrypted_password, :password_salt, :rol, :password, :presente

  has_many :centros
end
