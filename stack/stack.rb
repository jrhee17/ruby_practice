require 'pry'

class Node
    attr_accessor :val, :back
    def initialize(val)
        @val = val
    end
    def to_s
        val.to_s
    end
end

class Stack
    attr :top
    def push(node)
        node.back = @top
        @top = node
    end
    def pop
        curr_top = @top
        if curr_top
            @top = curr_top.back
            curr_top.back = nil
        end
        curr_top
    end
    def to_s
        retstr = ""
        iter_node = @top
        while iter_node != nil do
            retstr += iter_node.to_s + ', '
            iter_node = iter_node.back
        end
        retstr
    end
end

stack = Stack.new
(1..10).to_a.each {|v| stack.push(Node.new(v))}
raise 'Push not working' unless "10, 9, 8, 7, 6, 5, 4, 3, 2, 1, " == stack.to_s
raise 'Pop not working' unless 10 == stack.pop.val
raise 'Top not working' unless 9 == stack.top.val
