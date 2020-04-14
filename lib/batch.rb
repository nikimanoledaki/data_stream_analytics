require './app/models/node.rb'
require './app/models/statistic.rb'

class Batch
    attr_reader :stats, :node

    def initialize
        @stats = {}
        @node = nil
    end

    def process(message)
        node_id, value = message.node_id, message.value
        validate_node(node_id)
        if @stats[node_id] == nil
            @stats[node_id] = { 
                min_value: value, max_value: value, 
                average_value: value, total: value, count: 1
            }
        else 
            new_min(node_id, value)
            new_max(node_id, value)
            new_average(node_id, value)     
        end
        update_statistic(node_id)
    end

    def validate_node(node_id)
        if node_exists?(node_id)
            @node = node_exists?(node_id)
        else
            @node = create_node(node_id) 
        end
    end

    def node_exists?(id, node = Node)
        node.find_by(node_id: id)
    end

    def create_node(id, node = Node)
        @node = node.create(node_id: id)
    end

    def new_min(node_id, value)
        return value unless @stats[node_id][:min_value] > value
        @stats[node_id][:min_value] = value
    end

    def new_max(node_id, value)
        return value unless (value > @stats[node_id][:max_value])
        @stats[node_id][:max_value] = value
    end

    def new_average(node_id, value)
        count = (@stats[node_id][:count] += 1)
        total = (@stats[node_id][:total] += value)
        new_average = (total).to_f / count
        @stats[node_id][:average_value] = new_average
    end

    def update_statistic(node_id)
        statistic = {
            minimum_value: @stats[node_id][:min_value],
            maximum_value: @stats[node_id][:max_value],
            average_value: @stats[node_id][:average_value]
        }
        @node.statistics.create(statistic)
    end

end
