import { UserInfo } from "../model/UserInfo";
import { UserProfile } from "../components/UserProfile";

@Entry
@Component
export struct UserList {
  @State userList: UserInfo[] = [
    {
      id: 1,
      name: "张三",
      age: 18,
      avatar: $r('app.media.3'),
      active: true,
    },
    {
      id: 2,
      name: "李四",
      age: 25,
      avatar: $r('app.media.2'),
      email: "lisi@example.com",
      active: true
    },
    {
      id: 3,
      name: "王五",
      age: 30,
      avatar: $r('app.media.3'),
      active: false,
      email: "wangwu@example.comwithalongemailaddress.com" // 长邮箱测试省略效果
    }
  ];

  build() {
    Column() {
      Text("用户列表")
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 15, left: 15 })
        .textAlign(TextAlign.Start)
        .width('100%')

      List() {
        ForEach(this.userList, (user: UserInfo) => {
          ListItem() {
            UserProfile({ userInfo: user })
          }
          .padding({ left: 15, right: 15 })
        }, (user: UserInfo) => user.id.toString())
      }
      .width('100%')
      .divider({ strokeWidth: 1, color: '#f0f0f0' })  // 列表分隔线
    }
    .width('100%')
    .backgroundColor('#f5f5f5')
  }
}
