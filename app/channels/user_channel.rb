class UserChannel < ApplicationCable::Channel
  def subscribed
    stream_for current_user
  end
end


# user = User.find(params[:id])
# UserChannel.broadcast_to(user, { notification: 'Test message' })
