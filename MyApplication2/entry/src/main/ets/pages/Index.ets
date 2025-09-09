import { router } from '@kit.ArkUI'

@Entry
@Component
struct Index {
  build() {
    Column({ space: 20 }) {
      Stack() {
        Image($r('app.media.background')) // 替换为实际图片资源
          .width(120)
          .height(120)
          .margin({ top: 50 })
          .borderRadius(24)

        Image($r('app.media.foreground')) // 替换为实际图片资源
          .width(120)
          .height(120)
          .margin({ top: 50 })
      }


      Text('欢迎使用我的应用')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)

      Button('去签到')
        .width(200)
        .onClick(() => {
          router.pushUrl({ url: 'pages/SignInPage' })
        })

      Button('查看公告')
        .width(200)
        .onClick(() => {
          router.pushUrl({ url: 'pages/NoticePage' })
        })
    }
    .width('100%')
    .height('100%')
  }
}