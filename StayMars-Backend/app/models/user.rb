# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  username        :string
#  email           :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
    has_secure_password
    has_many :reviews
    validates :email, presence: true, uniqueness: true
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :username, presence: true, uniqueness: true
    validates :password,
              length: { minimum: 6 },
              if: -> { new_record? || !password.nil? }
end
