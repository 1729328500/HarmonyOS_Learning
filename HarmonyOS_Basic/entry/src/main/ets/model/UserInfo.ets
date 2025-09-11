export interface UserInfo {
  id: number //用户id统一标识
  name: string
  age: number
  avatar: Resource
  email?: string //可选字段
  active: boolean
}