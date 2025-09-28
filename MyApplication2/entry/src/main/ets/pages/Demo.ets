@Component
@Entry
struct Demo {
  build() {
    Navigation() {
      Column() {
        Text('这是Demo页面的内容')
          .fontSize(20)
          .margin({ top: 50 });
      }
      .width('100%')
      .height('100%')
      .padding(12);
    }
    .width('100%')
    .height('100%')
    .title('Demo页面')
    .titleMode(NavigationTitleMode.Mini) // 设置标题模式
    .hideBackButton(false); // 显示返回按钮
  }
}