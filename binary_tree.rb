class Node
	attr_accessor :value, :parent, :left, :right

	def initialize(value, parent, left=nil, right=nil)
		@value = value
		@parent = parent
		@left = left
		@right = right
	end
end

def build_tree(ary)
	ary = ary.shuffle
	root = Node.new(ary[0],nil,nil,nil)	
	ary.each do |i|
		current_node = root
		unless i == current_node.value
			if i < current_node.value
				if current_node.left.nil?
					current_node.left = Node.new(i, current_node, nil, nil)
				else	
					current_node = current_node.left
				end
			else
				if current_node.right.nil?
					current_node.right = Node.new(i, current_node, nil, nil)
				else	
					current_node = current_node.right
				end
			end
		end
	end
	root
end

array = [1,7,4,23,8,9,4,3,5,7,9,67,6345,324]