class User < ActiveRecord::Base
  # rails g model user email:string password_digest:string

  #has_many  :knowledges, :through => :user_knowledge_states
  #has_many  :user_knowledge_states
  has_many  :lesson_plantations, :through => :logs
  has_many  :knowledges, :through => :logs
  has_many  :logs

  has_secure_password
  validates_presence_of :email, :on => :create
  validates_presence_of :password, :on => :create
  #validates_presence_of :user_name, :on => :create
  before_create { generate_token(:auth_token) }
  
  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end
  
  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end
  
end
