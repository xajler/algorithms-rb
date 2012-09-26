module UnionHelper
  class << self
    def print(first_node, second_node, ids)
      puts ''
      puts "union(#{first_node}, #{second_node})"
      p ids
    end

    def print_connected(first_node, second_node, connected)
      puts ''
      puts "connected(#{first_node}, #{second_node}) => #{connected}"
    end
  end
end
