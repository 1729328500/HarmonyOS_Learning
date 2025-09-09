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
  Data,
  DataSource
} from '../viewmodel/RecommendationModuleData';

import { LoadingStatus } from '../common/CommonEnums';
import { LoadingFailedView } from './LoadingFailedView';

import { BreakpointConstants } from '../common/BreakpointConstants';
import { BreakpointType } from '../util/BreakpointType';
import LazyDataSource from '../util/LazyDataSource';
import { CommonConstants } from '../common/CommonConstants';
import { ModuleTitleComponent } from '../common/ModuleTitleComponent';

@Component
export struct RecommendationModule {
  @State itemModel: Data =
    Data.getInstance();
  @Prop listDirection: Axis = Axis.Horizontal
  @State moduleTitle: string = "健康管理推荐";
  @State moduleRedirectContent: string = "查看更多";
  @State loadingStatus: LoadingStatus = LoadingStatus.OFF;
  @State lazyDataSource: LazyDataSource<DataSource> =
    this.itemModel.lazyDataSource;
  private spaceArray: string[] = ['8vp', '16vp', '20vp'];
  @Consume('appPathStack') appPathStack: NavPathStack;
  @StorageLink('currentWidthBreakpoint') currentWidthBreakpoint: string = BreakpointConstants.BREAKPOINT_SM;

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
                VerticalGraphicTextItem({
                  image: item.getImage(),
                  content: item.getContent(),
                  title: item.getTitle()
                })
              }
              .width('43.4%')
              .onClick(() => {
                this.appPathStack.pushPathByName('DetailedPagePathStack', null)
              })
            }, (item: DataSource, index: number) => index + JSON.stringify(item))
          }
          .width('auto')
          .listDirection(this.listDirection)
          .scrollBar(BarState.Off)
        }
      }
      .width('92%')
    }
    .width('100%')
    .margin({ bottom: "10vp" })
  }
}

@Component
export struct VerticalGraphicTextItem {
  @State image: Resource = $r('app.media.noImage')
  @State title: string = '模块名';
  @State content: string = '跳转';

  build() {
    Column() {
      /**
       * TODO:
       * please modify it according to the actual situation.
       * directly modify {@link Data#IMAGES}
       * or refactor method {@code getResources()} to implement your custom code logic.
       * @see Data#getResources()
       */
      Image(this.image)
        .width(CommonConstants.FULL_PERCENT)
        .height("84vp")
      /**
       * TODO:
       * please modify it according to the actual situation.
       * directly modify {@link Data#TITLES}
       * or refactor method {@code getResources()} to implement your custom code logic.
       * @see Data#getResources()
       */
      Text(this.title)
        .fontSize($r('app.integer.subtitle_text_S'))
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .maxLines(1)
        .width(CommonConstants.FULL_PERCENT)
        .padding({top: 8, bottom: 4, left: 12, right: 12})
      /**
       * TODO:
       * please modify it according to the actual situation.
       * directly modify {@link Data#CONTENTS}
       * or refactor method {@code getResources()} to implement your custom code logic.
       * @see Data#getResources()
       */
      Text(this.content)
        .fontSize($r('app.integer.caption_text_M'))
        .fontColor($r('app.color.content_sub_title_font_color'))
        .opacity(0.6)
        .maxLines(1)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .width(CommonConstants.FULL_PERCENT)
        .padding({ bottom: 12, left: 12, right: 12})
    }
    .width(CommonConstants.FULL_PERCENT)
    .alignItems(HorizontalAlign.Start)
    .borderRadius($r('sys.float.corner_radius_level8'))
    .clip(true)
    .backgroundColor(Color.White)
  }
}
