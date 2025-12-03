# Unsupervised Learning: Clustering

## What is Cluster Analysis?

- Cluster Analysis = grouping based on similarity
- given a set of objects, place them in groups such that the objects in a group are similar (or related) to one another and different from (or unrelated to) the objects in other groups

<img width="726" height="356" alt="Image" src="https://github.com/user-attachments/assets/45fe4a45-ea7b-4b45-b05e-43b52cefe398" />

- make points inside a cluster close to each other (minimize intra-cluster distance) and clsuters themseleves far apart (maximize inter-cluster distance)
- **Example**: grouping songs by audio features, songs in the same cluster sound more similar

<br />

**Understanding**
- exploratory analysis to reveal structure
- e.g., group related docs, genes, or stocks

**Summarization**
- represent many data points by cluster prototypes (useful for compression)
- reduce the size of large datasets

## Notion Of A Cluster Can Be Ambiguous

<img width="1019" height="467" alt="Image" src="https://github.com/user-attachments/assets/c4d70f90-626a-49f8-af49-f66de44474dc" />

- the definition of cluster depends on context and the algorithm's notion of similarity
- same data can be partitioned in multiple ways; there's no single objectively correct clustering
- **Practical note:** you must choose an algorithm and parameters (e.g., K) that match the domain goals

## Types Of Clustering

- a clustering is a set of clusters
- important distinction between hierarchical and partitional sets of clusters
  - **Partitional Clustering**
    - a division of data objects into non-overlapping subsets (clusters) (flat clustering)
    - Example: K-means returns K groups (flat)
  - **Hierarchical Clustering**
    - a set of nestede clusters organizaed as a hierarchical tree (dendrogram)
    - Example: agglomerative clustering builds a tree of merges, you can cut at any level to get different granularities

## Partitional Clustering

<img width="743" height="432" alt="Image" src="https://github.com/user-attachments/assets/bc55277b-5245-4e61-8446-a831ec5d35d9" />

- parititioning divides the space into disjoint groups
- use when you want a fixed number of clusters (e.g., K clusters)

## Hierarchical Clustering

<img width="859" height="402" alt="Image" src="https://github.com/user-attachments/assets/c75527d6-9f6b-4005-842d-29824d2a3081" />

- hierarchical clustering arranges clusters in nested levels
- you can interpret the dendrogram to get clusterings at different resolutions
- Example: taxonomy of animals, hierarchical clusters align with biological taxonomies

## Types Of Clusters

- well-seperated clusters
- prototype-based clusters (K-means)
- contiguity-based clusters 
- density-based clusters (DBSCAN)
- clusters described by an objective function

## Types Of Clusters: Well-Separated

- a cluster is a set of points such that any point in a cluster is closer (or more similar) to every point in the cluster than to any point not in the cluster
- good if clusters are clearly separated in space
- Example: points sampled from 3 Gaussian bloobs with large separation

<img width="583" height="337" alt="Image" src="https://github.com/user-attachments/assets/7dbfb3a9-bdbe-462a-a445-069a9fe7543c" />

## Types Of Clusters: Prototype-Based

- a cluster is a set of objects sucht that an object ina cluster (more similar) to the prototype or "center" of a cluster, than to the cneter of any other cluster
- the center of a cluster is often a centroid, the average of all the points in the cluster, or a medoid, the most "representative" point of a cluster

<br />

- K-means and K-medoids are prototype-based
- **Centroid** -> mean of cluster points (may be non-member)
- **Medoid** -> actual member closest to center
- Example: in customer segmentation, a prototype could be an "average customer" profile

<img width="650" height="216" alt="Image" src="https://github.com/user-attachments/assets/8717850c-39ee-4adb-9f72-baa22b8698bc" />

## Types Of Clusters: Contiguity-Based

- a cluster is a set of points such that a point in a cluster is closer (or more similar) to one or more other points in the cluster than to any point not in the cluster

