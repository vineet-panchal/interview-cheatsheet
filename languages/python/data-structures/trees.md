# Trees in Python

## Introduction

**Trees** are hierarchical data structures consisting of nodes connected by edges. Each tree has a root node, and every node (except the root) has exactly one parent. Trees are used to represent hierarchical relationships and are fundamental in computer science.

## Basic Tree Structure

```python
class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right
```

## Tree Traversals

### Depth-First Traversals

```python
def inorder_traversal(root):
    if root:
        inorder_traversal(root.left)
        print(root.val, end=' ')
        inorder_traversal(root.right)

def preorder_traversal(root):
    if root:
        print(root.val, end=' ')
        preorder_traversal(root.left)
        preorder_traversal(root.right)

def postorder_traversal(root):
    if root:
        postorder_traversal(root.left)
        postorder_traversal(root.right)
        print(root.val, end=' ')
```

### Breadth-First Traversal (Level Order)

```python
from collections import deque

def level_order_traversal(root):
    if not root:
        return []
    result = []
    queue = deque([root])
    while queue:
        level_size = len(queue)
        level = []
        for _ in range(level_size):
            node = queue.popleft()
            level.append(node.val)
            if node.left:
                queue.append(node.left)
            if node.right:
                queue.append(node.right)
        result.append(level)
    return result
```

## Tree Properties

```python
def tree_height(root):
    if not root:
        return 0
    left_height = tree_height(root.left)
    right_height = tree_height(root.right)
    return max(left_height, right_height) + 1

def count_nodes(root):
    if not root:
        return 0
    return 1 + count_nodes(root.left) + count_nodes(root.right)

def is_leaf(node):
    return node and not node.left and not node.right

def count_leaves(root):
    if not root:
        return 0
    if is_leaf(root):
        return 1
    return count_leaves(root.left) + count_leaves(root.right)
```

## Tree Construction and Manipulation

```python
def insert_level_order(arr, root, i, n):
    if i < n:
        temp = TreeNode(arr[i])
        root = temp

        root.left = insert_level_order(arr, root.left, 2 * i + 1, n)
        root.right = insert_level_order(arr, root.right, 2 * i + 2, n)
    return root

def build_tree_from_array(arr):
    if not arr:
        return None
    return insert_level_order(arr, None, 0, len(arr))
```

## Binary Tree Types

### Full Binary Tree

A tree where every node has either 0 or 2 children.

```python
def is_full_binary_tree(root):
    if not root:
        return True
    if (root.left and not root.right) or (not root.left and root.right):
        return False
    return is_full_binary_tree(root.left) and is_full_binary_tree(root.right)
```

### Complete Binary Tree

A tree where all levels are completely filled except possibly the last level, which is filled from left to right.

```python
def is_complete_binary_tree(root, index=0, node_count=None):
    if not root:
        return True
    if node_count is None:
        node_count = count_nodes(root)
    if index >= node_count:
        return False
    return (is_complete_binary_tree(root.left, 2 * index + 1, node_count) and
            is_complete_binary_tree(root.right, 2 * index + 2, node_count))
```

### Perfect Binary Tree

A tree where all internal nodes have two children and all leaves are at the same level.

```python
def is_perfect_binary_tree(root, depth=0, level=0):
    if not root:
        return True
    if not root.left and not root.right:
        return depth == level
    if not root.left or not root.right:
        return False
    return (is_perfect_binary_tree(root.left, depth, level + 1) and
            is_perfect_binary_tree(root.right, depth, level + 1))
```

### Balanced Binary Tree

A tree where the height difference between left and right subtrees is at most 1.

```python
def is_balanced(root):
    def check_height(node):
        if not node:
            return 0
        left_height = check_height(node.left)
        right_height = check_height(node.right)
        if left_height == -1 or right_height == -1 or abs(left_height - right_height) > 1:
            return -1
        return max(left_height, right_height) + 1
    return check_height(root) != -1
```

## Tree Algorithms

### Lowest Common Ancestor (LCA)

```python
def find_lca(root, n1, n2):
    if not root:
        return None

    if root.val == n1 or root.val == n2:
        return root

    left_lca = find_lca(root.left, n1, n2)
    right_lca = find_lca(root.right, n1, n2)

    if left_lca and right_lca:
        return root

    return left_lca if left_lca else right_lca
```

### Diameter of Binary Tree

```python
def diameter(root):
    def height_and_diameter(node):
        if not node:
            return 0, 0
        left_height, left_diam = height_and_diameter(node.left)
        right_height, right_diam = height_and_diameter(node.right)
        height = max(left_height, right_height) + 1
        diam = max(left_diam, right_diam, left_height + right_height + 1)
        return height, diam
    _, diam = height_and_diameter(root)
    return diam
```

### Maximum Path Sum

```python
def max_path_sum(root):
    def max_gain(node):
        nonlocal max_sum
        if not node:
            return 0

        left_gain = max(max_gain(node.left), 0)
        right_gain = max(max_gain(node.right), 0)

        current_path_sum = node.val + left_gain + right_gain
        max_sum = max(max_sum, current_path_sum)

        return node.val + max(left_gain, right_gain)

    max_sum = float('-inf')
    max_gain(root)
    return max_sum
```

## Tree Serialization and Deserialization

### Serialize (Preorder)

```python
def serialize(root):
    def preorder(node):
        if not node:
            result.append('null')
            return
        result.append(str(node.val))
        preorder(node.left)
        preorder(node.right)

    result = []
    preorder(root)
    return ','.join(result)
```

