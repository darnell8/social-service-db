# social-service-db

这个命令会遍历当前目录及其子目录中的文件，找到匹配正则表达式的文件，并使用git add命令将它们添加到暂存区。
```
# cmd
for /f "delims=" %i in ('dir /b /s /a-d ^| findstr /r "your_regex_pattern"') do git add "%i"

# bash
find . -type f -regex 'your_regex_pattern' -exec git add {} \;

```

根据未推送的commit反序逐个推送
```
# bash
# 使用%n换行是因为前两个commit id站在一起了
git log origin/main..main --pretty=format:%H%n | tac | while read commit; do [ -n "$commit" ] && git push origin $commit:main; done


```

[GitHub.com 的存储库大小限制](https://stackoverflow.com/questions/38768454/repository-size-limits-for-github-com) 300kb or 350kb