class QuickUnion
  attr_reader :ids

  def initialize(range)
    @ids = *(0..range)
  end

  def connected?(first_node, second_node)
    root(first_node) == root(second_node)
  end

  def union(first_node, second_node)
    first_node_id = root(first_node)
    second_node_id = root(second_node)

    @ids[first_node_id] = second_node_id
  end

  private
  def root(index)
    while index != @ids[index]
      index = @ids[index]
    end

    index
  end
end