- clusters defined by connectivity (e.g., single linkage hierarchical clustering)
- useful when clusters are formed by chains of nearby points rather than dense blobs

<img width="819" height="271" alt="Image" src="https://github.com/user-attachments/assets/07b17b8a-467a-486d-b7f8-c9be90b81b12" />

## Types Of Clusters: Density-Based

- a cluster is a dense region of points, which is separated by low-density regions, from other regions of high density
- used when the clusters are irregular or intertwined, and when noise and outliers are present
- DBSCAN is the canonical density-based method
- works well for arbitrary-shaped clusters and can mark noise/outliers

<img width="815" height="222" alt="Image" src="https://github.com/user-attachments/assets/4d00d2de-82fc-4bb2-9e88-66fbb7f502ab" />

## Types Of Clusters: Objective Function

- finds clusters that minimize or maximize an objective function
- enumerate all possible ways of dividing the points into clusters and evaluate the 'goodness' of each potential set of clusters by using the given objective function
- a variation of the global objective function approach is to fit the data to a parameterized model
- K-means implicitly minimizes SSE; mixture models maximize likelihood
- objective-based clustering picks clusterings that optimize a quantitative score

## Clustering Algorithms
- K-means and its variants
- hierarchical clustering
- density-based clustering

## K-Means Clustering
- K-means is the typical starting point for clustering. It assumes Euclidean distance and spherical-ish clusters around centroids
- partitional clustering approach
- each cluster is associated with a centroid (center point)
- number of clusters, K, must be specified
- each point is assigned to the closest centroid
- the basic algorithm is very simple

## K-Means Clustering Algorithm

1. Select K points as the initial centroids
2. repeat
3.    Form K clusters by assigning all points to the closest centroid
4.    Recompute the centroid of each cluster
5. until the centroids don't change

## Example Of K-Means Clustering

<img width="628" height="508" alt="Image" src="https://github.com/user-attachments/assets/255b1d0d-4bce-443d-89e2-7714435f3f77" />

<img width="625" height="512" alt="Image" src="https://github.com/user-attachments/assets/b575b94f-12dc-4bca-82a1-5c754d1e2258" />

<img width="661" height="522" alt="Image" src="https://github.com/user-attachments/assets/c2be4880-26e4-4155-b56b-828072785310" />

<img width="690" height="519" alt="Image" src="https://github.com/user-attachments/assets/cfb01695-8564-4817-8971-b26a3287eaa0" />

<img width="661" height="521" alt="Image" src="https://github.com/user-attachments/assets/1bf85ec1-fab8-40ec-b9e1-a91990754384" />

<img width="658" height="515" alt="Image" src="https://github.com/user-attachments/assets/a5f32955-ad92-4d2e-985a-df8b1bbcfa6c" />

- iterative frames (iteration 1 -> iteration 6) of a K-means run
- each iteration shows centroids and assignments moving
- this illustration shows how K-means refines clusters: start with initial centroids -> assign -> recompute -> assign -> etc. 
- most of the improvement happens in the first fewe iterations
- notice how some points switch cluster membership early and stabilize later
- the centroids follow the mean of assigned points; large moves in early iterations are expected

## K-Means Clustering - Details

- initial centroids are often chosen randomly
  - clusters produced can vary from one run to another
- the centroid is (typically) the mean of the points in the cluster, but other definitions are possible
- K-means will converge for common proximity measures with appropriately defined centroid
- most of the convergence happens in the first few iterations
  - often the stopping condition is changed to 'until relatively few points change clusters'
- random init -> use multiple runs of K-means++ to improve robustness
- 'converge' here means the objective (SSE) stops decreasing; algorithm reaches local minimum

## K-Means Objective Function

- a common objective function (used for Euclidean distance) is Sum of Squared Error (SSE)
- SSE is the objective minimized by K-means (for Euclidean distance), each iteration decreases SSE until a local minimum
  - for each point, the error is the distance to the nearest cluster center
  - to get SSE, we square these errors and sum them

