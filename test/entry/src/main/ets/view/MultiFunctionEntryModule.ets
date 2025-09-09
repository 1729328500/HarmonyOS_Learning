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
} from '../viewmodel/MultiFunctionEntryModuleData';
import { LoadingStatus } from '../common/CommonEnums';
import { LoadingFailedView } from './LoadingFailedView';
import { BreakpointConstants } from '../common/BreakpointConstants';

import { BreakpointType } from '../util/BreakpointType';
import LazyDataSource from '../util/LazyDataSource';
import { CommonConstants } from '../common/CommonConstants';
import { ModuleTitleComponent } from '../common/ModuleTitleComponent'

@Component
export struct MultiFunctionEntryModule {
  @State itemModel: Data =
    Data.getInstance();
  @State lazyDataSource: LazyDataSource<DataSource> =
    this.itemModel.lazyDataSource;
  @State moduleTitle: string = "健康管理入口";
  @State moduleRedirectContent: string = "查看更多";
  @State rowHeight: number = 80;
  @State rowGap: number = 6;
  private columnGapArray: number[] = [6, 10, 12];
  private columnNumberArray: number[] = [4, 6, 6];
  private rowNumberArray: number[] = [1, 1, 1];
  @State loadingStatus: LoadingStatus = LoadingStatus.OFF;
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
      ModuleTitleComponent({ title: this.moduleTitle, moduleRedirectContent: this.moduleRedirectContent }).width('92%')
      if (this.loadingStatus === LoadingStatus.FAILED) {
        LoadingFailedView(() => this.loadResources())
      }
      if (this.loadingStatus === LoadingStatus.SUCCESS) {
        Column() {
          Grid() {
            LazyForEach(this.lazyDataSource,
              (item: DataSource) => {
                GridItem() {
                  VerticalGraphicTextFunctionItem({
                    title: item.getTitle(),
                    description: item.getDescription(),
                    icon: item.getIcon()
                  })
                }
                .onClick(() => {
                  this.jump()
                })
                .borderRadius($r('sys.float.corner_radius_level6'))

              },
              (item: DataSource, index: number) => index + JSON.stringify(item)) //ITEM_MODEL
          }
          .columnsTemplate(("1fr ").repeat(new BreakpointType(this.columnNumberArray[0], this.columnNumberArray[1],
            this.columnNumberArray[2]).getValue(this.currentWidthBreakpoint)).trim())
          .rowsTemplate(("1fr ").repeat(new BreakpointType(this.rowNumberArray[0], this.rowNumberArray[1],
            this.rowNumberArray[2]).getValue(this.currentWidthBreakpoint)).trim())
          .height(this.currentWidthBreakpoint !== BreakpointConstants.BREAKPOINT_LG ?
            (this.rowGap + this.rowHeight) * new BreakpointType(this.rowNumberArray[0], this.rowNumberArray[1],
              this.rowNumberArray[2]).getValue(this.currentWidthBreakpoint) :
            (this.rowGap + this.rowHeight + 30) * new BreakpointType(this.rowNumberArray[0], this.rowNumberArray[1],
              this.rowNumberArray[2]).getValue(this.currentWidthBreakpoint))
          .columnsGap(new BreakpointType(this.columnGapArray[0], this.columnGapArray[1],
            this.columnGapArray[2]).getValue(this.currentWidthBreakpoint))
          .rowsGap(this.rowGap)
          .margin({ top: '12vp', bottom: '12vp' })
        }
        .width('92%')
        .justifyContent(FlexAlign.Center)
        .backgroundColor($r('app.color.comp_background_primary'))
        .borderRadius($r('sys.float.corner_radius_level8'))
      }
    }
    .width('100%')
    .borderRadius($r('sys.float.corner_radius_level6'))
    .margin({ bottom: "10vp" })
  }
}

@Component
export struct VerticalGraphicTextFunctionItem {
  @State title: string = '模块名';
  @State description: string = '跳转';
  @State icon: Resource = $r("app.media.ic_public_app");

  constructor(title: string, description: string, icon: Resource) {
    super();
    this.title = title;
    this.description = description;
    this.icon = icon;
  }

  build() {
    Column() {
      Image(this.icon)
        .width("35")
        .autoResize(true)
        .fillColor($r('app.color.comp_background_emphasize'))
        .borderRadius($r('sys.float.corner_radius_level8'))

      Text(this.title)
        .fontColor($r('app.color.font_primary'))
        .maxFontSize($r('app.integer.subtitle_text_S'))
        .minFontSize($r('app.integer.body_text_S'))
        .fontWeight(FontWeight.Medium)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .maxLines(1)
        .width("90%")
        .textAlign(TextAlign.Center)
        .margin({ top: '4vp' })

      Text(this.description)
        .margin({ top: '2vp' })
        .fontColor($r('app.color.font_secondary'))
        .maxFontSize($r('app.integer.body_text_S'))
        .minFontSize($r('app.integer.caption_text_M'))
        .fontWeight(FontWeight.Regular)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .maxLines(1)
        .opacity(0.4)
        .width("90%")
        .textAlign(TextAlign.Center)
    }
    .padding({ "top": 4, "bottom": 4 })
    .justifyContent(FlexAlign.Center)
    .height(CommonConstants.FULL_PERCENT)
  }
}