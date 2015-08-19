class Node
	attr_accessor :value, :parent, :left, :right

	def initialize(value, parent, left=nil, right=nil)
		@value = value
		@parent = parent
		@left = left
		@right = right
	end
end

class	Tree
	def initialize

	end

	def build_tree(ary)
		ary = ary.shuffle
		root = Node.new(ary[0],nil,nil,nil)	
		ary.each do |i|
			current_node = root
			while i != current_node.value
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

	def check_tree(tree, level=0)
	  if !tree.right.nil? || !tree.left.nil?
	    puts "Level: #{level}"
	    puts "Left branch: #{tree.value} => #{tree.left.value}" if !tree.left.nil?
	    puts "Right branch: #{tree.value} => #{tree.right.value}" if !tree.right.nil?
	    check_tree(tree.left, level+1) if !tree.left.nil?
	    check_tree(tree.right, level+1) if !tree.right.nil?
	  end
	end

	def breadth_first_search(tree, value)
		#queue
		queue = [tree]
		until queue.empty?
			current_node = queue.shift
			return current_node.value if value == current_node.value
			queue.push(current_node.left) if !current_node.left.nil?
			queue.push(current_node.right) if !current_node.right.nil?
		end
		return -1
	end

	def depth_first_search(tree, value)
		#stack
		stack = [tree]
		until stack.empty?
			current_node = stack.pop
			return current_node.value if value == current_node.value
			stack.push(current_node.left) if !current_node.left.nil?
			stack.push(current_node.right) if !current_node.right.nil?
		end
		return -1
	end

	def dfs_rec(current_node, value)
		return current_node.value if value == current_node.value
		return -1
		dfs_rec(current_node.left, value) if !current_node.left.nil?
		dfs_rec(current_node.right, value) if !current_node.right.nil?
	end
end


array = [1,7,4,23,8,9,4,3,5,7,9,67,6345,324]
tree = Tree.new
tree_2 = tree.build_tree(array)
tree.check_tree(tree_2)
puts tree.breadth_first_search(tree_2,324)
puts tree.depth_first_search(tree_2,324)
puts tree.dfs_rec(tree_2,324)

