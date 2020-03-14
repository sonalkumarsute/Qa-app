class Question < ApplicationRecord
  has_many :answers
  belongs_to :topic
  has_many :following
  belongs_to :user
end
