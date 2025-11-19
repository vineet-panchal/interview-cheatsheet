from collections import defaultdict, deque
import heapq

class Graph:
    def __init__(self, directed=False):
        self.graph = defaultdict(list)
        self.directed = directed

    def add_edge(self, u, v, weight=1):
        self.graph[u].append((v, weight))
        if not self.directed:
            self.graph[v].append((u, weight))

    def print_graph(self):
        for node in self.graph:
            print(f"{node}: {self.graph[node]}")

class AdjacencyMatrix:
    def __init__(self, vertices, directed=False):
        self.vertices = vertices
        self.directed = directed
        self.matrix = [[0] * vertices for _ in range(vertices)]

    def add_edge(self, u, v, weight=1):
        self.matrix[u][v] = weight
        if not self.directed:
            self.matrix[v][u] = weight

    def print_matrix(self):
        for row in self.matrix:
            print(row)

def dfs(graph, start, visited=None):
    if visited is None:
        visited = set()
    visited.add(start)
    print(start, end=' ')
    for neighbor, _ in graph[start]:
        if neighbor not in visited:
            dfs(graph, neighbor, visited)

def bfs(graph, start):
    visited = set()
    queue = deque([start])
    visited.add(start)
    while queue:
        node = queue.popleft()
        print(node, end=' ')
        for neighbor, _ in graph[node]:
            if neighbor not in visited:
                visited.add(neighbor)
                queue.append(neighbor)

def topological_sort(graph, vertices):
    in_degree = {node: 0 for node in vertices}
    for node in graph:
        for neighbor, _ in graph[node]:
            in_degree[neighbor] += 1

    queue = deque([node for node in in_degree if in_degree[node] == 0])
    result = []

    while queue:
        node = queue.popleft()
        result.append(node)
        for neighbor, _ in graph[node]:
            in_degree[neighbor] -= 1
            if in_degree[neighbor] == 0:
                queue.append(neighbor)

    if len(result) == len(vertices):
        return result
    else:
        return None  # Cycle detected

def dijkstra(graph, start):
    distances = {node: float('inf') for node in graph}
    distances[start] = 0
    pq = [(0, start)]
    while pq:
        current_distance, current_node = heapq.heappop(pq)
        if current_distance > distances[current_node]:
            continue
        for neighbor, weight in graph[current_node]:
            distance = current_distance + weight
            if distance < distances[neighbor]:
                distances[neighbor] = distance
                heapq.heappush(pq, (distance, neighbor))
    return distances

def bellman_ford(graph, vertices, start):
    distances = {node: float('inf') for node in vertices}
    distances[start] = 0
    for _ in range(len(vertices) - 1):
        for node in graph:
            for neighbor, weight in graph[node]:
                if distances[node] != float('inf') and distances[node] + weight < distances[neighbor]:
                    distances[neighbor] = distances[node] + weight
    # Check for negative cycles
    for node in graph:
        for neighbor, weight in graph[node]:
            if distances[node] != float('inf') and distances[node] + weight < distances[neighbor]:
                return None  # Negative cycle
    return distances

def detect_cycle_undirected(graph, start, visited=None, parent=-1):
    if visited is None:
        visited = set()
    visited.add(start)
    for neighbor, _ in graph[start]:
        if neighbor not in visited:
            if detect_cycle_undirected(graph, neighbor, visited, start):
                return True
        elif neighbor != parent:
            return True
    return False

def detect_cycle_directed(graph, node, visited, rec_stack):
    visited.add(node)
    rec_stack.add(node)
    for neighbor, _ in graph[node]:
        if neighbor not in visited:
            if detect_cycle_directed(graph, neighbor, visited, rec_stack):
                return True
        elif neighbor in rec_stack:
            return True
    rec_stack.remove(node)
    return False

def has_cycle_directed(graph, vertices):
    visited = set()
    rec_stack = set()
    for node in vertices:
        if node not in visited:
            if detect_cycle_directed(graph, node, visited, rec_stack):
                return True
    return False

