@Entry
@Component
struct Index {
  // 保留原有的路由跳转方法
  private navigateToPage(pageUrl: string) {
    this.getUIContext().getRouter().pushUrl({ url: pageUrl })
  }

  build() {
    Column() {
      // 页面标题
      Text('功能导航')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 30 })

      // 使用List组件展示导航项
      List() {
        // @State示例
        ListItem() {
          Button('@State示例')
            .width('100%')
            .height(60)
            .onClick(() => this.navigateToPage('pages/StateExample'))
        }
        .padding({ left: 10, right: 10, bottom: 8 })

        // @Prop示例
        ListItem() {
          Button('@Prop示例')
            .width('100%')
            .height(60)
            .onClick(() => this.navigateToPage('pages/ProductListPage'))
        }
        .padding({ left: 10, right: 10, bottom: 8 })

        // @Link示例
        ListItem() {
          Button('@Link示例')
            .width('100%')
            .height(60)
            .onClick(() => this.navigateToPage('pages/SettingsPage'))
        }
        .padding({ left: 10, right: 10, bottom: 8 })

        // @Watch示例
        ListItem() {
          Button('@Watch示例')
            .width('100%')
            .height(60)
            .onClick(() => this.navigateToPage('pages/DataWatchExample'))
        }
        .padding({ left: 10, right: 10, bottom: 8 })

        // 用户列表
        ListItem() {
          Button('用户列表')
            .width('100%')
            .height(60)
            .onClick(() => this.navigateToPage('pages/UserList'))
        }
        .padding({ left: 10, right: 10 })
      }
      .width('100%')
    }
    .width('100%')
    .height('100%')
    .padding(20)
  }
}
