class Board
	attr_accessor 

	def initialize
		
	end
end

class Node
	attr_accessor :value, :parent

	def initialize(value, parent=nil)
		@value = value
		@parent = parent
	end
end

class Knight
	attr_accessor 

	def initialize(location, parent=nil)
		@location = location
		@parent = parent
	end

	def knight_moves(start, finish)
		valid_moves = [[-1,-2],[-1,2],[1,-2],[1,2],[-2,-1],[-2,1],[2,-1],[2,1]]
		root = Node.new(start)
		visited = []
		queue =[root]
		until queue.empty?
			current_node = queue.shift
			visited.push(current_node.value)
			break if finish == current_node.value
			valid_moves.each do |i|
				@location = current_node.value.zip(i).map{ |column| column.reduce(&:+) }
				queue.push(Node.new(@location,current_node)) if valid_square? && !visited.include?(@location)
			end
		end
		print_parents(current_node)
	end

	def valid_square?
		@location[0] > 7 || @location[1] > 7 || @location[0] < 0 || @location[1] < 0 ? false : true
	end

	def print_parents(node)
		path = [node.value]
		until node.parent.nil?
			path.push(node.parent.value)
			node = node.parent
		end
		puts "You made it in #{path.size - 1} moves! Here's your path:"
		path.reverse.each { |move| p move }
	end
end

knight = Knight.new([1,1])
print knight.knight_moves([1,1], [7,7])
