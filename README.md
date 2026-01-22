# ShareLine - Hugo 技术博客模板

一个开箱即用的技术博客模板，基于 Hugo + PaperMod + GitHub Pages，专为技术写作者设计。

## ✨ 特性

- 🚀 零配置部署到 GitHub Pages
- 📝 Markdown 写作，专注内容
- 🔍 内置全文搜索
- 🌙 自动深色模式
- 📱 响应式设计，移动端友好
- ⚡ 极速加载，SEO 优化
- 🏷️ 支持分类、标签、系列文章

## 🚀 快速开始

### 1. 使用此模板

点击 GitHub 页面右上角的 **Use this template** 按钮，创建你自己的仓库。

### 2. 克隆到本地

```bash
git clone --recursive https://github.com/你的用户名/你的仓库名.git
cd 你的仓库名
```

> `--recursive` 会同时拉取 PaperMod 主题子模块

### 3. 修改配置

编辑 `hugo.yaml`，替换以下内容：

```yaml
baseURL: "https://你的用户名.github.io/你的仓库名/"
params:
  author: "你的名字"
  socialIcons:
    - name: github
      url: "https://github.com/你的用户名"
```

### 4. 本地预览

```bash
# 安装 Hugo (Windows)
winget install Hugo.Hugo.Extended

# 启动本地服务器
hugo server -D
```

访问 http://localhost:1313 查看效果。

### 5. 部署

1. 进入 GitHub 仓库 → Settings → Pages
2. Source 选择 **GitHub Actions**
3. 推送代码后自动部署

## 📁 目录结构

```
├── content/
│   ├── posts/           # 文章目录
│   │   ├── ai/          # AI 分类
│   │   └── programming/ # 编程分类
│   ├── about.md         # 关于页面
│   ├── projects.md      # 项目展示
│   └── search.md        # 搜索页面
├── static/images/       # 图片资源
├── hugo.yaml            # 站点配置
├── new-post.bat         # 快速创建文章 (Windows)
└── publish.bat          # 一键发布 (Windows)
```

## ✍️ 写作

### 创建新文章

**方式一：使用脚本 (Windows)**
```bash
双击 new-post.bat
```

**方式二：手动创建**
```bash
hugo new posts/programming/my-post.md
```

### 文章模板

```markdown
---
title: "文章标题"
date: 2024-01-01
draft: false
tags: ["标签1", "标签2"]
categories: ["分类"]
summary: "文章摘要"
---

正文内容...
```

## 🎨 自定义

### 添加新分类

1. 在 `content/posts/` 下创建新文件夹
2. 创建 `_index.md` 文件（可选，用于分类描述）

### 修改首页内容

编辑 `hugo.yaml` 中的 `homeInfoParams`：

```yaml
homeInfoParams:
  Title: "你的欢迎语"
  Content: "博客简介"
```

### 添加社交链接

支持的图标：github, twitter, linkedin, email, rss 等，完整列表见 [PaperMod 文档](https://github.com/adityatelange/hugo-PaperMod/wiki/Icons)

## 📄 License

MIT
