class Message
    attr_reader :value, :time

    def initialize(value)
        @value = value
        @time = ""
    end

    def validate_time
        # return Time.now if timestamp == null
        
        @time = Time.new(@value["timestamp"])
    end

end
