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

    # return node if node.value == value
    # while !node.left.nil?
    #   dfs(value, node.left)
    # end
    # dfs(value, node.right)
  end
end

tree = BinaryTree.new("HTML")
tree.root.left = Node.new("HEAD")
tree.root.left.left = Node.new("SCRIPT")
tree.root.left.right = Node.new("TITLE")
tree.root.right = Node.new("BODY")
tree.root.right.left = Node.new("DIV")
tree.root.right.left.left = Node.new ("P")
tree.root.right.left.right = Node.new("A")
tree.root.right.right = Node.new ("UL")
tree.root.right.right.left = Node.new("LI")


tree.dfs("LI")
#<Node:0x007fd74a879ac8 @value="LI">

tree.dfs("HELLO")
# nil

binding.pry
