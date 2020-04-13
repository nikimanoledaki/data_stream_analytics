require 'rails_helper'

RSpec.describe Message, type: :model do
    describe '#validate_timestamp' do
        it 'returns the timestamp as a Time object' do
            message = { "node_id" => 18446744073709551615, "timestamp" => "2020-01-03T01:19:13 -00:00", "value" => 1 }
            subject = Message.new(message)
            expect(subject.validate_time).to be_a(Time)
        end
    end

    describe '#minute' do
        it 'returns the minute as an integer' do
            message = { "node_id" => 18446744073709551615, "timestamp" => "2020-01-03T01:19:13 -00:00", "value" => 1 }
            subject = Message.new(message)
            expect(subject.minute).to eq 0
        end
    end
end
