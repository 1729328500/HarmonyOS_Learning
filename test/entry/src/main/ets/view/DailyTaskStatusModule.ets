import {
  Data,
  DataSource
} from '../viewmodel/DailyTaskStatusModuleData';

import { LoadingStatus } from '../common/CommonEnums';
import { LoadingFailedView } from './LoadingFailedView';

import { BreakpointConstants } from '../common/BreakpointConstants';
import { BreakpointType } from '../util/BreakpointType';
import LazyDataSource from '../util/LazyDataSource';
import { CommonConstants } from '../common/CommonConstants';
import { ModuleTitleComponent } from '../common/ModuleTitleComponent'

@Component
export struct DailyTaskStatusModule {
  @State itemModel: Data =
    Data.getInstance();
  @Prop listDirection: Axis = Axis.Horizontal
  @State moduleTitle: string = "会员任务";
  @State moduleRedirectContent: string = "更多 >";
  @State loadingStatus: LoadingStatus = LoadingStatus.OFF;
  @State lazyDataSource: LazyDataSource<DataSource> =
    this.itemModel.lazyDataSource;
  private spaceArray: string[] = ['8vp', '16vp', '20vp'];
  @Consume('appPathStack') appPathStack: NavPathStack;
  @StorageLink('currentWidthBreakpoint') currentWidthBreakpoint: string = BreakpointConstants.BREAKPOINT_SM;

  jump(): void {
    this.appPathStack.pushPathByName('EmptyPagePathStack', null);

  }

  aboutToAppear() {
    this.loadResources();

  }

  loadResources(): void {
    this.loadingStatus = LoadingStatus.LOADING;
    this.itemModel.getResources().then(() => {
      this.loadingStatus = LoadingStatus.SUCCESS;
    }).catch(() => {
      this.loadingStatus = LoadingStatus.FAILED;
    });
  }

  build() {
    Column() {
      ModuleTitleComponent({ title: this.moduleTitle, moduleRedirectContent: this.moduleRedirectContent })

      if (this.loadingStatus === LoadingStatus.FAILED) {
        LoadingFailedView(() => this.loadResources())
      }
      if (this.loadingStatus === LoadingStatus.SUCCESS) {
        List({
          space: new BreakpointType(this.spaceArray[0], this.spaceArray[1],
            this.spaceArray[2]).getValue(this.currentWidthBreakpoint)
        }) {
          LazyForEach(this.lazyDataSource, (item: DataSource) => {
            ListItem() {
              VipTaskDisplayItem({
                icon: item.getIcon(),
                title: item.getTitle(),
                description: item.getDescription()
              })
            }
            .onClick(() => {
              this.jump()
            })
            .width('160vp')
            .height('60vp')
            .borderRadius($r('sys.float.corner_radius_level4'))
          }, (item: DataSource, index: number) => index + JSON.stringify(item))
        }
        .width('auto')
        .height('auto')
        .listDirection(this.listDirection)
        .scrollBar(BarState.Off)
      }
    }
    .margin({ bottom: "10vp" })
    .width('92%')
  }
}

@Component
export struct VipTaskDisplayItem {
  @State title: string = '模块名';
  @State description: string = '跳转';
  @State icon: Resource = $r("app.media.ic_public_app");

  build() {
    Row() {
      /**
       * TODO:
       * please modify it according to the actual situation.
       * directly modify {@link List_H_HorizontalGraphicTextFunctionItem3Model#ICONS}
       * or refactor method {@code getResources()} to implement your custom code logic.
       * @see List_H_HorizontalGraphicTextFunctionItem3Model#getResources()
       */
      Column() {
        Image(this.icon)
          .height('60%')
          .constraintSize({ maxWidth: '100%' })
          .objectFit(ImageFit.Contain)
      }
      .width('30%')
      .alignItems(HorizontalAlign.Start)
      Column() {
        /**
         * TODO:
         * please modify it according to the actual situation.
         * directly modify {@link List_H_HorizontalGraphicTextFunctionItem3Model#TITLES}
         * or refactor method {@code getResources()} to implement your custom code logic.
         * @see List_H_HorizontalGraphicTextFunctionItem3Model#getResources()
         */
        Text(this.title)
          .margin({ bottom: '3vp' })
          .fontColor($r('app.color.font_primary'))
          .fontSize($r('app.integer.subtitle_text_S'))
          .fontWeight(FontWeight.Medium)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .maxLines(1)
        /**
         * TODO:
         * please modify it according to the actual situation.
         * directly modify {@link List_H_HorizontalGraphicTextFunctionItem3Model#DESCRIPTIONS}
         * or refactor method {@code getResources()} to implement your custom code logic.
         * @see List_H_HorizontalGraphicTextFunctionItem3Model#getResources()
         */
        Text(this.description)
          .fontColor($r('app.color.font_secondary'))
          .fontSize($r('app.integer.caption_text_M'))
          .fontWeight(FontWeight.Regular)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .maxLines(1)
      }
      .width('70%')
      .layoutWeight(1)
      .alignItems(HorizontalAlign.Start)
    }
    .justifyContent(FlexAlign.Start)
    .borderRadius($r('sys.float.corner_radius_level8'))
    .width(CommonConstants.FULL_PERCENT)
    .height(CommonConstants.FULL_PERCENT)
    .padding({ left: 2, right: 2 })
  }
}