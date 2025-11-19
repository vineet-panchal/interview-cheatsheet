class TreeNode:
    def __init__(self, data):
        self.data = data
        self.children = []

    def add_child(self, child):
        self.children.append(child)


# Create a function for depth-first traversal (pre-order)
def pre_order_traversal(node):
    if node is None:
        return
    print(node.data)
    for child in node.children:
        pre_order_traversal(child)


# Create a function for depth-first search
def depth_first_search(node, target):
    if node is None:
        return False
    if node.data == target:
        return True
    for child in node.children:
        if depth_first_search(child, target):
            return True
    return False


# Create a function for insertion
def insert_node(root, node):
    if root is None:
        root = node
    else:
        root.add_child(node)


# Create a function for deletion
def delete_node(root, target):
    if root is None:
        return None
    root.children = [child for child in root.children if child.data != target]
    for child in root.children:
        delete_node(child, target)


# Create a function to calculate the height of a tree
def tree_height(node):
    if node is None:
        return 0
    if not node.children:
        return 1
    return 1 + max(tree_height(child) for child in node.children)


# Create a self-balancing tree (AVL tree)
# AVL tree implementation is complex, so we'll provide a basic example with the concept
# class AVLTreeNode(TreeNode):
#     def __init__(self, data):
#         super().__init__(data)
#         self.height = 1

#     def balance_factor(self):
#         left_height = self.children[0].height if self.children and len(self.children) > 0 else 0
#         right_height = self.children[1].height if self.children and len(self.children) > 1 else 0
#         return left_height - right_height

#     def update_height(self):
#         left_height = self.children[0].height if self.children and len(self.children) > 0 else 0
#         right_height = self.children[1].height if self.children and len(self.children) > 1 else 0
#         self.height = 1 + max(left_height, right_height)

#     def rotate_left(self):
#         new_root = self.children[1]
#         self.children[1] = new_root.children[0]
#         new_root.children[0] = self
#         self.update_height()
#         new_root.update_height()
#         return new_root

#     def rotate_right(self):
#         new_root = self.children[0]
#         self.children[0] = new_root.children[1]
#         new_root.children[1] = self
#         self.update_height()
#         new_root.update_height()
#         return new_root


# Additional traversal methods
def in_order_traversal(node):
    if node is None:
        return
    if node.children:
        in_order_traversal(node.children[0])  # Assuming binary-like for simplicity
    print(node.data)
    for child in node.children[1:]:
        in_order_traversal(child)

def post_order_traversal(node):
    if node is None:
        return
    for child in node.children:
        post_order_traversal(child)
    print(node.data)

def level_order_traversal(root):
    if root is None:
        return
    queue = [root]
    while queue:
        node = queue.pop(0)
        print(node.data, end=" ")
        queue.extend(node.children)
    print()

# Additional methods
def count_nodes(node):
    if node is None:
        return 0
    count = 1
    for child in node.children:
        count += count_nodes(child)
    return count

def find_max(node):
    if node is None:
        return None
    max_val = node.data
    for child in node.children:
        child_max = find_max(child)
        if child_max is not None and child_max > max_val:
            max_val = child_max
    return max_val

def find_min(node):
    if node is None:
        return None
    min_val = node.data
    for child in node.children:
        child_min = find_min(child)
        if child_min is not None and child_min < min_val:
            min_val = child_min
    return min_val

def is_balanced(node):
    if node is None:
        return True
    heights = [tree_height(child) for child in node.children]
    if not heights:
        return True
    return max(heights) - min(heights) <= 1 and all(is_balanced(child) for child in node.children)

def mirror_tree(node):
    if node is None:
        return
    node.children.reverse()
    for child in node.children:
        mirror_tree(child)

def print_tree(node, level=0):
    if node is not None:
        print("  " * level + str(node.data))
        for child in node.children:
            print_tree(child, level + 1)

# Binary Tree Node for specific examples
class BinaryTreeNode:
    def __init__(self, data):
        self.data = data
        self.left = None
        self.right = None

def insert_binary(root, data):
    if root is None:
        return BinaryTreeNode(data)
    if data < root.data:
        root.left = insert_binary(root.left, data)
    else:
        root.right = insert_binary(root.right, data)
    return root

def in_order_binary(node):
    if node:
        in_order_binary(node.left)
        print(node.data, end=" ")
        in_order_binary(node.right)

# Sample usage for general tree
print("=== General Tree Examples ===")
root = TreeNode("A")
child1 = TreeNode("B")
child2 = TreeNode("C")
child3 = TreeNode("D")

root.add_child(child1)
root.add_child(child2)
root.add_child(child3)

child1.add_child(TreeNode("E"))
child1.add_child(TreeNode("F"))
child2.add_child(TreeNode("G"))

print("Tree structure:")
print_tree(root)

print("\nPre-order traversal:")
pre_order_traversal(root)

print("\nPost-order traversal:")
post_order_traversal(root)

print("\nLevel-order traversal:")
level_order_traversal(root)

print(f"\nNumber of nodes: {count_nodes(root)}")
print(f"Max value: {find_max(root)}")
print(f"Min value: {find_min(root)}")
print(f"Is balanced: {is_balanced(root)}")

print("\nMirroring tree:")
mirror_tree(root)
print_tree(root)

print("\nSearching for 'G':", depth_first_search(root, "G"))

# Binary tree example
print("\n=== Binary Tree Example ===")
b_root = None
for val in [5, 3, 7, 2, 4, 6, 8]:
    b_root = insert_binary(b_root, val)

print("In-order traversal of binary tree:")
in_order_binary(b_root)
print()

# Height and other methods
print(f"Height of general tree: {tree_height(root)}")
