# frozen_string_literal: true

require './app/models/node.rb'
require './app/models/statistic.rb'

class Batch
  attr_reader :stats, :node

  def initialize
    @stats = {}
    @node = nil
  end

  def node_exists?(id, node = Node)
    node.find_by(node_id: id)
  end

  def create_node(id, node = Node)
    @node = node.create(node_id: id)
  end

  def process(message)
    node_id = message.node_id
    value = message.value

    @node = node_exists?(node_id) || create_node(node_id)

    if @stats[node_id].nil?
      @stats[node_id] = { min_value: value, max_value: value, average_value: value, count: 1 }
    else
      statistic = { minimum_value: new_min(node_id, value),
                    maximum_value: new_max(node_id, value),
                    average_value: new_average(node_id, value) }
      update_statistic(statistic)
    end
    @stats[node_id]
  end

  def new_min(node_id, value)
    if @stats[node_id][:min_value] > value
      @stats[node_id][:min_value] = value
    else
      value
    end
  end

  def new_max(node_id, value)
    @stats[node_id][:max_value] = value if value > @stats[node_id][:max_value]
  end

  def new_average(node_id, value)
    @stats[node_id][:count] += 1
    new_average = (@stats[node_id][:average_value] + value).to_f / @stats[node_id][:count]
    @stats[node_id][:average_value] = new_average
  end

  def update_statistic(statistic)
    @node.statistics.create(statistic)
  end
end
