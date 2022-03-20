class BinarySearchTree<T: Comparable & CustomStringConvertible> {

    /* Instance Variables */
    private var root: BinaryNode<T>?

    /* Private Functions */

    /* add(_:to:)
     *  Recurses (preorder) down the tree to find where to put the new value
     *  and is does not allow duplicate values */





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


/* Final Save Point

class BinarySearchTree<T: Comparable & CustomStringConvertible> {
    
    /* Instance Variables */
    private var root: BinaryNode<T>?
    
    
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
*/


