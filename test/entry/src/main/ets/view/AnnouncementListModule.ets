import { BreakpointConstants } from '../common/BreakpointConstants';
import { CommonConstants } from '../common/CommonConstants';

@Component
export struct AnnouncementListModule {
  @State image: Resource = $r('app.media.noImage');
  @State mainText: string = "健康管理公告";
  @State subText: string = "关注健康，享受生活";
  @State commentCount: number = 42;
  @State mediaSource: string = "健康管理团队";
  @State publishTime: string = "2025-09-02";
  @StorageLink('currentWidthBreakpoint') currentWidthBreakpoint: string = BreakpointConstants.BREAKPOINT_SM;

  build() {
    Row() {
      Column() {
        Text(this.mainText)
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .padding({ bottom: 4 })
          .width(CommonConstants.FULL_PERCENT)

        Row() {
          Row({ space: 4 }) {
            Image($r('app.media.ic_public_comments'))
              .width(16)
              .height(16)
            Text(this.commentCount.toString())
              .fontSize(12)
              .fontColor(Color.Gray)
          }
          .margin({right:8})

          Text(this.mediaSource)
            .fontSize(12)
            .fontColor(Color.Gray)
            .margin({right:8})

          Text(this.publishTime)
            .fontSize(12)
            .fontColor(Color.Gray)
        }
        .width(CommonConstants.FULL_PERCENT)
        .alignItems(VerticalAlign.Center)
      }
      .padding({right: 6 })
      .width('65%')
      .height('90%')
      .alignItems(HorizontalAlign.Start)
      .justifyContent(FlexAlign.SpaceBetween)

      Image(this.image)
        .borderRadius($r('sys.float.corner_radius_level6'))
        .height('90%')
        .width('35%')
    }
    .height(90)
    .width(CommonConstants.FULL_PERCENT)
    .backgroundColor(Color.White)
    .padding({left:8,right:8})
  }
}