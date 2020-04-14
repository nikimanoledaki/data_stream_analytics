class Message
  attr_reader :data, :time

  def initialize(data)
      @data = data
      validate_time
  end

  def validate_time        
      @time = Time.new(@data["timestamp"])
  end

  def minute
      @time.strftime('%M').to_i
  end

  def node_id
      @data["node_id"].to_i
  end

  def value
      @data["value"].to_i
  end

end
