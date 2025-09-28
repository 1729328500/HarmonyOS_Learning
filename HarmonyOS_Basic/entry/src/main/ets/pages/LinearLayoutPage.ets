import { ColoumnDemo } from '../components/ColumnDemo'
import { FlexDemo } from '../components/FlexDemo'
import { RowDemo } from '../components/RowDemo'

@Entry
@Component
@Preview
export struct BasicPage {
  build() {
    Column({ space: 20 }) {
      // 页面标题
      Text('组件展示')
        .fontSize(26)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })

      // 展示ColumnDemo组件
      Column() {
        Text('Column组件')
          .fontSize(16)
          .fontColor('#333')
          .margin({ bottom: 10 })

        ColoumnDemo()
      }
      .width('100%')
      .padding({ left: 15, right: 15 })

      // 展示FlexDemo组件
      Column() {
        Text('Flex组件')
          .fontSize(16)
          .fontColor('#333')
          .margin({ bottom: 10 })

        FlexDemo()
          .padding(15)
          .backgroundColor('#f5f5f5')
          .borderRadius(8)
      }
      .width('100%')
      .padding({ left: 15, right: 15 })

      // 展示RowDemo组件
      Column() {
        Text('Row组件')
          .fontSize(16)
          .fontColor('#333')
          .margin({ bottom: 10 })

        RowDemo()
      }
      .width('100%')
      .padding({ left: 15, right: 15, bottom: 20 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#f9f9f9')
  }
}