$$\text{SSE} = \sum_{i=1}^{K} \sum_{x \in C_i} \| x - m_i \|^2$$

  - x is a data point in cluster Ci and mi is the centroid (mean) for cluster Ci
  - SSE improves in each iteration of K-Means until it reaches a local or global minima

## Two different K-means clusterings

<img width="741" height="484" alt="Image" src="https://github.com/user-attachments/assets/9d5396c1-9e94-470a-917f-599335e9748d" />

- since K-means can end in different local minima, different initial centroids yield different partitions
- this is why multiple random restarts or K-means++ are recommended

## Importance of Choosing Initial Centroids

<img width="702" height="507" alt="Image" src="https://github.com/user-attachments/assets/bfc1a12d-da34-43ee-b838-76b40929f556" />

<img width="662" height="518" alt="Image" src="https://github.com/user-attachments/assets/5c1ab337-87a6-4fa3-80aa-aa886322f6b4" />

<img width="644" height="521" alt="Image" src="https://github.com/user-attachments/assets/6df0eddc-28f8-4ca7-bb2d-742dc3f2eacc" />

<img width="652" height="521" alt="Image" src="https://github.com/user-attachments/assets/d7acbbad-1f81-4c70-ab39-ca0170d24710" />

<img width="623" height="522" alt="Image" src="https://github.com/user-attachments/assets/38a4baf9-122d-4464-bacf-9826d8db72bb" />

- these illustrations demonstrate how bad initial centroids can lead to poor clustering; shows the evolution over multiple iterations
- if starting centroids are badly placed (e.g., multiple centroids in one real cluster), K-means may take many iterations or fail to recover the true grouping
- probability of picking one centroid from each true cluster decreases when K is large
- **Methods to mitigate**
  - multiple runs (select best SSE)
  - sophisticated initializers (K-means++)
  - bisecting K-means (a hierarchical variant that reduces initialization sensitivity)

<br />

**Example**
- suppose data has 10 well-separated pairs of clusters, random init could place two centroids inside the same dense pair, leaving other pairs with no centroid
- K-means may never find the ideal partition

## Problems with selecting initial points
- if there are K 'real' clusters then the chance of selecting one centroid from each cluster is small
  - chance is relatively small when K is large
  - sometimes the initial centroids will readjust themselves in 'right' way, and sometimes they don't 
  - consider an example of five pairs of clusters

## 10 Clusters Example

<img width="732" height="376" alt="Image" src="https://github.com/user-attachments/assets/82d09dcb-c502-4586-af79-44a28444e707" />

<img width="803" height="370" alt="Image" src="https://github.com/user-attachments/assets/cdd95ff2-1325-4875-bccb-fd2af5f619ab" />

<img width="793" height="400" alt="Image" src="https://github.com/user-attachments/assets/029f57d5-3bc9-4319-b3e7-dd6e7a846261" />

## Solutions to Initial Centroids Problem
- multiple runs -> simpler, effective, but. costlier
- use some strategy to select the K initial centroids -> slight overhead, usually much better
- bisecting K-means -> more deterministic hierarchical approach
  - not as susceptible to initialization issues

## Bisecting K-means
- variant of K-means that can produce a partitional or a hierarchical clustering

<br />

**Algorithm**;
1. Start with all points in one cluster
2. choose a cluster to split (often the one with largest SSE)
3. run K-means with k=2 on that cluster (possibly multiple times and pick best split)
4. replace the chosen cluster by the two children
5. repeat steps 2-4 until you have K clusters

## Bisecting K-Means Example

<img width="844" height="265" alt="Image" src="https://github.com/user-attachments/assets/b0e8acfb-e1b7-49f8-8a02-919584dc0976" />

<img width="837" height="261" alt="Image" src="https://github.com/user-attachments/assets/ee0adc4f-89d4-4e6c-8ee7-ea6041ceb9b9" />

