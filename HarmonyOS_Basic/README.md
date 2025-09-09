# HarmonyOS 开发基础指南

## 一、开发环境搭建
### 1. 硬件与软件要求
- **硬件配置**：内存≥8GB（推荐16GB），磁盘空间≥50GB
- **开发工具**：DevEco Studio 5.0.3+（需勾选**鸿蒙开发套件**）
- **网络环境**：稳定连接用于下载SDK（建议配置镜像源加速）

**2. 环境配置步骤**
1. 安装Node.js 16.x LTS与JDK 11+
2. 通过DevEco Studio安装HarmonyOS SDK（选择最新稳定版）
3. 配置ohpm包管理器：<rsup>1</rsup>
   ```bash
   ohpm config set registry https://repo.harmonyos.com
   ```

### 3. 验证环境
- 创建Empty Ability项目
- 测试模拟器运行状态（需开启BIOS虚拟化技术）
- 检查代码编辑、构建、调试功能

---

## 二、ArkTS语言基础
**1. 核心特性**
- **继承TypeScript语法**：支持静态类型检查、面向对象编程
- **声明式UI开发**：通过`@Component`、`@State`等装饰器实现数据驱动视图
- **轻量化并发模型**：基于Actor模型的异步任务处理

**2. 基础语法示例**
```typescript
// 自定义组件定义
@Component
struct HelloPage {
  @State message: string = "Hello HarmonyOS"

  build() {
    Column() {
      Text(this.message)
        .fontSize(30)
        .onClick(() => {
          this.message = "点击事件触发"
        })
    }
  }
}
```

**3. 命名规范（参考编程规范）**
- **类/枚举/命名空间**：UpperCamelCase（如`UserType`）
- **变量/方法**：lowerCamelCase（如`userName`）
- **避免模糊命名**：禁止使用`data`、`info`等泛用词

---

## 三、UI开发入门
### 1. 声明式布局范式
- **基础组件**：Text、Button、Image、Column/Row等
- **布局方式**：弹性盒子（Flex）与网格布局（Grid）
- **资源管理**：通过`resources`目录统一管理颜色/字体/图片

**2. UI生成工具（UI Generator）**
1. 启用**UI Generator**插件（File > Settings > Plugins）
2. 通过Tools > Generate Project导入XML布局文件
3. 自动生成包含以下内容的工程：
    - 组件属性定义
    - 资源映射文件
    - 可预览的ArkTS页面代码

---

## 四、基础能力实践
### 1. 页面路由
```typescript
import router from '@kit.ArkUI';

// 页面跳转示例
router.pushUrl({ url: 'pages/DetailPage' });
```

**2. 文件操作**
```typescript
import fs from '@kit.Io';

// 读取文件内容
const file = fs.openSync('path/to/file', fs.OpenMode.READ_ONLY);
const buffer = new ArrayBuffer(1024);
const len = fs.readSync(file.fd, buffer);
```

**3. 网络请求**
```typescript
import http from '@kit.Network';

// GET请求示例
let request = http.createHttp();
request.request("https://api.example.com/data", (err, data) => {
  if (!err) {
    console.log("响应数据:", data.result);
  }
});
```

---

## 五、学习路径建议
1. **官方资源优先**：通过DevEco Studio的Sample Center获取示例工程
2. **实战驱动学习**：从仿写官方Demo过渡到独立开发小型应用
3. **掌握调试工具**：
    - 使用`Previewer`实时预览UI
    - 通过`HiLog`输出调试日志
4. **参考体系化教材**：
    - 《鸿蒙HarmonyOS 5开发之路 卷1：ArkTS语言篇》
    - 官方文档《ArkUI声明式开发精解》

> 避坑提示：
> - 字符串编码统一使用`util.TextEncoder`处理中文
> - 真机调试需提前申请开发者证书