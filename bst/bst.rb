

class Node
    attr_accessor :val, :left, :right, :parent
    def initialize(val)
        @val = val
    end
end

class BST
    attr_accessor :root
    def insert(node)
        if !@root then
            @root = node
            return
        end

        # Traverse to appropriate location
        iter_node = @root
        parent = nil
        while iter_node do
            parent = iter_node
            if iter_node.val > node.val then
                iter_node = iter_node.left
            else
                iter_node = iter_node.right
            end
        end

        # Connect node to parent
        node.parent = parent
        if parent.val > node.val then
            parent.left = node
        else
            parent.right = node
        end
    end
    def transplant(node1, node2)
        if node1.parent == nil then
            @root = node2
        elsif node1.parent.left == node1 then
            node1.parent.left = node2
        else
            node1.parent.right = node2
        end

        node2.parent = node1.parent if node2
    end
    def tree_min(node)
        iter_node = node
        iter_node = iter_node.right
        while iter_node.left do
            iter_node = iter_node.left
        end
        iter_node
    end
    def remove(val)
        # Search for node containing val
        iter_node = @root
        while iter_node do
            break if val == iter_node.val
            if iter_node.val > val then
                iter_node = iter_node.left
            else
                iter_node = iter_node.right
            end
        end

        # Value is not found or tree is empty
        return if !iter_node || iter_node.val != val


        if !iter_node.left && !iter_node.right then
            # If node has no children
            transplant(iter_node, nil)
        elsif !iter_node.right then
            # If node has one child
            transplant(iter_node, iter_node.left)
        else
            # If node has two children
            min_node = tree_min(iter_node)
            if min_node.parent != iter_node then
                transplant(min_node, min_node.right)
                min_node.right = iter_node.right
                min_node.right.parent = min_node
            end
            transplant(iter_node, min_node)
            min_node.left = iter_node.left
            min_node.left.parent = min_node
        end


        # Initialize connections in iter_node
        iter_node.left = nil
        iter_node.right = nil
        iter_node.parent = nil

        iter_node
    end
    def inorder_traverse
        retstr = ""
        inorder_traversal(@root, retstr)
        retstr
    end
    def inorder_traversal(node, retstr)
        if node then
            inorder_traversal(node.left, retstr)
            retstr << node.val.to_s + ','
            inorder_traversal(node.right, retstr)
        end
    end
end

bst = BST.new

[5,3,4,2,8,10,1,7,6,9].each {|v| bst.insert(Node.new(v))}
raise 'Insertion error' unless bst.inorder_traverse == "1,2,3,4,5,6,7,8,9,10,"
raise 'Node deletion error' unless bst.remove(1).val == 1
raise 'Node deletion print error' unless bst.inorder_traverse == "2,3,4,5,6,7,8,9,10,"
raise 'Root deletion error' unless bst.remove(5).val == 5
raise 'Root deletion print error' unless bst.inorder_traverse == "2,3,4,6,7,8,9,10,"


