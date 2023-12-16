class BookComment < ApplicationRecord
  
  belongs_to :user, dependent: :destroy
  belongs_to :book, dependent: :destroy
  
  validates :comment, presence: true
end
