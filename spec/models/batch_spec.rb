require 'rails_helper'
require './lib/batch.rb'

RSpec.describe Batch do
    describe '#process' do
        it 'modifies statistic of node_id that sends new message in same batch' do
            message1 = double("message", "node_id" => 9223372036854775807, "value" => 1 )
            subject.process(message1)
            message2 = double("message", "node_id" => 9223372036854775807, "value" => 2 )
            subject.process(message2)
            message3 = double("message", "node_id" => 9223372036854775807, "value" => 3)
            expect(subject.process(message3)).to be_a(Statistic)
        end
    end

    describe '#update_statistics' do
        it 'creates a new statistic instance in database' do
            message = double("message", "node_id" => 9223372036854775807, "value" => 1 )
            expect(subject.process(message)).to be_a(Statistic)
        end
    end
end