<img width="829" height="266" alt="Image" src="https://github.com/user-attachments/assets/c7a9c327-e846-42e4-8796-138ad7e49be2" />

<img width="849" height="270" alt="Image" src="https://github.com/user-attachments/assets/2b889a05-23a8-4ca3-90fd-37300aad2dc5" />

<img width="843" height="272" alt="Image" src="https://github.com/user-attachments/assets/03610ac6-a51e-4a27-9411-09bbf62f7707" />

<img width="863" height="266" alt="Image" src="https://github.com/user-attachments/assets/1860e2e7-f36f-4b06-ab14-89dc07ebee6f" />

<img width="830" height="267" alt="Image" src="https://github.com/user-attachments/assets/46686b52-ddeb-4b8a-8c8b-70f387d33471" />

<img width="834" height="284" alt="Image" src="https://github.com/user-attachments/assets/c16e8bd1-13ad-4c67-80d3-1544f0b8a894" />

<img width="866" height="286" alt="Image" src="https://github.com/user-attachments/assets/5ba10f05-b4bf-4e37-8d03-e9d7e4766a85" />

## Limitations of K-means

- K-means has problems when clusters are of differing
  - sizes
  - densities
  - non-globular shapes

- K-means has problems when the data contains outliers
  - one possible solution is to remove outliers before clustering

## Limitations of K-means: Differing Sizes

<img width="889" height="411" alt="Image" src="https://github.com/user-attachments/assets/2630747b-0f7d-4f90-b5b0-2057a24ec25a" />

- this illustration shows clusters of very different sizes; K-means tends to split large clusters and swallow small ones
- centroids aim to minimize SSE; very large clusters can dominate centroid placement leading small clusters. to be absorbed or mis-assigned
- **Example**: one big and one tiny, centroid of the big cluster might be closer to points of the small cluster than the small cluster centroid, causing mistakes

## Limitations of K-means: Non-globular Shapes

<img width="885" height="417" alt="Image" src="https://github.com/user-attachments/assets/49fa3d54-7469-4e23-89c2-42b6d715a388" />

- this illustration shows crescent/donut shapes when K-means fails
- since k-means uses Euclidean distance to centroids, it prefers round clusters, for elongated/curved shapes, distances to centroids are misleading
- use density-based clustering (DBSCAN) or spectral clustering for these shapes

## Overcoming K-means Limitations

- one solution is to find a large number of clusters
- then these small clusters need to be put together in a post-processing step

<img width="861" height="353" alt="Image" src="https://github.com/user-attachments/assets/9a380ffa-77f4-4cfd-87e4-0d055abb64b9" />

<img width="815" height="359" alt="Image" src="https://github.com/user-attachments/assets/79b8ff5c-d1d8-4d9e-91b8-5c1ac39e2320" />

## Hierarchical Clustering
- produces a set of nested clusters organized as a hierarchical tree
- can be visualized as a dendrogram

<img width="918" height="343" alt="Image" src="https://github.com/user-attachments/assets/c8d7a622-4e91-4e6b-8f65-b4540b623176" />

- creates nested clusters in a tree structure (dendrogram)
- two main approaches: 
  - **Agglomerative (bottom-up)**, more common in practice
    - start with the points as individual clusters
    - at each step, merge the closest pair of clusters until only one cluster (or k clusters) left
  - **Divisive (top-down)**
    - start with one, all-inclusive cluster
    - at each step, split a cluster until each cluster contains an individual point (or there are k clusters)
- traditional hierarchical algorithms use a similarity or distance matrix
  - merge or split one cluster at a time

## Strengths of Hierarchical Clustering
- do not have to assume any particular number of clusters
  - any desired number of clusters can be obtained by 'cutting' the dendrogram at the proper level
- they may correspond to meaninful taxonomies
  - Example in biological sciences (e.g., animal kingdom, phylogeny reconstruction, ...)
- Hierarchical clustering is useful when you want multi-scale grouping (e.g., taxonomy)
- the dendrogram helps choose an appropriate scale

