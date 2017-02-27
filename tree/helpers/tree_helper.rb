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

  def self.binary_tree_height binary_tree, height=0
    return 0 if binary_tree.nil?
    left_height = binary_tree_height binary_tree.left_node, height
    right_height = binary_tree_height binary_tree.right_node, height

    if (left_height > right_height)
      return left_height + 1
    else
      return right_height + 1
    end
  end

end
