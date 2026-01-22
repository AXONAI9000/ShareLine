# ShareLine 技术博客

基于 Hugo + PaperMod + GitHub Pages 的技术博客。

## 快速开始

### 1. 安装 Hugo

```bash
winget install Hugo.Hugo.Extended
```

### 2. 添加 PaperMod 主题

```bash
git init
git submodule add --depth=1 https://github.com/adityatelange/hugo-PaperMod.git themes/PaperMod
```

### 3. 本地预览

```bash
hugo server -D
```

访问 http://localhost:1313 查看效果。

### 4. 创建新文章

双击 `new-post.bat`，按提示输入标题和分类。

### 5. 发布博客

双击 `publish.bat`，自动提交并推送到 GitHub。

## 目录结构

```
ShareLine/
├── .github/workflows/deploy.yml    # 自动部署配置
├── archetypes/default.md           # 文章模板
├── content/
│   ├── posts/
│   │   ├── ai/                     # AI相关文章
│   │   └── programming/            # 编程相关文章
│   ├── about.md                    # 关于我
│   ├── projects.md                 # 项目展示
│   └── search.md                   # 搜索页面
├── static/images/                  # 图片资源
├── themes/PaperMod/                # 主题(git submodule)
├── hugo.yaml                       # 站点配置
├── new-post.bat                    # 快速创建文章
└── publish.bat                     # 一键发布
```

## 配置说明

编辑 `hugo.yaml` 文件，修改以下内容：

1. `baseURL`: 改为你的 GitHub Pages 地址
2. `params.author`: 改为你的名字
3. `params.socialIcons`: 添加你的社交链接
4. `params.editPost.URL`: 改为你的仓库地址

## GitHub 设置

1. 创建 GitHub 仓库
2. 在仓库 Settings > Pages 中，选择 "GitHub Actions" 作为 Source
3. 推送代码后，GitHub Actions 会自动构建和部署

## 日常使用

1. **创建文章**: 双击 `new-post.bat`
2. **编辑文章**: 用 VS Code 或其他编辑器编辑 Markdown 文件
3. **本地预览**: 运行 `hugo server -D`
4. **发布**: 双击 `publish.bat`

## License

MIT
