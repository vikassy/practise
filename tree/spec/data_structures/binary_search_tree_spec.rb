require_relative '../../data_structures/binary_search_tree'
require_relative '../../helpers/spec_helper'
require 'pry'

class BinarySearchTreeSpec

    attr_accessor :binary_search_tree

    def initialize binary_search_tree
        self.binary_search_tree = binary_search_tree
    end

    def insert_node_spec
    	self.binary_search_tree = BinarySearchTree.insert_node(50)
		SpecHelper::assert_equals?(binary_search_tree.data, 50)

    	self.binary_search_tree = BinarySearchTree.insert_node(40, self.binary_search_tree)
    	SpecHelper::assert_equals?(binary_search_tree.left_node.data, 40)

    	self.binary_search_tree = BinarySearchTree.insert_node(30, self.binary_search_tree)
    	SpecHelper::assert_equals?(binary_search_tree.left_node.left_node.data, 30)

    	self.binary_search_tree = BinarySearchTree.insert_node(70, self.binary_search_tree)
    	SpecHelper::assert_equals?(binary_search_tree.right_node.data, 70)

    	self.binary_search_tree = BinarySearchTree.insert_node(10, self.binary_search_tree)
    	SpecHelper::assert_equals?(binary_search_tree.left_node.left_node.left_node.data, 10)

    	self.binary_search_tree = BinarySearchTree.insert_node(60, self.binary_search_tree)
    	SpecHelper::assert_equals?(binary_search_tree.right_node.left_node.data, 60)

    	self.binary_search_tree = BinarySearchTree.insert_node(80, self.binary_search_tree)
    	SpecHelper::assert_equals?(binary_search_tree.right_node.right_node.data, 80)
    	p "[Passed] Insertion into the binary search tree."
    end

    def search_node_spec
    	output_node = BinarySearchTree.search_node(60, self.binary_search_tree)
    	SpecHelper::assert_equals?(output_node, binary_search_tree.right_node.left_node)

    	output_node = BinarySearchTree.search_node(30, self.binary_search_tree)
    	SpecHelper::assert_equals?(output_node, binary_search_tree.left_node.left_node)

    	output_node = BinarySearchTree.search_node(35, self.binary_search_tree)
    	SpecHelper::assert_equals?(output_node, nil)
    	p "[Passed] Searching in binary search tree."
    end

    def delete_node_spec
		BinarySearchTree.delete_node(40, self.binary_search_tree)
		SpecHelper::assert_equals?(binary_search_tree.data, 50)
		SpecHelper::assert_equals?(binary_search_tree.left_node.data, 30)
		SpecHelper::assert_equals?(binary_search_tree.left_node.left_node.data, 10)

		BinarySearchTree.delete_node(50, self.binary_search_tree)
		SpecHelper::assert_equals?(binary_search_tree.data, 60)
		SpecHelper::assert_equals?(binary_search_tree.left_node.data, 30)

		BinarySearchTree.delete_node(70, self.binary_search_tree)
		SpecHelper::assert_equals?(binary_search_tree.data, 60)
		SpecHelper::assert_equals?(binary_search_tree.right_node.data, 80)
		SpecHelper::assert_equals?(binary_search_tree.right_node.right_node, nil)
		SpecHelper::assert_equals?(binary_search_tree.right_node.left_node, nil)

		p "[Passed] Deletion in binary search tree."
    end

end

binary_search_tree_spec = BinarySearchTreeSpec.new(nil)
binary_search_tree_spec.insert_node_spec
binary_search_tree_spec.search_node_spec
binary_search_tree_spec.delete_node_spec