# Toonflow 前端开发指南

Vue 3 + Vite 前端项目。

## 目录结构

```
toonflow-web/
├── src/
│   ├── assets/           # 静态资源（图片、样式等）
│   ├── components/       # 通用组件
│   ├── lib/              # 公共库
│   ├── locales/          # 多语言（i18n）
│   ├── pages/            # 页面组件
│   ├── router/           # 路由配置
│   ├── stores/           # Pinia 状态管理
│   ├── types/            # 类型声明
│   ├── utils/            # 工具函数
│   ├── views/            # 业务视图
│   ├── App.vue           # 根组件
│   └── main.ts           # 入口
├── public/               # 公共静态文件
├── scripts/              # 辅助脚本
├── build.sh              # 构建脚本（编译后复制到 ../toonflow-docker/data/web/）
├── package.json
├── vite.config.ts
└── tsconfig.json
```

## 技术栈

| 类别 | 技术 |
|------|------|
| 框架 | Vue 3 (Composition API) |
| 构建 | Vite |
| 语言 | TypeScript |
| 路由 | Vue Router |
| 状态管理 | Pinia |
| i18n | Vue I18n |
| 包管理器 | Yarn |

## 开发命令

```bash
# 安装依赖
yarn install

# 开发服务器
yarn dev

# 构建生产产物
yarn build

# 构建 + 部署到 Docker 数据目录
./build.sh    # 产物输出到 ../toonflow-docker/data/web/
```

## 构建说明

`build.sh` 会自动跳过 vue-tsc（auto-import 类型不完整），执行 vite build，并将产物复制到 `../toonflow-docker/data/web/`。

## 核心视图

- `views/novel/` — 小说管理（导入、编辑、事件分析）
- `views/script/` — 剧本管理
- `views/cornerScape/` — 分镜管理
- `views/assets/` — 素材管理
- `views/production/` — 制作工作台（分镜表、生成、剪辑）
- `views/project/` — 项目管理

## 状态管理

Pinia stores 位于 `src/stores/`：
- `project` — 当前项目信息
- `user` — 用户认证
- `setting` — 系统设置
- `productionAgent` / `scriptAgent` — Agent 状态
- `video` — 视频相关状态

## 多语言

语言文件位于 `src/locales/language/`，支持：
- zh-CN, zh-TW, en, ja_JP, ru_RU, th_TH, vi-VN

## 调试

```bash
yarn dev    # 开发服务器，热更新
```

## 许可证

Apache-2.0，详见 [LICENSE](./LICENSE)。
