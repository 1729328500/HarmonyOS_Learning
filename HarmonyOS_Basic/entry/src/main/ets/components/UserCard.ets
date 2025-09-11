import { UserInfo } from "../model/UserInfo"

/**
 * UserCard.ets
 * 简要描述：用户信息卡片组件
 * 作者：moqi
 * 日期：2025/9/9
 */
@Component
export struct UserCard {
  @Prop userInfo: UserInfo = {
    id: 1,
    name: '默认用户',
    age: 18,
    avatar: $r('app.media.2'),
    email: 'default@qq.com',
    active: true
  }

  build() {
    Row({ space: 10 }) {
      Image(this.userInfo.avatar)
        .width(80)
        .height(80)
        .borderRadius(40)

      Column({ space: 8 }) {
        Text(`姓名：${this.userInfo.name}`)
          .fontSize(20)
          .fontWeight(FontWeight.Bold)

        Text(`年龄：${this.userInfo.age}`)
          .fontSize(18)

        if (this.userInfo.email) {
          Text(`邮箱：${this.userInfo.email}`)
            .fontSize(18)
            .fontColor('#3366cc') // 可点击视觉
            .decoration({ type: TextDecorationType.Underline })
            .onClick(() => {
              // 模拟点击事件
              console.log('点击了邮箱：', this.userInfo.email)
            })
        }

        Text(`状态：${this.userInfo.active ? '正常' : '禁用'}`)
          .fontSize(18)
          .fontColor(this.userInfo.active ? '#3698a0' : '#999')
      }
    }
  }
}
