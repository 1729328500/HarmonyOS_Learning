@Component
@Entry
@Preview
struct ExplictAnimation {
  @State isMoved: boolean = false
  @State btnWidth: number = 120
  @State color: string = "#2196F3"
  @State rotateAngle: number = 0
  @State Scale: number = 1.0

  build() {
    Navigation(){
      Column({space: 6}){
        Text('基础动画')
          .fontSize(26)
          .fontWeight(FontWeight.Bold)

        Button('改变位置').onClick(() => {
          this.isMoved = !this.isMoved
        })

        Rect({width:100, height: 50})
          .fill(this.isMoved? Color.Red : Color.Blue)
          .translate({x: this.isMoved ? 100 : 0, y: 0})
          .animation({
            duration:1000,
            curve:Curve.Smooth,

          })

        Circle({width: 60,height: 60})
          .fill("#ff11e3f6")
          .translate({x: this.isMoved ? 100 : 0, y: 0})
          .animation({
            duration: 1000,
            curve: Curve.Smooth
          })

        Button('点击改变文字大学和颜色')
          .width(this.btnWidth)

        Button('角度变化')
          .onClick(() => {
            this.rotateAngle = 180
          })
          .margin(50)
          .rotate({angle: this.rotateAngle})
          .animation({
            duration: 1200,//时常
            curve: Curve.Friction,//阻尼动画
            delay: 500,//延迟
            iterations: -1,//无限循环
            playMode: PlayMode.Alternate,//循环播放模式
            expectedFrameRateRange: { //帧率
              min:20,
              max: 120,
              expected: 90,
            }
          })


        // 呼吸灯主体
        Image($r('app.media.heart'))
          .width(100)
          .height(100)
            // 应用缩放
          .scale({x: this.Scale, y: this.Scale})
            // 动画配置 - 组件加载后自动启动
          .animation({
            duration: 1000,//时常
            curve: Curve.Friction,//阻尼动画
            delay: 500,//延迟
            iterations: -1,//无限循环
            playMode: PlayMode.Alternate,//循环播放模式
            expectedFrameRateRange: {
              min:20,
              max: 120,
              expected: 90,
            }                 // 延迟0.8秒开始，给组件加载留出时间
          })
          .onAppear(() =>{
            setInterval(() =>{
              this.Scale = this.Scale === 1 ? 1.3 : 1
            }, 1200)
          })

      }
      .padding(16)
    }
    .title('基础动画')
    .titleMode(NavigationTitleMode.Mini)
  }
}