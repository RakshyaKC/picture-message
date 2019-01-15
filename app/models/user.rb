# frozen_string_literal: true

class User < ApplicationRecord
  include Authentication
  has_many :examples
  has_many :sent_messages, foreign_key: 'sender_id', class_name: 'Message'
  has_many :received_messages, foreign_key: 'receiver_id', class_name: 'Message'

  # has_many :followers, through: :follower_follows, source: :followers
  # has_many :follower_follows, foreign_key: :followee_id, class_name: 'Follow'
  # has_many :followers, through: :followee_follows, source: :followee
  # has_many :followee_follows, foreign_key: :follower_id, class_name: 'Follow'
end
