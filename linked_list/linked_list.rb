class Node
    attr_accessor :val, :next, :prev
    def initialize(val)
        @val = val
    end
end

class LinkedList
    attr_accessor :front
    def insert(node)
        if @front == nil then
            @front = node
            return
        end

        iter_node = @front
        while iter_node.next do
            iter_node = iter_node.next
        end

        iter_node.next = node
        node.prev = iter_node
    end
    def at(ind)
        iter_node = @front
        while ind > 0 do
            ind -= 1
            iter_node = iter_node.next
            raise 'Index out of bounds' unless iter_node
        end
        return iter_node
    end
    def to_s
        retstr = ""
        iter_node = @front
        while iter_node do
            retstr += iter_node.val.to_s
            iter_node = iter_node.next
            retstr += ',' if iter_node 
        end
        return retstr
    end
    def delete (val)
        iter_node = @front
        while iter_node do
            break if iter_node.val == val
            iter_node = iter_node.next
        end
        # Update front if necessary
        @front = iter_node.next if iter_node == @front
        
        # Update connections
        iter_node.prev.next = iter_node.next if iter_node.prev
        iter_node.next.prev = iter_node.prev if iter_node.next

        iter_node
    end
    def delete_at (ind)
        iter_node = @front
        while ind > 0 && iter_node do
            iter_node = iter_node.next
            ind -= 1
        end
        raise 'Index out of range' if ind > 0
        
        # Update front if necessary
        @front = iter_node.next if iter_node == @front
        
        # Update connections
        iter_node.prev.next = iter_node.next if iter_node.prev
        iter_node.next.prev = iter_node.prev if iter_node.next

        iter_node
    end
end

ll = LinkedList.new
(1...10).to_a.each {|v| ll.insert(Node.new(v))}
raise 'Insert not working' unless ll.to_s == "1,2,3,4,5,6,7,8,9"

raise 'Delete front not working' unless ll.delete(1).val == 1
raise 'Front not working' unless ll.front.val == 2
raise 'Delete middle not working' unless ll.delete(5).val == 5
raise 'Delete end not working' unless ll.delete(9).val == 9
raise 'Delete print not working' unless ll.to_s == '2,3,4,6,7,8'

raise 'delete_at not working' unless ll.delete_at(2).val == 4
raise 'delete_at not working' unless ll.to_s == '2,3,6,7,8'
begin
    ll.delete_at(10)
rescue => e
    raise 'index out of range not working' unless e.message == 'Index out of range'
end
