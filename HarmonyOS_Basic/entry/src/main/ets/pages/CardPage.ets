@Component
@Entry
@Preview
struct CardPage {
  @State isMoved: boolean = false

  build() {
    Column() {
      // 可滑动卡片容器
      Column() {
        Text('今日待办')
          .fontSize(20)
          .margin(10)

        // 展开后的任务列表
        if (this.isMoved) {
          Column() {
            Text('• 晨会（9:00）')
            Text('• 需求评审（14:00）')
            Text('• 代码审查（16:30）')
          }
          .margin({ bottom: 20 })
          .transition(TransitionEffect.OPACITY.animation({ duration:50 }))
        }
      }
      .width('90%')
      .padding(10)
      .backgroundColor('#ffe3e0e0')
      .borderRadius(16)
      .translate({
        y: this.isMoved ? -300 : 0
      })
      .animation({
        duration: 800,
        curve: Curve.EaseInOut,
        expectedFrameRateRange: {
          min:60,
          max: 120,
          expected: 90,
        }
      })
      .onClick(() => {
        this.isMoved = !this.isMoved
      })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.End)
  }
}