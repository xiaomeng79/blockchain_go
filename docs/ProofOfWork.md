## ProofOfWork(工作量证明)

### 结构

```go
type ProofOfWork struct {
	block  *Block //块
	target *big.Int //挖矿目标
}
```

### 方法

```go
func NewProofOfWork(b *Block) *ProofOfWork //新建一个工作量
func (pow *ProofOfWork) Run() (int, []byte) //计算随机数,挖矿
func (pow *ProofOfWork) Validate() bool //验证随机数

```