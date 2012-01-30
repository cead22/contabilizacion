class Usuario < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable,  :validatable,
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable,:encryptable

  validates :email, :presence => true

  validates_presence_of     :password, :on => :create
  validates_confirmation_of :password, :on => :create
  validates :password, :length => {:minimum => 6}, :on => :create

  validates :rol, :inclusion => {:in => %w(admin conector observador)}
  
  attr_accessible :email, :password_confirmation, :remember_me, :encrypted_password, :password_salt, :rol, :password, :presente, :numero

  has_many :centros
  
  def self.search(search)
    if search
      find(:all, :conditions => ['email LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end
  
  def self.numero_conector
    maximum(:numero) + 1
  end
  
end
