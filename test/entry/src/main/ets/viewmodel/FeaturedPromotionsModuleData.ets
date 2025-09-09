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

export class DataSource {
  private static instance: DataSource;
  lazyDataSource: LazyDataSource<DataSourceStyleAStyleA> = new LazyDataSource();
  static readonly IMAGES: Resource[] = [$r(('app.media.realImageGen_food_5')),$r(('app.media.realImageGen_food_0')),$r(('app.media.realImageGen_food_10'))];
  static readonly TITLES: string[] = ['健康饮食', '运动健身', '心理调节'];
  static readonly CONTENTS: string[] = ['均衡营养，健康每一天', '每日运动，活力无限', '放松心情，快乐生活'];
  static readonly INDEX: number[] = [0, 1, 2, 3, 4, 5]

  constructor() {

  }

  public static getInstance(): DataSource {
    if (!DataSource.instance) {
      DataSource.instance =
        new DataSource();
    }
    return DataSource.instance;
  }

  /**
   * Data loaded on current view converts network data into rendering data
   */
  getResources(): Promise<void> {

    /**
     * use your web request here
     */
    return new Promise((resolve: Function) => {
      const modelList: Array<DataSourceStyleAStyleA> = [];
      for (let index = 0; index < 3;
        index++) {
        if (index < DataSource.IMAGES.length) {
          modelList.push(new DataSourceStyleAStyleA(
            DataSource.IMAGES[index],
            DataSource.TITLES[index],
            DataSource.CONTENTS[index],
            DataSource.INDEX[index]
          ));
        } else {
          modelList.push(new DataSourceStyleAStyleA(
            $r('app.media.backgroundImg2'),
            '标题',
            '副标题',
            index
          ));
        }
      }
      this.lazyDataSource.pushArrayData(modelList);
      resolve();
    });
  }
}


export class DataSourceStyleAStyleA {
  private image: Resource;
  private title: string;
  private content: string;
  private index: number;

  constructor(image: Resource, title: string, content: string, index: number) {
    this.image = image;
    this.title = title;
    this.content = content;
    this.index = index;
  }

  getTitle(): string {
    return this.title;
  }

  getContent(): string {
    return this.content;
  }

  getImage(): Resource {
    return this.image
  }

  getIndex(): number {
    return this.index;
  }
}