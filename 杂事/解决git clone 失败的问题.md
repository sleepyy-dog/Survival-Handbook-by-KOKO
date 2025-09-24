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

注意当你不小心放入大于100MB的文件并add后情况会变得很麻烦（尽量避免）

解决方式如下

```cmd
# 从所有历史记录中删除大文件
git filter-branch --force --index-filter \
  "git rm --cached --ignore-unmatch '课程/大三上/数理统计/数理统计学导论（原书第7版）原书中文版.pdf'" \
  --prune-empty --tag-name-filter cat -- --all

# 清理垃圾文件
git reflog expire --expire=now --all
git gc --prune=now --aggressive

# 4. 强制推送
git push origin main --force

```
