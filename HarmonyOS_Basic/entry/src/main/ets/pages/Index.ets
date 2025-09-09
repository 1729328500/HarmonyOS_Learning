//导入MyButton组件
import {MyButton} from  '../components/MyButton'
import {PersonCard} from  '../components/PersonCard'


@Entry
@Component
 struct  Index {
  @Prop isOnline: boolean = true

  build() {
    Column({space:20}){
      Text(this.isOnline ? "在线" : "离线")
      PersonCard({
      })

      MyButton({
        buttonText: "立即关注",
        buttonColor: "#ff27daf8"
      })
    }
    .width('100%')
    .height('100%')
    .padding(20)
  }
}