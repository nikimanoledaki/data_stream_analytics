require 'rails_helper'

RSpec.describe Batch, type: :model do
    describe '#process' do
        it 'modifies statistics of node_id that is already in batch' do
            message1 = double("message", "node_id" => 9223372036854775807, "value" => 1 )
            subject.process(message1)
            message2 = double("message", "node_id" => 9223372036854775807, "value" => 2 )
            expect(subject.process(message2)).to eq({ min_value: 1, max_value: 2, average_value: 1.5, count: 2})
        end
    end
end
