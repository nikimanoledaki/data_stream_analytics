# frozen_string_literal: true

require './lib/batch.rb'

class Stream
  attr_reader :current_batch, :minute, :batch_type

  def initialize(batch_type = Batch)
    @batch_type = batch_type
    new_batch
    @minute = nil
  end

  def new_batch
    @current_batch = @batch_type.new
  end

  def checkpoint(new_message)
    new_minute if same_minute?(new_message) == false
    @minute = new_message.minute
    @current_batch.process(new_message)
  end

  def new_minute
    @current_batch.update_statistics
    new_batch
  end

  def same_minute?(new_message)
    @last_message.nil? || (@minute == new_message.minute)
  end
end
