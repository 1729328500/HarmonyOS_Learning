# HarmonyOS 开发学习指南

## 一、学习路径规划

### 1. 基础入门

- 掌握 ArkTS 语法特性（类 TypeScript 语法扩展）
- 熟悉声明式 UI 开发范式（资源管理、组件布局）
- 基础能力实践：页面路由、弹窗交互、网络请求

### 2. 进阶开发

- 跨端设备协同：分布式数据管理、跨设备调用
- 原子化服务：服务卡片开发与动态更新
- 性能优化：首屏加载加速、内存泄漏排查

### 3. 高级专题

- Native 开发：C++混合编程（参考搜索结果 3 的 AscendC 实现）
- 三方库开发：HAR 包构建与发布（参考搜索结果 2）
- 安全能力：数据加密、权限管理

---

## 二、学习资源推荐

**官方资源**

- DevEco Studio 3.1.1+ 工具链（含模拟器/真机调试）
- [HarmonyOS 开发者学堂](https://developer.harmonyos.com)
- 官方文档：ArkTS API 参考、组件指南

**推荐书籍**

- 《HarmonyOS 应用开发实战》
- 《ArkUI 声明式开发精解》

### 社区资源

- 开发者知识库（含常见问题解决方案）
- OpenHarmony 三方库中心仓<rsup>1</rsup>

---

## 三、开发环境配置

**1. 基础环境**

```bash
Node.js 16.x LTS
JDK 11+
ohpm包管理器（集成于DevEco Studio）
```

### 2. SDK 配置

- 在 DevEco Studio 中下载对应 API 版本的 SDK
- 配置 ohpm 镜像源加速下载：

```bash
ohpm config set registry https://repo.harmonyos.com
```

---

## 四、基础语法示例

**1. 文件 MD5 计算（参考搜索结果 4/6）**

```typescript
import cryptoFramework from "@kit.CryptoArchitectureKit";

async function calculateFileMD5(uri: string): Promise<string> {
  const md = cryptoFramework.createMd("MD5");
  const file = fs.openSync(uri, fs.OpenMode.READ_ONLY);
  const buffer = new ArrayBuffer(1024);
  let len = fs.readSync(file.fd, buffer);
  while (len !== -1 && len > 0) {
    await md.update(new Uint8Array(buffer.slice(0, len)));
    len = fs.readSync(file.fd, buffer);
  }
  const digest = await md.digest();
  return digest.toHexString();
}
```

---

## 五、组件使用范例

### 1. 媒体文件选择（参考搜索结果 1）

```typescript
import picker from "@ohos.file.picker";

async function selectImage() {
  const photoPicker = new picker.PhotoViewPicker();
  const result = await photoPicker.select();
  const fileUri = result.photoUris;
  // 处理选中文件
}
```

---

## 六、常见问题解决

**中文 MD5 计算异常**

- **原因**：字符串编码方式不一致
- **解决方案**：使用`util.TextEncoder`统一编码

```typescript
import util from "@kit.ArkTS";

const encoder = new util.TextEncoder();
const data = encoder.encode("中文内容");
```

---

## 七、进阶能力拓展

### 1. 共享包发布流程（参考搜索结果 2）<rsup>1</rsup>

```bash
ohpm config set key_path ~/.ssh/private_key
ohpm publish ./build/outputs/har/my_library.har
```

**2. NPU 加速开发（参考搜索结果 3）**

- AscendC 算子开发环境搭建<rsup>2</rsup>
- 端云协同推理架构设计

---

> **学习建议**：
>
> 1. 从官方示例工程入手实践基础功能
> 2. 参与开源项目贡献提升代码质量
> 3. 定期查阅 API 变更日志保持技术更新

可通过 DevEco Studio 的`Sample Center`获取官方示例代码，结合项目实战巩固知识体系。
