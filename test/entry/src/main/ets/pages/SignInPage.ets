import { UserCheckInInfoModule } from '../view/UserCheckInInfoModule';
import { DailyTaskStatusModule } from '../view/DailyTaskStatusModule';
import { SignRuleCollapseModule } from '../view/SignRuleCollapseModule';

@Component
export struct SignInPage {
  private scroller: Scroller = new Scroller();

  build() {
    Flex({ direction: FlexDirection.Column }) {
      Scroll(this.scroller) {
        Column() {
          UserCheckInInfoModule()
					DailyTaskStatusModule()
					SignRuleCollapseModule()
        }
        .width('100%')
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Center)
      }
      .scrollable(ScrollDirection.Vertical)
      .scrollBar(BarState.Off)
      .width('100%')
    }
    .backgroundColor($r('app.color.page_bg_color'))
  }
}
