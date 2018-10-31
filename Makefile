#
project_name=blockchain

.PHONY : fmt
fmt :
	@echo "格式化代码"
	@gofmt -l -w ./



.PHONY : test
test :
	@echo "测试代码"
	@go test -race -coverprofile=coverage.txt -covermode=atomic ./...

.PHONY : build
build :
	@echo "开始构建"
	@CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -ldflags '-w' -i -o $(project_name) .
	@echo "构建完成"