@Component
@Preview
export struct PersonCard {
  @Prop name: string = "张三"  // 姓名
  @Prop age: number = 25  // 年龄
  @Prop phone: number = 13951728429 //电话
  @Prop avatar: Resource = $r('app.media.3')  // 头像资源

  build() {
    Column({ space: 10 }) {
      Image(this.avatar)
        .width(80)
        .height(80)
        .borderRadius(40)

      Text(this.name)
        .fontSize(20)
        .fontWeight(FontWeight.Bold)

      Text(`年龄：${this.age}`)
        .fontColor("#666")

      Text(`电话，${this.phone}`)

    }
    .padding(20)
    .backgroundColor("#f5f5f5")
    .borderRadius(10)
  }
}

