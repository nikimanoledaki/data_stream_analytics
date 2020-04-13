class Message
    attr_reader :value, :time

    def initialize(value)
        @value = value
        @time = validate_time
        @node_id = validate_node_id
    end

    def validate_time
        # return Time.now if timestamp == null
        @time = Time.new(@value["timestamp"])
    end

    def minute
        @time.strftime('%M').to_i
    end

    def validate_node_id
        @value["node_id"].to_i
    end

end
