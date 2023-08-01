require_relative './node'
require 'pry'

class BinarySearchTree
  attr_accessor :root

  def initialize(root = nil)
    @root = root
  end

  def search(value)
    return nil if @root.nil?

    current_node = @root

    while true
      return nil if current_node.nil?

      if current_node.value < value
        current_node = current_node.right
      elsif current_node.value > value
        current_node = current_node.left
      else
        return current_node
      end
    end
  end

  def insert(value)
    return nil unless self.search(value).nil?

    new_node = Node.new(value)

    if @root.nil?
      @root = new_node
    else
      current_node = @root

      while true
        if current_node.value < value
          if current_node.right.nil?
            current_node.right = new_node
            break
          else
            current_node = current_node.right
          end
        else
          if current_node.left.nil?
            current_node.left = new_node
            break
          else
            current_node = current_node.left
          end
        end
      end
    end

    new_node
  end

end 
