## Block(区块)

### 结构

```go
type Block struct {
	Timestamp     int64 //时间戳
	Transactions  []*Transaction //交易集合
	PrevBlockHash []byte //上一个交易的hash
	Hash          []byte // 工作量证明计算出
	Nonce         int //符合工作量的随机数
	Height        int //区块的高度,方便各个节点之间同步数据
}
```
### 方法

```go
func DeserializeBlock(d []byte) *Block //gob解码序列化块
func NewBlock(transactions []*Transaction, prevBlockHash []byte, height int) *Block //通过挖矿,生成一个区块返回
func NewGenesisBlock(coinbase *Transaction) *Block //创世区块
func (b *Block) HashTransactions() []byte //使用交易建立一个merkleTree返回它的根
func (b *Block) Serialize() []byte //使用gob编码序列化

```