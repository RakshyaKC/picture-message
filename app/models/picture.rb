# frozen_string_literal: true

class Picture < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :messages
end
