# Test Kurtosis Hello World

运行 package
```bash
kurtosis run github.com/wangdayong228/test-kurtosis-hello-world '{"actors": [{"first_name":"Kevin", "last_name": "Bacon"}, {"first_name":"Steve", "last_name":"Buscemi"}]}'
```

查询数据
```bash
curl -X GET "http://127.0.0.1:$YOUR_POSTGREST_PORT/actor?first_name=eq.Kevin&last_name=eq.Bacon"
```
