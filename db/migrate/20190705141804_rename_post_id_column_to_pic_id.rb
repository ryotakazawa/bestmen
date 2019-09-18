# frozen_string_literal: true

class RenamePostIdColumnToPicId < ActiveRecord::Migration[5.1]
  def change
    rename_column :comments, :post_id, :pic_id
  end
end
