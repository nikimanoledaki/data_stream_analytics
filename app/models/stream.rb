# frozen_string_literal: true
require './app/models/batch.rb'

class Stream
  attr_reader :current_batch, :last_message

  def initialize
    @current_batch = []
    @last_message = nil
  end

  def checkpoint(new_message)
    if @last_message.nil? || (@last_message.minute == new_message.minute)
        @last_message = new_message
        current_batch(new_message)
    end
  end

  def current_batch(message)
    @current_batch.push(message)
  end
end
