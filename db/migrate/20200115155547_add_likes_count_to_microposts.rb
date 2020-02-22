# frozen_string_literal: true

class AddLikesCountToMicroposts < ActiveRecord::Migration[5.1]
  class MigrationUser < ApplicationRecord
    self.table_name = :microposts
  end

  def up
    _up
  rescue StandardError => e
    _down
    raise e
  end

  def down
    _down
  end

  private

  def _up
    MigrationUser.reset_column_information

    unless column_exists? :microposts, :likes_count
      add_column :microposts, :likes_count, :integer, null: false, default: 0
    end
  end

  def _down
    MigrationUser.reset_column_information

    if column_exists? :microposts, :likes_count
      remove_column :microposts, :likes_count
    end
  end
end
