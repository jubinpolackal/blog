# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :article, dependent: :destroy
  validates :body, presence: true, length: { minimum: 5 }
  validates :commenter, presence: true, length: { minimum: 3, maximum: 100 }
end
