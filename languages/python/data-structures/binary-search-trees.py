class TreeNode:
    def __init__(self, key):
        self.key = key
        self.left = None
        self.right = None

class BinarySearchTree:
    def __init__(self):
        self.root = None

    def insert(self, key):
        if self.root is None:
            self.root = TreeNode(key)
        else:
            self._insert(self.root, key)

    def _insert(self, node, key):
        if key < node.key:
            if node.left is None:
                node.left = TreeNode(key)
            else:
                self._insert(node.left, key)
        else:
            if node.right is None:
                node.right = TreeNode(key)
            else:
                self._insert(node.right, key)

    def search(self, key):
        return self._search(self.root, key)

    def _search(self, node, key):
        if node is None or node.key == key:
            return node
        if key < node.key:
            return self._search(node.left, key)
        return self._search(node.right, key)

    def delete(self, key):
        self.root = self._delete(self.root, key)

    def _delete(self, node, key):
        if node is None:
            return node
        if key < node.key:
            node.left = self._delete(node.left, key)
        elif key > node.key:
            node.right = self._delete(node.right, key)
        else:
            if node.left is None:
                return node.right
            elif node.right is None:
                return node.left
            temp = self._min_value_node(node.right)
            node.key = temp.key
            node.right = self._delete(node.right, temp.key)
        return node

    def _min_value_node(self, node):
        current = node
        while current.left is not None:
            current = current.left
        return current

    def inorder_traversal(self):
        result = []
        self._inorder(self.root, result)
        return result

    def _inorder(self, node, result):
        if node:
            self._inorder(node.left, result)
            result.append(node.key)
            self._inorder(node.right, result)

    def preorder_traversal(self):
        result = []
        self._preorder(self.root, result)
        return result

    def _preorder(self, node, result):
        if node:
            result.append(node.key)
            self._preorder(node.left, result)
            self._preorder(node.right, result)

    def postorder_traversal(self):
        result = []
        self._postorder(self.root, result)
        return result

    def _postorder(self, node, result):
        if node:
            self._postorder(node.left, result)
            self._postorder(node.right, result)
            result.append(node.key)

    def level_order_traversal(self):
        if not self.root:
            return []
        result = []
        queue = [self.root]
        while queue:
            node = queue.pop(0)
            result.append(node.key)
            if node.left:
                queue.append(node.left)
            if node.right:
                queue.append(node.right)
        return result

    def height(self):
        return self._height(self.root)

    def _height(self, node):
        if node is None:
            return 0
        left_height = self._height(node.left)
        right_height = self._height(node.right)
        return max(left_height, right_height) + 1

    def find_min(self):
        if self.root is None:
            return None
        current = self.root
        while current.left:
            current = current.left
        return current.key

    def find_max(self):
        if self.root is None:
            return None
        current = self.root
        while current.right:
            current = current.right
        return current.key

    def is_bst(self):
        return self._is_bst(self.root, float('-inf'), float('inf'))

    def _is_bst(self, node, min_val, max_val):
        if node is None:
            return True
        if node.key <= min_val or node.key >= max_val:
            return False
        return (self._is_bst(node.left, min_val, node.key) and
                self._is_bst(node.right, node.key, max_val))

    def count_nodes(self):
        return self._count_nodes(self.root)

    def _count_nodes(self, node):
        if node is None:
            return 0
        return 1 + self._count_nodes(node.left) + self._count_nodes(node.right)

    def print_tree(self):
        self._print_tree(self.root, 0)

    def _print_tree(self, node, level):
        if node is not None:
            self._print_tree(node.right, level + 1)
            print(' ' * 4 * level + str(node.key))
            self._print_tree(node.left, level + 1)

# Example usage
if __name__ == "__main__":
    bst = BinarySearchTree()

    # Insert elements
    elements = [50, 30, 70, 20, 40, 60, 80]
    for elem in elements:
        bst.insert(elem)

    print("Binary Search Tree structure:")
    bst.print_tree()

    print("\nIn-order traversal:", bst.inorder_traversal())
    print("Pre-order traversal:", bst.preorder_traversal())
    print("Post-order traversal:", bst.postorder_traversal())
    print("Level-order traversal:", bst.level_order_traversal())

    print(f"\nHeight of tree: {bst.height()}")
    print(f"Minimum value: {bst.find_min()}")
    print(f"Maximum value: {bst.find_max()}")
    print(f"Total nodes: {bst.count_nodes()}")
    print(f"Is valid BST: {bst.is_bst()}")

    # Search for elements
    search_keys = [40, 90]
    for key in search_keys:
        found = bst.search(key)
        print(f"Search for {key}: {'Found' if found else 'Not found'}")

    # Delete elements
    bst.delete(30)
    print("\nAfter deleting 30:")
    bst.print_tree()
    print("In-order traversal:", bst.inorder_traversal())

    # Insert more elements
    bst.insert(25)
    bst.insert(35)
    print("\nAfter inserting 25 and 35:")
    bst.print_tree()
    print("In-order traversal:", bst.inorder_traversal())
