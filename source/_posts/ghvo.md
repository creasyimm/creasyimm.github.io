---
title: github访问优化
date: 2020-09-25 12:11:57
tags:
- 分享
- github
categories:
- 网络
- 技术
---

标签：github，clone，慢，加速，hosts，DNS，CDN

## 问题：
github访问速度比较慢，clone代码的时候大部分都是10~20KB/s，而且，还常常断掉，Broken pipe什么的。

## 尝试过：
用proxy加速，没发现有什么效果。

今天又搜了一下关键字 *github* *加速* ，惊喜地发现效果很赞，早点知道的话一定能够节省好多好多的时间。

## 其中一个有效的解决：
据说是dns域名污染导致的，在一个工具网站查询几个特定的域名，在主机的hosts文件中指定这几个域名的解析IP地址，再从github clone仓库的时候，速度提升非常明显，我是“哇呜~”叫了一下。

操作步骤：

一、打开：https://www.ipaddress.com/，分别查询以下域名：
* github.com
* assets-cdn.github.com
* github.global.ssl.fastly.net

二、将查询结果[更新至本地hosts文件](https://www.baidu.com/s?wd=如何修改hosts文件)
~~~
#不同时间查询，结果可能不同，这里的内容仅供参考
140.82.113.3 github.com
185.199.108.153 assets-cdn.github.com
#185.199.109.153 assets-cdn.github.com
#185.199.110.153 assets-cdn.github.com
#185.199.111.153 assets-cdn.github.com
199.232.69.194 github.global.ssl.fastly.net
~~~

参考内容
刷新dns缓存的操作参考（一般不需要）：

Windows
> ipconfig /flushdns

Linux
> systemctl restart nscd

Mac
> sudo dscacheutil -flushcache或sudo killall -HUP mDNSResponder

使用chrome浏览器的注意，chrome本身也有dns缓存，刷新chrome的dns缓存：chrome://net-internals/#dns，点击 *Clear host cache*，不过我常常发现这个操作也没什么用，关闭chrome重新打开效果比较好。


参考（之一）：
https://github.com/chenxuhua/issues-blog/issues/3