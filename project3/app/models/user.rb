class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
  # Via - https://stackoverflow.com/questions/9165843/devise-not-requiring-email/18017413#18017413
  def email_required?
    false
  end

  def email_changed?
    false
  end

end
