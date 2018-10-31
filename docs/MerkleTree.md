## MerkleTree(哈希树)

>| [参考](https://www.cnblogs.com/fengzhiwu/p/5524324.html)

### 结构

```go
type MerkleNode struct {
	Left  *MerkleNode
	Right *MerkleNode
	Data  []byte
}

type MerkleTree struct {
	RootNode *MerkleNode
}
```

### 方法

```go
func NewMerkleNode(left, right *MerkleNode, data []byte) *MerkleNode //新建一个节点
func NewMerkleTree(data [][]byte) *MerkleTree //新建一个树

```