@Entry
@Component
struct NoticePage {
  @State notices: Array<string> = [
    '系统升级公告',
    '国庆假期服务调整通知',
    '新版本功能预告'
  ]

  build() {
    Column({ space: 10 }) {
      ForEach(this.notices, (item: string) => {
        Column() {
          Text(item)
            .fontSize(18)
            .padding(15)
        }
        .borderRadius(8)
        .backgroundColor('#FFFFFF')
        .width('100%')
      })
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor('#F5F5F5')
  }
}