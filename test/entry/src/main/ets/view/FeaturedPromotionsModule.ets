/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {
  DataSource,
  DataSourceStyleAStyleA
} from '../viewmodel/FeaturedPromotionsModuleData';
import { LoadingStatus } from '../common/CommonEnums';
import LazyDataSource from '../util/LazyDataSource';
import { LoadingFailedView } from './LoadingFailedView';

import { CommonConstants } from '../common/CommonConstants';
import { BreakpointConstants } from '../common/BreakpointConstants';
import { ModuleTitleComponent } from '../common/ModuleTitleComponent';

@Component
export struct FeaturedPromotionsModule {
  @State itemModel: DataSource =
    DataSource.getInstance();
  @State moduleTitle: string = "健康管理精选活动";
  @State moduleRedirectContent: string = "查看更多活动";
  @State loadingStatus: LoadingStatus = LoadingStatus.OFF;
  @State lazyDataSource: LazyDataSource<DataSourceStyleAStyleA> =
    this.itemModel.lazyDataSource;
  @Consume('appPathStack') appPathStack: NavPathStack;

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
        Row() {
          Column() {
            VerticalGraphicTextItem({
              image: this.lazyDataSource.getData(0).getImage(),
              content: this.lazyDataSource.getData(0).getContent(),
              title: this.lazyDataSource.getData(0).getTitle(),
              index: this.lazyDataSource.getData(0).getIndex()
            }).onClick(() => {
              this.appPathStack.pushPathByName('DetailedPagePathStack', null)
            })
          }
          .justifyContent(FlexAlign.SpaceBetween)
          .width('50%')
          .height(CommonConstants.FULL_PERCENT)
          .padding({ right: 4 })

          Column() {
            VerticalGraphicTextItem({
              image: this.lazyDataSource.getData(1).getImage(),
              content: this.lazyDataSource.getData(1).getContent(),
              title: this.lazyDataSource.getData(1).getTitle(),
              index: this.lazyDataSource.getData(1).getIndex()
            }).onClick(() => {
              this.appPathStack.pushPathByName('DetailedPagePathStack', null)
            })
              .height('50%')
              .padding({ bottom: 4 })

            VerticalGraphicTextItem({
              image: this.lazyDataSource.getData(2).getImage(),
              content: this.lazyDataSource.getData(2).getContent(),
              title: this.lazyDataSource.getData(2).getTitle(),
              index: this.lazyDataSource.getData(2).getIndex()
            }).onClick(() => {
              this.appPathStack.pushPathByName('DetailedPagePathStack', null)
            })
              .height('50%')
              .padding({ top: 4 })
          }
          .justifyContent(FlexAlign.SpaceBetween)
          .width('50%')
          .padding({ left: 4 })
        }
        .height(250)
      }
    }
    .width('92%')
    .borderRadius($r('sys.float.corner_radius_level8'))
    .margin({ bottom: "10vp" })
    .height(300)
  }
}

@Component
export struct VerticalGraphicTextItem {
  @State image: Resource = $r('app.media.noImage')
  @State title: string = '模块名';
  @State content: string = '跳转';
  @State index:number = 0

  build() {
    Column() {
      /**
       * TODO:
       * please modify it according to the actual situation.
       * directly modify {@link WaterFlow_VerticalGraphicTextItemModel#IMAGES}
       * or refactor method {@code getResources()} to implement your custom code logic.
       * @see WaterFlow_VerticalGraphicTextItemModel#getResources()
       */
      Image(this.image)
        .borderRadius($r('sys.float.corner_radius_level8'))
        .width(CommonConstants.FULL_PERCENT)
        .height(this.index === 0 ? "86%" : "70%")
      Column(){
        /**
         * TODO:
         * please modify it according to the actual situation.
         * directly modify {@link WaterFlow_VerticalGraphicTextItemModel#TITLES}
         * or refactor method {@code getResources()} to implement your custom code logic.
         * @see WaterFlow_VerticalGraphicTextItemModel#getResources()
         */
        Text(this.title)
          .fontSize($r('app.integer.subtitle_text_M'))
          .fontWeight(FontWeight.Medium)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .maxLines(1)
          .width(CommonConstants.FULL_PERCENT)
          .fontColor($r('app.color.font_primary'))
          .padding({top:4})
        /**
         * TODO:
         * please modify it according to the actual situation.
         * directly modify {@link WaterFlow_VerticalGraphicTextItemModel#CONTENTS}
         * or refactor method {@code getResources()} to implement your custom code logic.
         * @see WaterFlow_VerticalGraphicTextItemModel#getResources()
         */
        Text(this.content)
          .fontSize($r('app.integer.body_text_S'))
          .opacity(0.4)
          .fontWeight(FontWeight.Regular)
          .maxLines(1)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .width(CommonConstants.FULL_PERCENT)
          .fontColor($r('app.color.font_secondary'))
      }
      .width(CommonConstants.FULL_PERCENT)
    }
    .width(CommonConstants.FULL_PERCENT)
    .height(CommonConstants.FULL_PERCENT)
    .alignItems(HorizontalAlign.Start)
    .justifyContent(FlexAlign.SpaceBetween)
  }
}