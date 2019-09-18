# frozen_string_literal: true

class AddAdminFlgToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :admin_flg, :boolean
  end
end
