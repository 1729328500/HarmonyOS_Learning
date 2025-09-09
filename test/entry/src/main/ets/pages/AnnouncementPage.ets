import { AnnouncementCategoryModule } from '../view/AnnouncementCategoryModule';
import { AnnouncementListModule } from '../view/AnnouncementListModule';
import { RecommendationModule } from '../view/RecommendationModule';

@Component
export struct AnnouncementPage {
  private scroller: Scroller = new Scroller();

  build() {
    Flex({ direction: FlexDirection.Column }) {
      Scroll(this.scroller) {
        Column() {
          AnnouncementCategoryModule()
					AnnouncementListModule()
					RecommendationModule()
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
