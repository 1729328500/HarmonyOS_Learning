@Component
@Preview
export struct MyButton {
  @Prop buttonText: string = "按钮"  // 接收按钮文字
  @Prop buttonColor: ResourceColor = '#50AEB6'  // 接收背景色

  build() {
    Button(this.buttonText)
      .type(ButtonType.Normal)
      .backgroundColor(this.buttonColor)
  }
}

