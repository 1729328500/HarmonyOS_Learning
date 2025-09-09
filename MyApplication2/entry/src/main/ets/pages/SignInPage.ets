// 导入Toast组件
import promptAction from '@ohos.promptAction';

@Entry
@Component
struct SignInPage {
  @State inputName: string = ''
  @State isSigned: boolean = false

  build() {
    Column({ space: 15 }) {
      TextInput({ placeholder: '请输入姓名' })
        .width('80%')
        .onChange((value: string) => {
          this.inputName = value
        })

      Button(this.isSigned ? '已签到' : '立即签到')
        .width(180)
        .height(50)
        .backgroundColor(this.isSigned ? '#CCCCCC' : '#007DFF')
        .onClick(() => {
          if (!this.isSigned) {
            promptAction.showToast({
              message: '签到成功+10积分',
              duration: 2000
            })
            this.isSigned = true
          }
        })
    }
    .width('100%')
    .height('100%')
    .padding(20)
  }
}