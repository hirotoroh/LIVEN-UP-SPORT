class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tweets
  has_many :comments

  with_options presence: true do
    validates :nickname
    validates :sport
    validates :gender, format: { with: /\A[一-龥]+\z/}
    validates :age, format: { with: /\A[0-9]+\z/ }
  end

end
