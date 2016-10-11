class Node
    attr_accessor :val, :n, :p
    def initialize(val)
        @val = val
    end
    def to_s
        @val.to_s
    end
end

class Queue
    attr_accessor :front, :back
    def enqueue(node)
        # Update front, back if necessary
        @front = node if !@front
        @back = node if !@back

        # Update connections
        if @back != node then
            node.n = @back
            @back.p = node
        end

        # Update back
        @back = node
    end
    def dequeue
        # Back
        ret_node = @front
        if ret_node then
            @front = ret_node.p
            @front.n = nil
            ret_node.n = nil
            ret_node.p = nil
        end
        ret_node
    end
    def to_s
        retstr = ""
        iter_node = @front
        while iter_node do
            retstr += iter_node.val.to_s
            iter_node = iter_node.p
            retstr += ',' if iter_node
        end
        retstr
    end
end

queue = Queue.new
(1...10).to_a.each {|v| queue.enqueue(Node.new(v))}

raise 'Enqueue not working properly' unless queue.to_s == "1,2,3,4,5,6,7,8,9"
raise 'Front not working properly' unless queue.front.val == 1
raise 'Back not working properly' unless queue.back.val == 9
raise 'Dequeue not working properly' unless queue.dequeue.val == 1
raise 'to_s not working properly' unless queue.to_s == "2,3,4,5,6,7,8,9"
