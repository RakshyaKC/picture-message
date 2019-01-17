# frozen_string_literal: true

class Message < ApplicationRecord
  belongs_to :sender, foreign_key: 'sender_id', class_name: 'User'
  belongs_to :receiver, foreign_key: 'receiver_id', class_name: 'User'
  belongs_to :picture

  # after_initialize :init
  # after_save :broadcast_save
end
