import { UserInfo } from "../model/UserInfo"


@Entry
@Component
export struct DataWatchExample {
  @State @Watch('onCountChange') count: number = 0
  @State @Watch('onUserChange') userInfo: UserInfo = {
    id: 1,
    name: '默认用户',
    age: 18,
    avatar: $r('app.media.3'),
    email: 'default@qq.com',
    active: true
  }
  @State @Watch('onListChange') itemList: string[] = []

  // 监听单个属性变化
  onCountChange() {
    console.log('计数发生变化:', this.count)
    if (this.count > 100) {
      console.warn('计数超过限制!')
    }
  }

  // 监听对象变化
  onUserChange() {
    console.log('用户信息发生变化:', this.userInfo)
    this.validateUser()
  }

  // 监听数组变化
  onListChange() {
    console.log('列表发生变化:', this.itemList)
    this.updateListStats()
  }

  validateUser() {
    if (this.userInfo.age < 0 || this.userInfo.age > 150) {
      console.error('用户年龄不合法')
    }
  }

  updateListStats() {
    console.log(`列表长度: ${this.itemList.length}`)
  }

  build() {
    Column({ space: 16 }) {
      Text(`计数: ${this.count}`)
      Button('增加计数')
        .onClick(() => this.count++)

      Text(`用户: ${this.userInfo.name}, 年龄: ${this.userInfo.age}`)
      Button('更新用户')
        .onClick(() => {
          this.userInfo = {
            id: 1,
            name: '张三丰',
            age: 30,
            avatar: $r('app.media.2'),
            email: '888888@qq.com',
            active: false
          }
        })

      Text(`列表项数: ${this.itemList.length}`)
      Button('添加项目')
        .onClick(() => {
          this.itemList.push(`项目${this.itemList.length + 1}`)
        })
    }
  }
}