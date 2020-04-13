# frozen_string_literal: true

require './app/models/message.rb'
require './app/models/stream.rb'

class NodeDataConsumer < Racecar::Consumer
  subscribes_to 'node-data', start_from_beginning: false
  attr_reader :stream

  def initialize(stream = Stream.new)
    @stream = stream
  end

  def process(message, new_message = Message)
    data = JSON.parse(message)
    @stream.checkpoint(new_message.new(data['value']))
  end
end
