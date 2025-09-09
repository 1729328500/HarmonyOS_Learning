import { UserCheckInModule } from '../view/UserCheckInModule';
import { AnnouncementCarouselModule } from '../view/AnnouncementCarouselModule';
import { MultiFunctionEntryModule } from '../view/MultiFunctionEntryModule';
import { FeaturedPromotionsModule } from '../view/FeaturedPromotionsModule';
import { TopScoreRankingModule } from '../view/TopScoreRankingModule';

@Component
export struct HomePage {
  private scroller: Scroller = new Scroller();

  build() {
    Flex({ direction: FlexDirection.Column }) {
      Scroll(this.scroller) {
        Column() {
          UserCheckInModule()
					AnnouncementCarouselModule()
					MultiFunctionEntryModule()
					FeaturedPromotionsModule()
					TopScoreRankingModule()
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
