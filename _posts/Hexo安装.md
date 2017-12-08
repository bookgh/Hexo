---
title: Hexo安装
Date: 2017-12-08 11:35:50
tags:
- Hexo安装
- Hexo优化

categories:
- Hexo
---

## 摘要

>Hexo 是一个快速、简洁且高效的博客框架。`Hexo` 使用 `Markdown`（或其他渲染引擎）解析文章，在几秒内，即可利用靓丽的主题生成静态网页。

## 安装 Git

    yum -y install git-core

## 安装 Node.js

   ### 安装 Wget,nvm

    yum -y install wget
    wget -qO- https://raw.github.com/creationix/nvm/master/install.sh | sh

   ### 重启终端,安装 `Node.js`

    su - root
    nvm install stable

## 安装 Hexo

    npm --registry https://registry.npm.taobao.org install -g hexo-cli

## 创建站点
>在`/Hexo`目录内创建站点

    hexo init /Hexo
    cd /Hexo
    npm install

## 安装 NexT 主题
>执行命令

    git clone https://github.com/iissnan/hexo-theme-next /Hexo/themes/next

## 配置站点信息

   ### author
   >网站作者,修改 `/Hexo/_config.yml` `author` 的值

    sed -i "s/author:.*/author: Yi Xuan/" /Hexo/_config.yml

   ### 更改语言
   >主题语言,修改`/Hexo/_config.yml` `language` 的值对应主题文件下 `language` 文件夹内的文件名

    sed -i "s/language:.*/language: zh-Hans/" /Hexo/_config.yml

   ### 文章的永久链接格式
   >文章链接格式,修改`/Hexo/_config.yml` `permalink` 的值

    sed -i "s/permalink:.*/permalink: post\/:title.html/" /Hexo/_config.yml

   ### 设置主题
   >修改`/Hexo/_config.yml` `theme` 的值对应 `/Hexo/theme/` 目录下对应的主题

    sed -i "s/theme:.*/theme: next/" /Hexo/_config.yml


## NexT主题配置

   ### 更换主题样式
   >NexT主题有四种样式`Muse`,`Mist`,`Pisces`,`Gemini` 修改`/Hexo/themes/next/_config.yml` `scheme` 的值

    sed -i "s/scheme: Muse/#scheme: Muse/" /Hexo/themes/next/_config.yml
    sed -i "s/#scheme: Gemini/scheme: Gemini/" /Hexo/themes/next/_config.yml

   ### 更改语法高亮样式
   >语法高亮样式有五种分别为`normal`,`night`,`night eighties`,`night blue`,`night bright`

    sed -i  "s/highlight_theme:.*/highlight_theme: night/" /Hexo/themes/next/_config.yml

   ### 设置头像
   >将选中的图标文件放到 `/Hexo/themes/next/source/images` 目录下，命名为`avatar.png` `/Hexo/_config.yml` 新增字段`avatar: /images/avatar.png`

    sed -i "/author: /a avatar: \/images\/avatar.png" /Hexo/_config.yml


   ### 阅读全文
   >编辑主题配置文件，修改`auto_excerpt`字段：(将enable设为true，之后每篇文章会自动在150处截断)

    sed -i '210,215 s/enable:.*/enable: true/' /Hexo/themes/next/_config.yml

   ### 添加社交链接
   >编辑`/Hexo/themes/next/_config.yml`的social字段，增加你要添加的社交名称和URL

    sed -i "s/#social:/social:/" /Hexo/themes/next/_config.yml
    sed -i "s@#GitHub:.*@GitHub: https://github.com/bookgh || github@" /Hexo/themes/next/_config.yml

## 创建页面

   ### 创建标签页面
   >执行命令

    hexo new page tags

   ### 修改 tags 页面类型
   >`/Hexo/source/tags/index.md` 文件内添加字段`type: tags` 且不显示评论`comments: false`

    sed -i "/date:/a type: tags" /Hexo/source/tags/index.md
    sed -i "/type:/a comments: false" /Hexo/source/tags/index.md


   ### 创建分类页面
   >执行命令

    hexo new page categories

   ### 修改 categories 页面类型
   >`/Hexo/source/categories/index.md` 文件内添加字段`type: categories` 且不显示评论`comments: false`

    sed -i "/date:/a type: categories" /Hexo/source/categories/index.md
    sed -i "/type:/a comments: false" /Hexo/source/categories/index.md

   ### 创建关于页面
   >执行命令

    hexo new page about

   ### 修改about 页面
   >`/Hexo/source/categories/index.md` 文件加上关于自己的简介，可随便填写

   ### 创建图片页面
   >执行命令

    hexo new page photos

   ### 修改 photos 页面类型
   >`/Hexo/source/photos/index.md` 文件内添加字段`type: photos` 增加图片展示代码

```sh
sed -i "/date:/a type: photos" /Hexo/source/photos/index.md
cat <<EOF >>/Hexo/source/photos/index.md
{% raw %}
<style>
.photo img{
    border: 1px solid #999;
    height:150px;
    width: 150px;
}
.photo li{
    margin: 10px;
    float: left;
    list-style: none;
    display: block;
}
</style>
<div class="photo">
{% endraw %}

* ![](http://oevo99fcp.bkt.clouddn.com/1fd85d5f74fe5b5ebaf6189f1cb71561.jpg)
* ![](http://oevo99fcp.bkt.clouddn.com/1fd85d5f74fe5b5ebaf6189f1cb71561.jpg)
* ![](/images/avatar.png)
* ![](http://192.168.3.3/images/avatar.png)
* ![](http://192.168.3.3/images/avatar.png)
* ![](http://192.168.3.3/images/avatar.png)
* ![](http://192.168.3.3/images/avatar.png)
* ![](http://192.168.3.3/images/avatar.png)

{% raw %}
<div style="clear:both"></div>
</div>
{% endraw %}
EOF
```

## 添加页面到导航

   ### 编辑主题配置文件，修改menu菜单下的字段 
   >取消`tags`,`about`,`categories`字段的注释,新增photos字段

    sed -i "s/#about:/about:/" /Hexo/themes/next/_config.yml
    sed -i "s/#tags:/tags:/" /Hexo/themes/next/_config.yml
    sed -i "s/#categories:/categories:/" /Hexo/themes/next/_config.yml
    sed -i "/categories:/a \ \ photos: \/photos\/ || photo" /Hexo/themes/next/_config.yml


   ### 添加导航photos的翻译
   >主题语言文件 `/Hexo/themes/next/languages/zh-Hans.yml` 在`menu`菜单下添加photos字段的翻译

    sed -i "/commonweal:/a \ \ photos: 相册" /Hexo/themes/next/languages/zh-Hans.yml

## 插件安装

   ### RSS订阅
   >`/Hexo`目录执行命令

    npm --registry https://registry.npm.taobao.org  install hexo-generator-feed --save

   ### Local Search搜索
   >`/Hexo`目录执行命令,编辑`/Hexo/themes/next/_config.yml` 修改`local_search:`菜单`enabled`的值设置为`true`

    npm install hexo-generator-search --save
    sed -i "600,610 s/enable:.*/enable: true/" /Hexo/themes/next/_config.yml

## 启动Hexo服务

    hexo server -p 80  
