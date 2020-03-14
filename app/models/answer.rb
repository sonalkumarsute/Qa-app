class Answer < ApplicationRecord
  belongs_to :question
  has_many :following
  belongs_to :user
end
