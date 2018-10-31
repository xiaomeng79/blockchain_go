## TransactionOutput(交易输出)

### 结构

```go
type TXOutput struct {
	Value      int
	PubKeyHash []byte
}

```

### 方法

```go
func NewTXOutput(value int, address string) *TXOutput //新建一个输出
func (out *TXOutput) IsLockedWithKey(pubKeyHash []byte) bool //公钥Hash是否相同,解锁输出
func (out *TXOutput) Lock(address []byte) //解析出公钥哈希

```

### 结构

```go
type TXOutputs struct {
	Outputs []TXOutput
}
```

### 方法

```go
func DeserializeOutputs(data []byte) TXOutputs //反序列化
func (outs TXOutputs) Serialize() []byte //序列化

```
