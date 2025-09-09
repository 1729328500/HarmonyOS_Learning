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
import LazyDataSource from '../util/LazyDataSource';

export class Data {
  private static instance: Data;
  lazyDataSource: LazyDataSource<DataSource> = new LazyDataSource();
    static readonly IMAGES: Resource[] = [$r(('app.media.realImageGen_common_2')),$r(('app.media.realImageGen_common_2')),$r(('app.media.realImageGen_common_0')),$r(('app.media.realImageGen_common_0')),$r(('app.media.realImageGen_common_1')),$r(('app.media.realImageGen_common_1')),$r(('app.media.realImageGen_common_0')),$r(('app.media.realImageGen_common_3')),$r(('app.media.realImageGen_common_3')),$r(('app.media.realImageGen_common_2'))];
  static readonly MAIN_TEXT: string[] = ['积分排行榜'];
  static readonly SUB_TEXT: string[] = ['第1名', '第2名', '第3名', '第4名', '第5名', '第6名', '第7名', '第8名', '第9名', '第10名'];
  static readonly DESCRIPTION_TEXT: string[] = ['1000积分', '900积分', '800积分', '700积分', '600积分', '500积分', '400积分', '300积分', '200积分', '100积分'];

  constructor() {
  }

  public static getInstance(): Data {
    if (!Data.instance) {
      Data.instance =
        new Data();
    }
    return Data.instance;
  }

  /**
   * Data loaded on current view converts network data into rendering data
   */
  getResources(): Promise<void> {

    /**
     * use your web request here
     */
    return new Promise((resolve: Function) => {
      const modelList: Array<DataSource> = [];
      for (let index = 0; index < Data.IMAGES.length;
        index++) {
        modelList.push(new DataSource(
                    Data.IMAGES[index],
          Data.MAIN_TEXT[index],
          Data.SUB_TEXT[index],
          Data.DESCRIPTION_TEXT[index]));
      }
      this.lazyDataSource.pushArrayData(modelList);
      resolve();
    });
  }
}

export class DataSource {
  private image: Resource;
  private mainText: string;
  private subText: string;
  private descriptionText: string;

  constructor(image: Resource, mainText: string, subText: string, descriptionText: string) {
    this.image = image;
    this.mainText = mainText;
    this.subText = subText;
    this.descriptionText = descriptionText;
  }

  getImage(): Resource {
    return this.image;
  }

  getMainText(): string {
    return this.mainText;
  }

  getSubText(): string {
    return this.subText;
  }

  getDescriptionText(): string {
    return this.descriptionText;
  }
}