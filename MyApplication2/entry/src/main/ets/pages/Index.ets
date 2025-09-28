import router from '@ohos.router';

// 定义导航项数据结构
interface NavigationItem {
  title: string;
  description: string;
  icon: ResourceStr;
  route: string;
}

@Entry
@Component
struct Index {
  // 导航项数据，使用@State装饰器，数据变化时自动更新UI
  @State navigationItems: NavigationItem[] = [
    {
      title: 'Demo页面',
      description: '测试页面',
      icon: $r('app.media.startIcon'),
      route: 'pages/Demo'
    },
    // 可以在这里添加更多导航项
    {
      title: '页面2',
      description: '第二个测试页面',
      icon: $r('app.media.text'),
      route: 'pages/Page2'
    },
    {
      title: '页面3',
      description: '第三个测试页面',
      icon: $r('app.media.message'),
      route: 'pages/Page3'
    }
  ];

  build() {
    // 使用Column作为根容器，设置整体布局
    Column() {
      Text("学习")
      // 遍历导航项数据生成列表
      ForEach(this.navigationItems, (item: NavigationItem) => {
        // 单个导航项组件，点击可跳转
        Flex({ justifyContent: FlexAlign.Start, alignItems: ItemAlign.Center }) {
          Image(item.icon)
            .width(40)
            .height(40)
            .margin({ right: 12 });
          Column({ space: 4 }) {
            Text(item.title)
              .fontSize(18)
              .fontWeight(FontWeight.Medium);
            Text(item.description)
              .fontSize(14)
              .fontColor('#666666');
          };
        }
        .width('90%') // 调整宽度，使其看起来更像卡片
        .padding(16)
        .backgroundColor('#ffd5f683')
        .borderRadius(12)
        .margin({ top: 12 }) // 每个卡片之间的间距
        .shadow({
          radius: 4,
          color: '#EEEEEE',
          offsetX: 0,
          offsetY: 2
        }) // 添加阴影，增强卡片效果
        .onClick(() => {
          // 点击导航项，跳转到指定页面
          router.pushUrl({ url: item.route });
        });
      });
    }
    .width('100%')
    .height('100%')
    .backgroundColor('background_color') // 页面背景色
    .padding(16);
  }
}