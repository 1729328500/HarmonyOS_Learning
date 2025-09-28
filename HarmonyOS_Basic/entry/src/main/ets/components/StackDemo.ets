@Component
@Preview
export  struct StackDemo {
  @Prop avatarUrl: string = 'https://whyhd.oss-cn-nanjing.aliyuncs.com/2024/11/19/me.png'
  @Prop userName: string = '张三'
  @State hasNewMsg: boolean = true //是否有消息
  build() {

      Stack({ alignContent: Alignment.TopEnd }){
        //底层：头像
        Image(this.avatarUrl || $r('app.media.2'))
          .width(60)
          .height(60)
          .borderRadius(30)
          .border({
            width: 2,
            color: Color.Red
          })

        //消息徽章,红色圆定位左上角
        if (this.hasNewMsg){
          Circle({width: 10, height: 10}).fill(Color.Red).position({x: 68, y: 4})
          Text('8').fontSize(10).fontColor(Color.White).position({x: 70, y: 4})
        }

        //姓名
        Text(this.userName)
          .fontSize(14)
          .fontColor(Color.Black)
          .position({x: 20, y: 70})
          .width(60)
          .textAlign(TextAlign.Center)
      }
    .width(80)
    .height(90)
  }
}