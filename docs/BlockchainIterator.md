## BlockchainIterator(区块链迭代器)

### 结构

```go
type BlockchainIterator struct {
	currentHash []byte //当前区块的hash
	db          *bolt.DB //数据库
}
```

### 方法

```go
func (i *BlockchainIterator) Next() *Block //利用区块链的链表特性迭代区块

```