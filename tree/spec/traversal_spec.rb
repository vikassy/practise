require_relative '../binary_tree_traversal'
require_relative '../helpers/spec_helper'

class TraversalSpec

    attr_accessor :binary_tree

    def initialize binary_tree
        self.binary_tree = binary_tree
    end

    def pre_order_traversal_spec
        output = BinaryTreeTraversal.pre_order_traversal(binary_tree)
        expected_output = [binary_tree.data,
					binary_tree.left_node.data,
						binary_tree.left_node.left_node.data,
						binary_tree.left_node.right_node.data,
					binary_tree.right_node.data,
                        binary_tree.right_node.left_node.data,
                        binary_tree.right_node.right_node.data
				]
        p "[Passed] Pre-order traversal" if SpecHelper::assert_equals?(output, expected_output)
    end

    def post_order_traversal_spec
        output = BinaryTreeTraversal.post_order_traversal(binary_tree)
        expected_output = [binary_tree.left_node.left_node.data,
					binary_tree.left_node.right_node.data,
						binary_tree.left_node.data,
						binary_tree.right_node.left_node.data,
					binary_tree.right_node.right_node.data,
                        binary_tree.right_node.data,
                        binary_tree.data
        ]
        p "[Passed] Post-order traversal" if SpecHelper::assert_equals?(output, expected_output)
    end
    
    def in_order_traversal_spec
        output = BinaryTreeTraversal.in_order_traversal(binary_tree)
        expected_output = [binary_tree.right_node.right_node.data,
					binary_tree.right_node.data,
						binary_tree.right_node.left_node.data,
						binary_tree.data,
					binary_tree.left_node.right_node.data,
                        binary_tree.left_node.data,
                        binary_tree.left_node.left_node.data
        ]
        p "[Passed] In-order traversal" if SpecHelper::assert_equals?(output, expected_output)
    end

    def element_in_line_height_spec
        output = BinaryTreeTraversal.element_in_line_height(binary_tree, 3)
        expected_output = [
            binary_tree.left_node.left_node.data, binary_tree.left_node.right_node.data,
            binary_tree.right_node.left_node.data, binary_tree.right_node.right_node.data
        ]

        p "[Passed] Element in line height" if SpecHelper::assert_equals?(output, expected_output)
    end

    def breadth_first_search_spec
        output = BinaryTreeTraversal.breadth_first_search(binary_tree)
        expected_output = [
            binary_tree.data,
                binary_tree.left_node.data, binary_tree.right_node.data,
                    binary_tree.left_node.left_node.data, binary_tree.left_node.right_node.data,
                    binary_tree.right_node.left_node.data, binary_tree.right_node.right_node.data
        ]

        p "[Passed] BFS on binary tree" if SpecHelper::assert_equals?(output, expected_output)
    end

end

binary_tree = TreeHelper::generate_random_binary_tree(3)

traversal_spec = TraversalSpec.new binary_tree
traversal_spec.pre_order_traversal_spec
traversal_spec.post_order_traversal_spec
traversal_spec.in_order_traversal_spec
traversal_spec.element_in_line_height_spec
traversal_spec.breadth_first_search_spec

