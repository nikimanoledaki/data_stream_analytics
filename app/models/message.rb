# frozen_string_literal: true

class Message
  attr_reader :value, :time

  def initialize(value)
    @value = value
    @time = validate_time
    @node_id = validate_node_id
  end

  def validate_time
    @time = Time.zone.local(@value['timestamp'])
  end

  def minute
    #  change this to be the date and time up until the minute
    @time.strftime('%M').to_i
  end

  def validate_node_id
    @value['node_id'].to_i
  end
end
