class LiveDiscussionChannel < ApplicationCable::Channel
  def subscribed
    stream_from "livediscussion_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
