class QuickFind
  attr_reader :ids

  def initialize(range)
    @ids = *(0..range)
  end

  def connected?(first_node, second_node)
    @ids[first_node] == @ids[second_node]
  end

  def union(first_node, second_node)
    first_node_id = @ids[first_node]
    second_node_id = @ids[second_node]

    index = 0
    @ids.each do |node|
      @ids[index] = second_node_id if node == first_node_id
      index += 1
    end
  end
end
