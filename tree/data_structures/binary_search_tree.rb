require_relative 'binary_tree'
class BinarySearchTree < BinaryTree

	def self.insert_node data, node=nil
		return BinarySearchTree.new(nil, nil, data) if node.nil?
		return node if data == node.data # To handle duplicates
		if (data > node.data)
			node.right_node = insert_node(data, node.right_node) 
		else
			node.left_node = insert_node(data, node.left_node)
		end
		node
	end

	def self.search_node data, node=nil
		return nil if (node.nil?)
		return node if (node.data == data)
		return search_node(data, node.right_node) if (data > node.data)
		return search_node(data, node.left_node)
	end

	def self.delete_node data, node=nil
		return nil if (node.nil?)
		if node.data == data
			if not (node.left_node.nil? or node.right_node.nil?)
				to_be_replaced_node = get_and_delete_min node.right_node
				node.data = to_be_replaced_node.data
			elsif node.left_node.nil?
				node = node.right_node
			else
				node = node.left_node
			end
		elsif data > node.data
			node.right_node = delete_node(data, node.right_node)
		else
			node.left_node = delete_node(data, node.left_node)
		end
		node
	end

	private

	def self.get_and_delete_min node
		return nil if node.nil?
		return node if node.left_node.nil?
		min_node = get_and_delete_min node.left_node
		node.left_node = nil if (min_node == node.left_node)
		min_node
	end
end