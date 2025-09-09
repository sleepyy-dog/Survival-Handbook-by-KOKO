# 解决git clone 失败的问题

关键:第一步先匹配代理

```cmd
git config --global http.proxy 127.0.0.1:44119 
% 开启全局代理
```

后续

```cmd
git init
% 初始化
git add .
% 放入缓存区
git commit -m'试一下'
% 放入git管理器
git push
% 推送
```

之后可以删掉代理:

```cmd
git config --global --unset http.proxy
```