## Agglomerative Clustering Algorithm
- **Key Idea**: successively merge closest clusters

1. Start with N singleton clusters
2. Compute pairwise distances
3. Merge the two closest clusters
4. Update distance matrix
5. Repeat until one cluster remains

<br />

- key operation is the computation of the proximity of two clusters
  - different approaches to defining the distance between clusters distinguish the different algorithms
- the critical choice is the **linkage** (how you compute distance between clusters) and the distance metric
- complexity is typically O(N^2) or worse; works well for small-to-medium datasets

## Steps 1 & 2 (Agglomerative)

- start with clusters of individual points and a proximity matrix

<img width="826" height="421" alt="Image" src="https://github.com/user-attachments/assets/2d5a6fc2-def0-4ed4-b2ca-6ae89a2e045b" />

- the beginning steps of agglomerative hierarchical clustering:
  - (1) compute pairwise distances between all points
  - (2) treat every point as its own cluster
- agglomerative clustering is bottom-up, first you compute N x N distance (or similarity) matrix
- initially, each data point is a singleton cluster; the algorithm will repeatedly merge the closest pair of clusters

## Step 3, The Intermediate State (Agglomerative)

- after some merging steps, we have some clusters

<img width="747" height="424" alt="Image" src="https://github.com/user-attachments/assets/325372bb-68ed-4f3d-903e-3d109d41d267" />

- this illustration shows that after a few merges the structure changes
- the cluster list shrinks, and the distance matrxi must be updated to reflect cluster-to-cluster distances rather than point-to-poin
- the method for updating depends on the linkage you choose (single, complete, average, etc.)

## Step 4 (Agglomerative)

- we want to merge the two closest clusters (C2 and C5) and update the proximity matrix

<img width="736" height="424" alt="Image" src="https://github.com/user-attachments/assets/d189fb4c-81e6-4ec4-80ee-41869faa8ef0" />

- at each iteration you:
  - (i) find the closest pair of clusters according to the chosen linkage
  - (ii) merge them
  - (iii) recompute distances from the new merged cluster to all others
- repeat until a stopping rule (e.g., single cluster or desired number of clusters) is reached

## Step 5 (Agglomerative)

- the question is "How do we update the proximity matrix?"

<img width="753" height="426" alt="Image" src="https://github.com/user-attachments/assets/aefb292e-2d14-4705-95ec-5469c68979b7" />

- you cna stop the agglomerative process at any time and cut the dendrogram horizontally to obtain a partition at the chosen level
- the dendrogram height indicates the distance at which clusters merged

## How to Define Inter-Cluster Similarity

- when clusters have >1 point, how do you define distance between two clusters?

<br />

**MIN**

<img width="421" height="196" alt="Image" src="https://github.com/user-attachments/assets/78f09115-7a90-4f22-a871-c2c1f1b1978f" />

**MAX**

<img width="434" height="204" alt="Image" src="https://github.com/user-attachments/assets/90c1dc86-9236-4bbc-b86b-cf79de5fd9bc" />

**Group Average**

<img width="418" height="198" alt="Image" src="https://github.com/user-attachments/assets/fdd2111c-4262-40ca-90a6-d01637d2d3e7" />

**Distance Between Centroids**

<img width="423" height="201" alt="Image" src="https://github.com/user-attachments/assets/7c60367d-b28b-476a-b09b-7a1d0809906e" />

**Other methods driven by an objective function**

## MIN or Single Link

- proximity of two clusters is absed on the two closest points in the different clusters
  - determined by one pair of points, i.e., by one link in the proximity graph

**Example**:

<img width="928" height="322" alt="Image" src="https://github.com/user-attachments/assets/e8c567bd-442e-47d3-b6ed-b91d2e580a91" />

- single-linkage defines cluster distance as the minimum inter-point distance across clusters
- this is sometimes called the MIN rule
- because it uses the minimum, single linkage can produce long chains (chaining effect), it can link clusters through sequences of close points even when overall clusters are far apart

