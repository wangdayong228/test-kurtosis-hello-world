# Test Kurtosis Hello World

运行 package
```bash
kurtosis run github.com/wangdayong228/test-kurtosis-hello-world '{"actors": [{"first_name":"Harrison", "last_name": "Ford"}
```

查询数据
```bash
kurtosis exec github.com/wangdayong228/test-kurtosis-hello-world 'curl -X GET http://localhost:3000/actor'
```
