# frozen_string_literal: true

class ModifyForeignKeyOnComments < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :comments, :articles
    add_foreign_key :comments, :articles, dependent: :delete
  end
end
