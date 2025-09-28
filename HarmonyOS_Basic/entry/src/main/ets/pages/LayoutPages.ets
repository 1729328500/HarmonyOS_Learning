import { GridDemo } from "../components/GridDemo"
import { StackDemo } from "../components/StackDemo"


@Entry
@Component
@Preview
export struct LayoutPages {
  build() {
    Column({ space: 20 }) {
      // 展示 Stack组件
      Column() {

        StackDemo()

      }


      // 展示Grid组件
      Column() {
        GridDemo()
      }
      .width('100%')
      .padding({ left: 15, right: 15 })


    }
    .width('100%')
    .height('100%')
    .backgroundColor('#f9f9f9')
  }
}
