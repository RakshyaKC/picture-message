class MessageSerializer < ActiveModel::Serializer
  attributes :id, :seen
  has_one :sender
  has_one :receiver
  has_one :picture
end
