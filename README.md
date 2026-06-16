# 字段标准化命名

纯前端工具，在浏览器本地运行，用于 Hive 表字段中英文标准化命名。

## 在线使用

部署完成后访问：**https://zhangruixiang999.github.io/hive-field-namer/**

## 部署到 GitHub Pages

在项目目录执行（首次需登录 GitHub）：

```bash
chmod +x deploy.sh
./deploy.sh
```

或手动操作：

```bash
brew install gh
gh auth login
gh repo create hive-field-namer --public --source=. --remote=origin --push
```

推送后在仓库 **Settings → Pages → Source** 选择 **GitHub Actions**。

## 功能

### 字段转换
- 三列并排：中文输入 / 英文字段（标准化）/ 英文直译
- 实时生成，支持换行、逗号、顿号、空格分隔
- 词库最长匹配分词，天数支持 `90d` 格式
- 支持黑色 / 白色主题

### 命名训练
- 上传 Excel / CSV 两列对照表（中文 + 英文字段）
- 自动识别列顺序，支持查看、删除、导出

### 关键词库
- 内置业务词条，支持 JSON 导入
- 转换输入不会自动污染词库

## 本地使用

```bash
python3 -m http.server 8765
```

浏览器打开 `http://localhost:8765`

## 文件说明

| 文件 | 说明 |
|------|------|
| `index.html` | 主页面 |
| `keywords.json` | 可扩展关键词库 |