def graphs():
    print("=== Graph Representations ===")

    # Adjacency List
    print("Adjacency List Representation:")
    g = Graph()
    g.add_edge(0, 1)
    g.add_edge(0, 2)
    g.add_edge(1, 2)
    g.add_edge(2, 3)
    g.print_graph()
    print()

    # Adjacency Matrix
    print("Adjacency Matrix Representation:")
    am = AdjacencyMatrix(4)
    am.add_edge(0, 1)
    am.add_edge(0, 2)
    am.add_edge(1, 2)
    am.add_edge(2, 3)
    am.print_matrix()
    print()

    print("=== Graph Traversals ===")

    # DFS
    print("DFS Traversal:")
    dfs(g.graph, 0)
    print("\n")

    # BFS
    print("BFS Traversal:")
    bfs(g.graph, 0)
    print("\n")

    print("=== Topological Sort ===")
    dag = Graph(directed=True)
    dag.add_edge(5, 2)
    dag.add_edge(5, 0)
    dag.add_edge(4, 0)
    dag.add_edge(4, 1)
    dag.add_edge(2, 3)
    dag.add_edge(3, 1)
    vertices = [0, 1, 2, 3, 4, 5]
    topo_order = topological_sort(dag.graph, vertices)
    if topo_order:
        print("Topological Order:", topo_order)
    else:
        print("Graph has a cycle")
    print()

    print("=== Shortest Paths ===")

    # Dijkstra
    weighted_graph = Graph(directed=True)
    weighted_graph.add_edge(0, 1, 4)
    weighted_graph.add_edge(0, 2, 1)
    weighted_graph.add_edge(2, 1, 2)
    weighted_graph.add_edge(1, 3, 1)
    weighted_graph.add_edge(2, 3, 5)
    distances = dijkstra(weighted_graph.graph, 0)
    print("Dijkstra distances from 0:", distances)

    # Bellman-Ford
    bf_graph = Graph(directed=True)
    bf_graph.add_edge(0, 1, 4)
    bf_graph.add_edge(0, 2, 1)
    bf_graph.add_edge(2, 1, 2)
    bf_graph.add_edge(1, 3, 1)
    bf_graph.add_edge(2, 3, 5)
    bf_graph.add_edge(3, 0, -10)  # Negative edge
    bf_distances = bellman_ford(bf_graph.graph, [0, 1, 2, 3], 0)
    if bf_distances:
        print("Bellman-Ford distances from 0:", bf_distances)
    else:
        print("Negative cycle detected")
    print()

    print("=== Cycle Detection ===")

    # Undirected
    undirected = Graph()
    undirected.add_edge(0, 1)
    undirected.add_edge(1, 2)
    undirected.add_edge(2, 0)
    undirected.add_edge(1, 3)
    has_cycle_u = detect_cycle_undirected(undirected.graph, 0)
    print("Undirected graph has cycle:", has_cycle_u)

    # Directed
    directed = Graph(directed=True)
    directed.add_edge(0, 1)
    directed.add_edge(1, 2)
    directed.add_edge(2, 0)
    has_cycle_d = has_cycle_directed(directed.graph, [0, 1, 2])
    print("Directed graph has cycle:", has_cycle_d)
    print()

    print("=== Practical Examples ===")

    # Social Network Connections
    print("Social Network - Finding mutual friends:")
    social = Graph()
    social.add_edge("Alice", "Bob")
    social.add_edge("Alice", "Charlie")
    social.add_edge("Bob", "Charlie")
    social.add_edge("Bob", "David")
    social.add_edge("Charlie", "Eve")
    print("Alice's friends:", [friend for friend, _ in social.graph["Alice"]])
    print("Bob's friends:", [friend for friend, _ in social.graph["Bob"]])
    mutual = set([f for f, _ in social.graph["Alice"]]) & set([f for f, _ in social.graph["Bob"]])
    print("Mutual friends of Alice and Bob:", mutual)
    print()

    # Flight Routes (Shortest Path)
    print("Flight Routes - Shortest path:")
    flights = Graph(directed=True)
    flights.add_edge("NYC", "LAX", 2450)
    flights.add_edge("NYC", "ORD", 740)
    flights.add_edge("ORD", "LAX", 1740)
    flights.add_edge("NYC", "DEN", 1620)
    flights.add_edge("DEN", "LAX", 1020)
    flight_distances = dijkstra(flights.graph, "NYC")
    print("Shortest flight distances from NYC:", flight_distances)
    print()

    # Task Dependencies (Topological Sort)
    print("Task Dependencies:")
    tasks = Graph(directed=True)
    tasks.add_edge("Research", "Design")
    tasks.add_edge("Design", "Implementation")
    tasks.add_edge("Research", "Implementation")
    tasks.add_edge("Implementation", "Testing")
    tasks.add_edge("Testing", "Deployment")
    task_vertices = ["Research", "Design", "Implementation", "Testing", "Deployment"]
    task_order = topological_sort(tasks.graph, task_vertices)
    if task_order:
        print("Task execution order:", task_order)
    else:
        print("Circular dependency detected")
    print()

    # Web Crawling (BFS)
    print("Web Crawling simulation (BFS):")
    web = Graph(directed=True)
    web.add_edge("home", "about")
    web.add_edge("home", "products")
    web.add_edge("about", "contact")
    web.add_edge("products", "contact")
    web.add_edge("contact", "home")
    print("Crawling order from 'home':")
    bfs(web.graph, "home")
    print("\n")

    # Minimum Spanning Tree (Kruskal's - simplified)
    print("Minimum Spanning Tree (Kruskal's simplified):")
    mst_edges = [(0, 1, 10), (0, 2, 6), (0, 3, 5), (1, 3, 15), (2, 3, 4)]
    mst_edges.sort(key=lambda x: x[2])
    parent = list(range(4))
    def find(x):
        if parent[x] != x:
            parent[x] = find(parent[x])
        return parent[x]
    def union(x, y):
        px, py = find(x), find(y)
        if px != py:
            parent[px] = py
    mst = []
    for u, v, w in mst_edges:
        if find(u) != find(v):
            union(u, v)
            mst.append((u, v, w))
    print("MST edges:", mst)
    print("Total weight:", sum(w for _, _, w in mst))

if __name__ == "__main__":
    graphs()
