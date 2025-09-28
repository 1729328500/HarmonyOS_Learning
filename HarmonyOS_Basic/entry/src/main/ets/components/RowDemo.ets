
@Component
@Preview
export  struct RowDemo {
  build() {
    Row({space: 8}) {
      //1.图片
      Image($r("app.media.4"))
        .width(24)
        .height(24)

      //2.文本框,占据中间剩余空间
      Text('鸿蒙开发')
        .fontSize(12)
        .fontWeight(FontWeight.Medium)
        .layoutWeight(1)//权重中间自适应的关键

      //3.按钮
      Button('详情')
        .type(ButtonType.Capsule)
        .width(80)
        .height(20)
    }.padding({ left:10,right:10 })
    .width(300)
    .height(60)
    .backgroundColor('#ff43eaaf')
  }
}