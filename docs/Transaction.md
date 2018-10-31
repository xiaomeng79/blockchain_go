## Transaction(交易)

### 结构

```go
type Transaction struct {
        ID   []byte //交易ID
        Vin  []TXInput //输入集合
        Vout []TXOutput //输出集合
}
```

### 方法

```go
func DeserializeTransaction(data []byte) Transaction //反序列化交易
func NewCoinbaseTX(to, data string) *Transaction //创币交易
func NewUTXOTransaction(wallet *Wallet, to string, amount int, UTXOSet *UTXOSet) *Transaction //从UTXO集中找到自己未使用的输出发起交易
func (tx *Transaction) Hash() []byte //交易副本,设置ID为空字节数组后,序列化后进行Sha256后得,结果为交易ID
func (tx Transaction) IsCoinbase() bool //Coinbase交易,只有一个输入,并且输入为空,输入的引用输出索引为-1
func (tx Transaction) Serialize() []byte //序列化交易
func (tx *Transaction) Sign(privKey ecdsa.PrivateKey, prevTXs map[string]Transaction) //使用私钥对交易数据进行签名,交易数据中的pubkey被替换成引用交易输出的pubkeyHash,签名数据为ecdsa.sign的r,s的连接
func (tx Transaction) String() string //输出交易详情
func (tx *Transaction) TrimmedCopy() Transaction //修剪交易数据为了签名,把交易输入中的签名和公钥去除,因为签名之前和验证签名的时候,这里数据不一样
func (tx *Transaction) Verify(prevTXs map[string]Transaction) bool //从vin.pubkey提取公钥,使用公钥,验证签名,

```