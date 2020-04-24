# frozen_string_literal: true

class Article < ApplicationRecord
  has_many :comments
  has_many :article_categories
  has_many :categories, through: :article_categories
  belongs_to :user
  validates :title, presence: true, length: { minimum: 3 }
  validates :text, presence: true, length: { minimum: 3 }
  validates :user_id, presence: true
end
