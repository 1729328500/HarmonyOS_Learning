import { UserInfo } from '../model/UserInfo'
import { UserCard } from '../components/UserCard'

/**
 * StateExample.ets
 * 简要描述：
 * 作者：moqi
 * 日期：2025/9/9
 */
@Entry
@Component
export struct StateExample {
  @State count: number = 0
  @State isLoading: boolean = false
  @State userInfo: UserInfo = {
    id: 1,
    name: '张三',
    age: 18,
    avatar: $r('app.media.3'),
    email: '16422802@qq.com',
    active: true
  }

  build() {
    Column({ space: 16 }) {
      Text(`计数: ${this.count}`)
        .fontSize(18)

      Button('增加')
        .onClick(() => {
          this.count++ // 自动触发UI更新
        })

      UserCard({ userInfo: this.userInfo })

      Button(this.isLoading ? '加载中...' : '加载数据')
        .onClick(() => {
          this.loadData()
        })
    }
  }

  async loadData() {
    this.isLoading = true
    try {
      // 模拟API调用
      await new Promise<void>(resolve => setTimeout(resolve, 2000))
      // 更新 userInfo 信息
      this.userInfo = {
        id: 1,
        name: '张三丰',
        age: 28,
        avatar: $r('app.media.2'),
        email: '888888@qq.com',
        active: false
      }
    } finally {
      this.isLoading = false
    }
  }
}