## Hierarchical Clustering: MIN

<img width="954" height="446" alt="Image" src="https://github.com/user-attachments/assets/fcf5ed9d-436a-4776-a9a6-259301ff3d79" />

- shows how single linkage merges nearest neighbor pairs first
- useful property: can handle non-elliptical shapes (it can connect along narrow bridges)
- but it is sensitive to noise/outliers (a single noisy bridge point can join clusters)

## Strength of MIN

- can handle non-elliptical shapes

<img width="992" height="253" alt="Image" src="https://github.com/user-attachments/assets/55c60e0a-f875-4d62-adb5-2e09fd5a60af" />

- single linkage is good when true clusters are connected by a chain of close points (e.g., elongated or snake-like shapes)
- it is thus more flexible in cluster geometry than methods that enforce compact clusters

## Limitations of MIN

- sensitive to noise

<img width="949" height="309" alt="Image" src="https://github.com/user-attachments/assets/7c0f8d88-147f-46b6-977a-84796a34570d" />

- the chaining effect makes MIN sensitive: a few noisy points can create spurious connections between clusters, merging them prematurely
- so MIN is not ideal when data contains noise/outliers

## Practice Problem

<img width="938" height="435" alt="Image" src="https://github.com/user-attachments/assets/e29ae4df-f36f-4f81-899f-6cdf7e8f8016" />

<img width="1029" height="436" alt="Image" src="https://github.com/user-attachments/assets/6becfa69-2483-436b-a7bf-252eb90e7f0d" />

## MAX or Complete Linkage

- proximity of two clusters is based on the two most distant points in the different clusters
  - determined by all pairs of points in the two clusters

<img width="942" height="353" alt="Image" src="https://github.com/user-attachments/assets/9817df88-a3fc-4c41-857d-bf0c303f01c3" />

- this uses worst-case (farthest pair), producing compact, tightly bound clusters and reducing chaining

## Hierarchical Clustering: MAX

<img width="965" height="428" alt="Image" src="https://github.com/user-attachments/assets/bedeb656-ffce-436d-85e0-06cbf8716649" />

- this illustration shows a dendrogram generated using complete linkage for the example points
- complete linkage merges clusters that are close in the sense that their fathest points are still relatively near; this yields compact clusters and tends to avoid merging through chains

## Strength of MAX

- less susceptible to noise

<img width="887" height="402" alt="Image" src="https://github.com/user-attachments/assets/39ed6071-f064-4c57-8201-622ac94f1961" />

- since, complete linkage uses the maximum pairwise distance, any distant point in a cluster penalizes merging — noisy single points are less likely to cause merges
- This yields more robust clusters against isolated points.

## Limitations of MAX

- tends to break large clusters
- biased towards globular clusters

<img width="937" height="353" alt="Image" src="https://github.com/user-attachments/assets/3db392ac-bcf0-4de9-bcbc-eee447d13b93" />

- Complete linkage prefers compact, spherical clusters. If a true cluster is elongated or has internal variation, complete linkage may split it into multiple clusters (over-segmentation)
- Thus MAX can break large clusters and is biased to globular shapes. 

## Practice Problem

<img width="927" height="422" alt="Image" src="https://github.com/user-attachments/assets/36e48f51-91b8-4e56-bf7b-56f504a99d15" />

<img width="1024" height="456" alt="Image" src="https://github.com/user-attachments/assets/1de2229a-ffc2-4e3a-82e8-caba8458efff" />

## Group Average

- proximity of two clusters is the average of pairwise proximity between points in the two clusters

$$d_{\text{avg}}(A,B)=\frac{1}{|A||B|}\sum_{x\in A}\sum_{y\in B} d(x,y)$$

- group average is a compromise between single and complete linkage
- it uses all pairs, so its less affected by single bridging points (unlike min) and les strigent than max

## Hierarchical Clustering: Group Average

