require_relative 'data_structures/binary_tree'
require_relative 'helpers/tree_helper'
require 'pry'
# require 'logger' Could have added this for more show off. But controlling myself ;)

class BinaryTreeTraversal

	def self.pre_order_traversal binary_tree, return_data=[]
		# Pre-order traversal sequence => Root Node -> Left Node -> Right Node
		return if binary_tree.nil?
		return_data = [] if return_data.nil?
		return_data << binary_tree.data
		pre_order_traversal binary_tree.left_node, return_data
		pre_order_traversal binary_tree.right_node, return_data
		return_data
	end

	def self.post_order_traversal binary_tree, return_data=[]
		# Post-order traversal sequence => Left Node -> Right Node -> Root Node
		return if binary_tree.nil?
		post_order_traversal binary_tree.left_node, return_data
		post_order_traversal binary_tree.right_node, return_data
		return_data << binary_tree.data
	end

	def self.in_order_traversal binary_tree, return_data=[]
		# In-order traversal sequence => Right Node -> Root Node -> Left Node
		return if binary_tree.nil?
		in_order_traversal binary_tree.right_node, return_data
		return_data << binary_tree.data
		in_order_traversal binary_tree.left_node, return_data
        return_data
	end
	
end
