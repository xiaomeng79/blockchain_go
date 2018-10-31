## Wallets(存储多个钱包)

### 结构

```go
type Wallets struct {
	Wallets map[string]*Wallet //多个钱包
}
```

### 方法

```go
func (ws *Wallets) CreateWallet() string //创建钱包,返回地址
func (ws *Wallets) GetAddresses() []string //获取所有钱包地址
func (ws Wallets) GetWallet(address string) Wallet //根据地址,获取钱包
func (ws *Wallets) LoadFromFile(nodeID string) error //从文件导入所有钱包
func (ws Wallets) SaveToFile(nodeID string) //保存到文件

```