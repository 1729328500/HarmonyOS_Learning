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
        .padding({ left: 10, right: 10,bottom: 8 })

        //基础组件
        ListItem() {
          Button('基础组件')
            .width('100%')
            .height(60)
            .onClick(() => this.navigateToPage('pages/LinearLayoutPage'))
        }
        .padding({ left: 10, right: 10,bottom: 8 })

        //进阶组件
        ListItem() {
          Button('进阶组件')
            .width('100%')
            .height(60)
            .onClick(() => this.navigateToPage('pages/LayoutPages'))
        }
        .padding({ left: 10, right: 10,bottom: 8 })

        //显式动画
        ListItem() {
          Button('基础动画')
            .width('100%')
            .height(60)
            .onClick(() => this.navigateToPage('pages/ExplictAnimationPage'))
        }
        .padding({ left: 10, right: 10,bottom: 8 })
        //显式动画
        ListItem() {
          Button('卡片')
            .width('100%')
            .height(60)
            .onClick(() => this.navigateToPage('pages/CardPage'))
        }
        .padding({ left: 10, right: 10,bottom: 8 })
        ListItem() {
          Button('商品')
            .width('100%')
            .height(60)
            .onClick(() => this.navigateToPage('pages/ProductList'))
        }
        .padding({ left: 10, right: 10,bottom: 8 })
      }
      .width('100%')
    }
    .width('100%')
    .height('100%')
    .padding(20)
  }
}
