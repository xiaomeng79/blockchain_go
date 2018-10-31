## Blockchain(区块链)

### 结构

单向链表,使用基于B+树存储结构的设计使得读写数据效率较高的bolt文件存储

```go
type Blockchain struct {
	tip []byte //链表顶端
	db  *bolt.DB //bolt数据库
}
```

### 方法

```go
func CreateBlockchain(address, nodeID string) *Blockchain //创建一个新的区块链,生成创世区块
func NewBlockchain(nodeID string) *Blockchain //打开区块链
func (bc *Blockchain) AddBlock(block *Block) //同步区块,添加到自己的区块链上
func (bc *Blockchain) FindTransaction(ID []byte) (Transaction, error) //根据指定的交易ID,查找本笔交易
func (bc *Blockchain) FindUTXO() map[string]TXOutputs //查找区块链上所有未引用的输出,即UTXO集
func (bc *Blockchain) GetBestHeight() int //获取区块链的最大高度
func (bc *Blockchain) GetBlock(blockHash []byte) (Block, error) //根据一个块Hash,查找这个块的数据
func (bc *Blockchain) GetBlockHashes() [][]byte //获取所有的区块
func (bc *Blockchain) Iterator() *BlockchainIterator //生成一个迭代区块链的迭代器
func (bc *Blockchain) MineBlock(transactions []*Transaction) *Block //验证交易的合法性后,去挖掘一个区块
func (bc *Blockchain) SignTransaction(tx *Transaction, privKey ecdsa.PrivateKey) //使用私钥,为交易输入签名
func (bc *Blockchain) VerifyTransaction(tx *Transaction) bool //验证交易输入的签名

```