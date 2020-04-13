class Message
    attr_reader :value, :time

    def initialize(value)
        @value = value
        @time = validate_time
    end

    def validate_time
        # return Time.now if timestamp == null
        @time = Time.new(@value["timestamp"])
    end

    def minute
        @time.strftime('%M').to_i
    end

end
