# frozen_string_literal: true

class AddProfileToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :profile, :string
  end
end
