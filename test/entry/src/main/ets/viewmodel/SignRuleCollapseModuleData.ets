import LazyDataSource from '../util/LazyDataSource';

export class Data {
  private static instance: Data;
  lazyDataSource: LazyDataSource<HorizontalTextButtonFunctionItemModel> = new LazyDataSource();
  static readonly TITLES: string[] = ['健康管理'];

  static readonly SUB_TITLES: string[] = ['签到规则说明'];

  static readonly BUTTON_VALUES: string[] = ['展开查看', '收起规则'];

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
      const modelList: Array<HorizontalTextButtonFunctionItemModel> = [];
      for (let index = 0; index < Data.TITLES.length;
        index++) {
        modelList.push(new HorizontalTextButtonFunctionItemModel(
          Data.TITLES[index],
          Data.SUB_TITLES[index],
          Data.BUTTON_VALUES[index]
        ))
      }
      this.lazyDataSource.pushArrayData(modelList);
      resolve();
    });
  }
}

export class HorizontalTextButtonFunctionItemModel {
  private title:string;
  private subTitle:string;
  private buttonValue:string;

  constructor(title:string,subTitle:string,buttonValue:string) {
    this.title = title;
    this.subTitle = subTitle;
    this.buttonValue = buttonValue;
  }

  getTitle(): string {
    return this.title;
  }

  getSubTitle(): string {
    return this.subTitle;
  }

  getButtonValue(): string {
    return this.buttonValue;
  }
}