require_relative 'constant_helper'
module TreeHelper
  include ConstantHelper
  def self.generate_random_binary_tree tree_length
          return BinaryTree.new nil, nil, rand(MAX_TREE_DATA_SIZE) if tree_length == 1
          BinaryTree.new(
              generate_random_binary_tree(tree_length -1), 
              generate_random_binary_tree(tree_length -1), 
              rand(MAX_TREE_DATA_SIZE)
          )
  end

end
