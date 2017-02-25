require_relative 'base_tree'
class BinaryTree < BaseTree

    attr_accessor :left_node, :right_node
     def initialize(left_node, right_node, data)
        self.left_node = left_node
        self.right_node = right_node
        super data
    end
end
