# frozen_string_literal: true

class AddInReplyToToMicroposts < ActiveRecord::Migration[5.1]
  def change
    add_column :microposts, :in_reply_to, :integer
    add_index  :microposts, :in_reply_to
  end
end
