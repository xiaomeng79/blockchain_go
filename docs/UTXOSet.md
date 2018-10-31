## UTXOSet(UTXO集)

未消费的交易输出

### 结构

```go
type UTXOSet struct {
	Blockchain *Blockchain //区块链
}

```

### 方法

```go
func (u UTXOSet) CountTransactions() int //统计未消费的交易输出
func (u UTXOSet) FindSpendableOutputs(pubkeyHash []byte, amount int) (int, map[string][]int) //交易时,查找一个pubkeyHash的可引用的未花费的交易输出
func (u UTXOSet) FindUTXO(pubKeyHash []byte) []TXOutput //查找公钥所有的未花费的输出
func (u UTXOSet) Reindex() //重建UTXO集
func (u UTXOSet) Update(block *Block) //更新UTXO集

```