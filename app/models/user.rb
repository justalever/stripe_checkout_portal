class User < ApplicationRecord
  pay_customer

  has_person_name

  has_many :subscriptions, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def subscribed?
    subscriptions.where(status: 'active').any?
  end
end