### Deserialize

```python
def deserialize(data):
    def build_tree():
        val = next(vals)
        if val == 'null':
            return None
        node = TreeNode(int(val))
        node.left = build_tree()
        node.right = build_tree()
        return node

    vals = iter(data.split(','))
    return build_tree()
```

## Tree Visualization

```python
def print_tree(root, level=0, prefix="Root: "):
    if root:
        print(" " * (level * 4) + prefix + str(root.val))
        if root.left or root.right:
            print_tree(root.left, level + 1, "L--- ")
            print_tree(root.right, level + 1, "R--- ")
```

## Practical Examples

### File System Representation

```python
class FileNode:
    def __init__(self, name, is_file=False):
        self.name = name
        self.is_file = is_file
        self.children = []

    def add_child(self, child):
        self.children.append(child)

def build_file_tree():
    root = FileNode("root")
    home = FileNode("home")
    root.add_child(home)

    user = FileNode("user")
    home.add_child(user)

    documents = FileNode("documents")
    user.add_child(documents)
    documents.add_child(FileNode("resume.txt", True))
    documents.add_child(FileNode("photo.jpg", True))

    downloads = FileNode("downloads")
    user.add_child(downloads)
    downloads.add_child(FileNode("software.zip", True))

    return root

def print_file_tree(node, level=0):
    indent = "  " * level
    if node.is_file:
        print(f"{indent}📄 {node.name}")
    else:
        print(f"{indent}📁 {node.name}")
        for child in node.children:
            print_file_tree(child, level + 1)

file_tree = build_file_tree()
print_file_tree(file_tree)
```

### Expression Tree

```python
class ExpressionNode:
    def __init__(self, value, left=None, right=None):
        self.value = value
        self.left = left
        self.right = right

def build_expression_tree(postfix):
    stack = []
    for token in postfix:
        if token.isdigit():
            stack.append(ExpressionNode(int(token)))
        else:
            right = stack.pop()
            left = stack.pop()
            stack.append(ExpressionNode(token, left, right))
    return stack[0]

def evaluate_expression_tree(root):
    if not root:
        return 0
    if not root.left and not root.right:
        return root.value
    left_val = evaluate_expression_tree(root.left)
    right_val = evaluate_expression_tree(root.right)
    if root.value == '+':
        return left_val + right_val
    elif root.value == '-':
        return left_val - right_val
    elif root.value == '*':
        return left_val * right_val
    elif root.value == '/':
        return left_val // right_val

# Build and evaluate: (3 + 4) * 2
postfix = ['3', '4', '+', '2', '*']
expr_tree = build_expression_tree(postfix)
result = evaluate_expression_tree(expr_tree)
print(f"Expression tree result: {result}")
```

### Huffman Coding Tree

```python
import heapq

class HuffmanNode:
    def __init__(self, char, freq):
        self.char = char
        self.freq = freq
        self.left = None
        self.right = None

    def __lt__(self, other):
        return self.freq < other.freq

def build_huffman_tree(text):
    freq = {}
    for char in text:
        freq[char] = freq.get(char, 0) + 1

    pq = [HuffmanNode(char, f) for char, f in freq.items()]
    heapq.heapify(pq)

    while len(pq) > 1:
        left = heapq.heappop(pq)
        right = heapq.heappop(pq)
        merged = HuffmanNode(None, left.freq + right.freq)
        merged.left = left
        merged.right = right
        heapq.heappush(pq, merged)

    return pq[0]

def print_huffman_codes(node, code=""):
    if node is None:
        return
    if node.char is not None:
        print(f"{node.char}: {code}")
    print_huffman_codes(node.left, code + "0")
    print_huffman_codes(node.right, code + "1")

text = "hello world"
huffman_root = build_huffman_tree(text)
print("Huffman codes:")
print_huffman_codes(huffman_root)
```

## Tree Interview Problems

### Same Tree

```python
def is_same_tree(p, q):
    if not p and not q:
        return True
    if not p or not q:
        return False
    return (p.val == q.val and
            is_same_tree(p.left, q.left) and
            is_same_tree(p.right, q.right))
```

### Symmetric Tree

```python
def is_symmetric(root):
    def is_mirror(left, right):
        if not left and not right:
            return True
        if not left or not right:
            return False
        return (left.val == right.val and
                is_mirror(left.left, right.right) and
                is_mirror(left.right, right.left))
    return is_mirror(root, root)
```

### Invert Binary Tree

```python
def invert_tree(root):
    if not root:
        return None
    root.left, root.right = root.right, root.left
    invert_tree(root.left)
    invert_tree(root.right)
    return root
```

## Time Complexity

| Operation | Time Complexity |
|-----------|----------------|
| Traversal | O(n) |
| Height | O(n) |
| Count nodes | O(n) |
| Search | O(n) worst case, O(log n) for balanced |
| Insert | O(n) worst case, O(log n) for balanced |

## Applications

- File systems
- Database indexing
- Expression parsing
- Decision trees
- Huffman coding
- Game trees
- XML/HTML parsing
- Organization charts

## Best Practices

- Use recursive approaches for tree problems
- Consider iterative solutions for large trees
- Handle null cases properly
- Use appropriate traversal based on problem requirements
- Consider tree balancing for performance
- Implement proper error handling

## Summary

Trees are fundamental data structures for representing hierarchical relationships. Understanding different tree types, traversals, and algorithms is essential for solving complex problems in computer science. Python's object-oriented nature makes tree implementations intuitive and efficient.
