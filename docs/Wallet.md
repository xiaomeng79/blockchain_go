## Wallet(钱包)

数据签名并不是加密，你无法从一个签名重新构造出数据。这有点像哈希

生成数字签名需要一个私钥，而验证签名需要一个公钥


### 结构

```go
type Wallet struct {
	PrivateKey ecdsa.PrivateKey //私钥
	PublicKey  []byte //公钥
}
```

### 方法

```go

const version = byte(0x00) //版本
const addressChecksumLen = 4//校验位

func newKeyPair() (ecdsa.PrivateKey, []byte) //创建一个密钥对
func checksum(payload []byte) []byte // SHA256(SHA256(version + HashPubKey))取前4位
func HashPubKey(pubKey []byte) []byte //RIPEMD16(SHA256(PubKey)) 算法
func ValidateAddress(address string) bool//验证地址是否正确,是GetAddress的逆过程
func NewWallet() *Wallet //新建一个钱包,调用newKeyPair
func (w Wallet) GetAddress() []byte //Base58Encode((version + HashPubKey + checksum))
```

### 获取公钥过程

![gongyao](https://upload-images.jianshu.io/upload_images/127313-6aa6cff5d863d496.png?imageMogr2/auto-orient/)

