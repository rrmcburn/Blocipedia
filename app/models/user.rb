class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :wikis

  before_save      { self.email = email.downcase }

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  after_create :send_mymailer_emails

  after_initialize :check_role

  enum role: [:standard, :premium, :admin]

  def check_role
    self.role ||= :standard
  end


  private

  def send_mymailer_emails
    MyMailer.new_registration(self).deliver_now
  end

end
