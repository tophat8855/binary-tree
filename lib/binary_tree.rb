require 'pry'
class Node
  attr_accessor :value, :left, :right
  def initialize(value)
    @value = value
  end
end

class BinaryTree
  attr_accessor :root
  def initialize(value)
    @root = Node.new(value)
  end

  def dfs(value,node=@root) # dfs = depth first search
    return nil if !node
    return node if node.value == value
    return dfs(value,node.left) || dfs(value,node.right)
  end

  def sum(node=@root)
    return 0 if node.nil?
    node.value + sum(node.left) + sum(node.right)
  end

  def bfs(value,node=@root) #bfs = breadth first search
    array_of_nodes = [@root]

    while !array_of_nodes.empty?
      node = array_of_nodes.pop
      p node.value
      return node if node.value == value
      array_of_nodes.unshift(node.left) if !node.left.nil?
      array_of_nodes.unshift(node.right) if !node.right.nil?
    end
    nil
  end
end

tree = BinaryTree.new(1)
tree.root.left = Node.new(2)
tree.root.left.left = Node.new(3)
tree.root.left.right = Node.new(4)
tree.root.right = Node.new(5)
tree.root.right.left = Node.new(6)
tree.root.right.left.left = Node.new (7)
tree.root.right.left.right = Node.new(8)
tree.root.right.right = Node.new (9)
tree.root.right.right.left = Node.new(10)


tree.dfs("3")
p tree.sum
