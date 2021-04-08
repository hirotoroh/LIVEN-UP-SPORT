class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :sport
    validates :gender
    validates :age
  end

  enum gender: { gender_private: 0, male: 1, female: 2, others: 3 }
end
