class MessagesController < ProtectedController
  before_action :set_message, only: [:show, :update, :destroy]

  # GET /messages
  def index
    @messages = current_user.received_messages.all
    render json: @messages
  end
    # @sent_messages = current_user.sent_messages.all
    # render json: {
    #   received_messages: @received_messages
    #   # sent_messages: @sent_messages
    # }

  # GET /messages/1
  def show
    render json: @message
  end

  # POST /messages
  def create
    # message_params == { picture_id: 1, receiver_id: 2 }
    # @message = Message.new(picture_id: 1, receiver_id: 2, sender_id: current_user.id)
    @message = Message.new(message_params)
    @message.sender = current_user

    if @message.save
      render json: @message, status: :created, location: @message
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /messages/1
  def update
    if @message.update(message_params)
      render json: @message
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  # DELETE /messages/1
  def destroy
    @message.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def message_params
      params.require(:message).permit(:receiver_id, :picture_id, :seen)
    end
end
