class BinarySearchTree<T: Comparable & CustomStringConvertible> {
    
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
    
    
    
    
    /* Private Functions */
    
    /* add(_:to:)
     *  Recurses (preorder) down the tree to find where to put the new value
     *  and is does not allow duplicate values */
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
    
    /* contains(_:fromParent:)
     *  Recurses (preorder) down the tree to find a value
     *  and returns if the value was found or not.
     */

    
    
    
    
}

class BinaryNode<T> {
    
    /* Instance Variables */
    var data: T
    var leftChild: BinaryNode?
    var rightChild: BinaryNode?
    
    /* Initializers */
    init(data: T) {
        self.data = data
    }
}

var numberTree = BinarySearchTree<Int>()
numberTree.add(5)
numberTree.add(6)
numberTree.add(2)


/* Final Save Point

class BinarySearchTree<T: Comparable & CustomStringConvertible> {
    
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
        contains(value, startingAt: root)
    }
    
    
    /* Private Functions */
    
    /* add(_:to:)
     *  Recurses (preorder) down the tree to find where to put the new value
     *  and is does not allow duplicate values */
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
    
    /* contains(_:startingAt:)
     *  Recurses (preorder) down the tree to find a value
     *  and returns if the value was found or not. */
    private func contains(_ value: T, startingAt node: BinaryNode<T>?) -> Bool {
        guard let parent = node else {
            return false
        }
        
        var valueFound = false
        
        if value < parent.data {
            valueFound = contains(value, startingAt: parent.leftChild)
        } else if value > parent.data {
            valueFound = contains(value, startingAt: parent.rightChild)
        } else {
            valueFound = true
        }
        return valueFound
        
    }
    
}

class BinaryNode<T> {
    
    /* Instance Variables */
    var data: T
    var leftChild: BinaryNode?
    var rightChild: BinaryNode?
    
    /* Initializers */
    init(data: T) {
        self.data = data
    }
}

var numberTree = BinarySearchTree<Int>()
numberTree.add(5)
numberTree.add(6)
numberTree.add(2)
numberTree.add(56)
numberTree.add(34)
numberTree.add(12)
numberTree.add(54)
numberTree.add(3)
print(numberTree.contains(12))
print(numberTree.contains(7))
print(numberTree.contains(54))

 */
