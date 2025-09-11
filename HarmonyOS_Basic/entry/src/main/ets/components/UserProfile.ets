import { UserInfo } from "../model/UserInfo";


@Component
export struct UserProfile {
  @State userInfo: UserInfo = {
    id: 1,
    name: "张三",
    age: 18,
    avatar: $r('app.media.3'),
    active: true,
  }

  @State inputEmail: string = this.userInfo?.email || "";
  @State tempClipboard: string = ""; // 本地模拟剪贴板
  @State checkPaste: string = ""; // 用于检查粘贴的内容

  constructor(params: { userInfo: UserInfo }) {
    super();
    this.userInfo = params.userInfo;
    this.inputEmail = this.userInfo.email || "";
  }

  // 复制邮箱到模拟剪贴板
  handleCopyEmail() {
    if (this.userInfo.email) {
      this.tempClipboard = this.userInfo.email;
    }
  }

  // 从模拟剪贴板粘贴
  handlePaste() {
    this.checkPaste = this.tempClipboard;
  }

  // 处理邮箱输入变化
  onEmailChange(value: string) {
    this.inputEmail = value;
    this.userInfo.email = value;
  }

  build() {
    Column() {
      Image(this.userInfo.avatar)
        .width(80)
        .height(80)
        .borderRadius(40)

      Text(`姓名: ${this.userInfo.name}`)
        .fontSize(28)

      Text(`年龄: ${this.userInfo.age}`)
        .fontSize(26)

      if (this.userInfo.email) {
        Row() {
          Text(`邮箱: `)
            .fontSize(26)
          Button() {
            Text(this.userInfo.email)
              .fontSize(26)
              .maxLines(1)
              .textOverflow({ overflow: TextOverflow.Ellipsis })
          }
          .width(180)
          .borderWidth(0)
          .backgroundColor(Color.Transparent)
          .onClick(this.handleCopyEmail.bind(this))
        }
        .width('90%')
        .margin({ top: 10 })
      }

      // 邮箱输入框
      TextInput({
        placeholder: '请输入邮箱地址',
        text: this.inputEmail
      })
        .width('90%')
        .height(40)
        .border({ width: 1 })
        .margin({ top: 10 })
        .onChange(this.onEmailChange.bind(this))

      // 粘贴检查区域
      Row() {
        TextInput({
          placeholder: '粘贴邮箱检查',
          text: this.checkPaste
        })
          .width('70%')
          .height(40)
          .border({ width: 1 })

        Button('粘贴')
          .fontSize(16)
          .padding({ left: 10, right: 10 })
          .onClick(this.handlePaste.bind(this))
      }
      .width('90%')
      .margin({ top: 10 })

      Button(this.userInfo.active ? '禁用' : '启用')
        .margin({ top: 20 })
        .onClick(() => {
          this.userInfo.active = !this.userInfo.active
        })
    }
    .width('100%')
    .padding(20)
    .alignItems(0) // 0表示居中对齐，无需导入HorizontalAlign
  }
}