<img width="907" height="463" alt="Image" src="https://github.com/user-attachments/assets/aa730db6-5488-4654-8334-99a38f90c5f8" />

- this illustration shows a dendrogram produced by average linkage on the example

- group average tends to form moderately compact clusters while avoiding chaining as much as single linkage
- its often a good default choice when you want to balance

## Hierarchical Clustering: Problems & Limitations

- once a merge decision is made it cannot be undone (greedy)
- no single global objective function is minimized directly
- different linkage schemes have different weaknesses (sensitivity to noise, handling different sizes/shapes, tendency to break large clusters)

## Density-Based Clustering

- clusters are regions of high density that are separated from one another by regions on low density

<img width="437" height="355" alt="Image" src="https://github.com/user-attachments/assets/e90b8afb-b429-4627-a6d4-38b2ae7f6060" />

## DBSCAN

- DBSCAN is a density-based algorithm
  - **Density** = number of points within a specified radius (Eps)
  - a point is a **core point** if it has at least a specified number of points (MinPts) within Eps
    - these are points taht are at the interior of a cluster
    - counts the point itself
  - a **border point** is not a core point, but is in the neighborhood of a core point
  - a **noise point** is any point that is not a core point or a border point

## DBSCAN: Core, Border, and Noise Points

<img width="836" height="452" alt="Image" src="https://github.com/user-attachments/assets/a5796813-716b-40d8-964f-7eb795eb8855" />

<img width="1033" height="493" alt="Image" src="https://github.com/user-attachments/assets/40ee1da1-83ea-49ea-aeb0-2bad0df0a411" />

## DBSCAN Algorithm

- **Key Idea**: form clusters using core points, and assign border points to one of its neighboring clusters

1. label all points as core, border, or noise points
2. eliminate noise points
3. put an edge between all core points within a distance Eps of each other
4. make each group of connected core points into a separate cluster
5. assign each border point to one of the clusters of its associated core points

## When DBSCAN Works Well

- can handle clusters of different shapes and sizes
- resistant to noise

<img width="957" height="378" alt="Image" src="https://github.com/user-attachments/assets/402b5789-6a3b-44aa-bbaa-89c5ca4530c9" />

## When DBSCAN Does Not Work Well

<img width="363" height="294" alt="Image" src="https://github.com/user-attachments/assets/082dbac6-4bbb-4628-8554-0ffb8748f768" />

<img width="358" height="487" alt="Image" src="https://github.com/user-attachments/assets/b3b8434e-e15f-45c3-8f4d-594fd2682adb" />

## DBSCAN: Determining EPS and MinPts
- idea is that for points in a cluster, their kth nearest neighbors are at close distance
- noise points have the kth nearest neighbor at farther distance
- so, plot sorted distance of every point to its kth nearest neighbor

<img width="472" height="370" alt="Image" src="https://github.com/user-attachments/assets/41461925-35b7-4836-8c6f-ca61633f09a5" />

## Cluster Validity

- for supervised classification we have a variety of measures to evaluate how good our model is
  - accuracy, precision, recall
- for cluster analysis, the analogous question is how to evaluate the "goodness" of the resulting clusters?
- then why do we want to evaluate them?
  - to avoid finding patterns in noise
  - to compare clustering algorithms
  - to compare two sets of clusters
  - to compare to clusters

## Clusters found in Random Data

<img width="985" height="498" alt="Image" src="https://github.com/user-attachments/assets/3d682947-d9de-49e6-ac54-8af62ad6a297" />

## Measures of Cluster Validity
- numerical measures that are applied to judge various aspects of cluster validity, are classified into the following two types:
  - **Supervised**: used to measure the extent to which cluster labels match externally supplied class labels
    - entropy
    - often called external indices because they use information external to the data
  - **Unsupervised**: used to measure the goodness of a clustering structure without respect to external information.
    - Sum of Squared Error (SSE)
    - often called internal indicies because they only use information in the data

