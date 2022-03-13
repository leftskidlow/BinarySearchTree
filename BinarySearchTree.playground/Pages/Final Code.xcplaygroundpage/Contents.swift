class BinarySearchTree<T: Comparable & CustomStringConvertible>: CustomStringConvertible {

    
    
    /* Instance Variables */
    private var root: BinaryNode<T>?
    
    /* Public Functions */
    
    // add(_:) -> Users add values to BST, if there is no root, it gets added here
    func add(_ value: T) {
        let node = BinaryNode(data: value)
        if let root = self.root {
            add(node, to: root)
        } else {
            self.root = node
        }
    }
    
    // contains(_:) -> Returns a boolean whether the BST contains an element
    func contains(_ value: T) -> Bool {
        self.find(value, fromParent: self.root)
    }
    
    // remove(_:) -> Removes an element from the tree and returns it
    func remove(_ value: T) -> BinaryNode<T>? {
        remove(value, fromParent: self.root)
    }
    
    /* Private Functions */
    
    /* add(_:to:)
     *  Recurses (preorder) down the tree to find where to put the new value
     *  and is does not allow duplicate values
     */
    private func add(_ node: BinaryNode<T>, to parent: BinaryNode<T>) {
        if node.data < parent.data {
            if let existingLeftNode = parent.leftChild {
                add(node, to: existingLeftNode)
            } else {
                parent.leftChild = node
            }
        } else if node.data > parent.data {
            if let existingRightNode = parent.rightChild {
                add(node, to: existingRightNode)
            } else {
                parent.rightChild = node
            }
        }
    }
    
    /* find(_:fromParent:)
     *  Recurses (preorder) down the tree to find a value
     *  and returns if the value was found or not.
     */
    private func find(_ value: T, fromParent node: BinaryNode<T>?) -> Bool {
        
        var valueFound = false
        
        guard let parent = node else {
            return false
        }
        if value < parent.data {
            valueFound = self.find(value, fromParent: parent.leftChild)
        } else if value > parent.data {
            valueFound = self.find(value, fromParent: parent.rightChild)
        } else {
            valueFound = true
        }
        return valueFound
        
    }
    
    /* remove(_:fromParent:)
     *  Recurses (preorder) down the tree to find a value and delete it
     *  from the tree, it deletes in place, so recreates the tree new tree
     *  as it goes. Essentially, the node to be removed will be replaced with
     *  either the biggest child on the left or the smallest child on the right.
     */
    private func remove(_ value: T, fromParent node: BinaryNode<T>?) -> BinaryNode<T>? {
        
        guard let parent = node else {
            return nil
        }
        
        if value < parent.data {
            parent.leftChild = remove(value, fromParent: parent.leftChild)
        } else if value > parent.data {
            parent.rightChild = remove(value, fromParent: parent.rightChild)
        }
        else {
            if parent.leftChild == nil {
                return parent.rightChild
            } else if parent.rightChild == nil{
                return parent.leftChild
            }
            
            parent.data = findMinimumValue(parent.rightChild)!
            parent.rightChild = remove(parent.data, fromParent: parent.rightChild)
        }
        
        return parent;
    }
    
    /* findMinimumValue(_:)
     *  A helper function used to find the minimum value on the right side of the tree
     */
    private func findMinimumValue(_ node: BinaryNode<T>?) -> T? {
        
        guard var currentNode = node else {
            return nil
        }
        
        while let next = currentNode.leftChild {
            currentNode = next
        }
        return currentNode.data
    }
    
    /* inOrderTraversal(_:_:)
     *  Recurses (inorder) to provide the structure for the print function.
     *  Really just wanted to use a different traversal than preorder for the print
     *  and to use inout variables.
     */
    private func inOrderTraversal(_ node: BinaryNode<T>?, _ result: inout String) {
        guard let _ = node else { return }
        self.inOrderTraversal(node?.leftChild, &result)
        result += "\((node?.data.description)!) "
        self.inOrderTraversal(node?.rightChild, &result)
    }

    
    /* CustomStringConvertible Conformance */
    var description: String {
        var text = ""
        inOrderTraversal(self.root, &text)
        return text
        
    }
    
}

class BinaryNode<T> {
    var data: T
    var leftChild: BinaryNode?
    var rightChild: BinaryNode?
    
    init(data: T) {
        self.data = data
        self.leftChild = nil
        self.rightChild = nil
    }
}

var testTree = BinarySearchTree<Int>()
testTree.add(5)
testTree.add(6)
testTree.add(2)
testTree.add(56)
testTree.add(34)
testTree.add(12)
testTree.add(54)
testTree.add(3)
print(testTree.contains(12))
print(testTree.contains(7))
print(testTree.contains(54))
print(testTree)
testTree.remove(3)
print(testTree)
testTree.remove(7)
print(testTree)
testTree.remove(54)
print(testTree)


var anotherTestTree = BinarySearchTree<String>()
anotherTestTree.add("big")
anotherTestTree.add("brown")
anotherTestTree.add("bear")
anotherTestTree.add("blue")
anotherTestTree.add("bull")
anotherTestTree.add("beautiful")
anotherTestTree.add("baboon")
anotherTestTree.add("blowing")
anotherTestTree.add("bubbles")
anotherTestTree.add("biking")
anotherTestTree.add("backwards")
print(anotherTestTree)
print(anotherTestTree.contains("bear"))
print(anotherTestTree.contains("yellow"))
print(anotherTestTree.contains("bubbles"))
anotherTestTree.remove("beautiful")
print(anotherTestTree)
anotherTestTree.remove("pink")
print(anotherTestTree)
anotherTestTree.remove("baboon")
print(anotherTestTree)

