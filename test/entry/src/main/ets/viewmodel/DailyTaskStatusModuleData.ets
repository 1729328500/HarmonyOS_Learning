import LazyDataSource from '../util/LazyDataSource';

export class Data {
  private static instance: Data;
  lazyDataSource: LazyDataSource<DataSource> = new LazyDataSource();
  static readonly ICONS: Resource[] =
    [$r('app.media.startIcon'), $r('app.media.startIcon'), $r('app.media.startIcon'),
      $r('app.media.startIcon'),
      $r('app.media.startIcon'), $r('app.media.startIcon')];
  static readonly TITLES: string[] =
    ['每周累计登录2天', '体验一次AI生成PPT', '扫描文档10次', '每周累计登录2天', '每周累计登录2天', '每周累计登录2天'];
  static readonly DESCRIPTIONS: string[] =
    ['+1天vip', '+2次抽奖', '+1天vip', '+1天vip', '+1天vip', '+1天vip'];

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
      for (let index = 0; index < Data.ICONS.length;
        index++) {
        modelList.push(new DataSource(
          Data.ICONS[index],
          Data.TITLES[index],
          Data.DESCRIPTIONS[index]));
      }
      this.lazyDataSource.pushArrayData(modelList);
      resolve();
    });
  }
}

export class DataSource {
  private icon: Resource;
  private title: string;
  private description: string;

  constructor(icon: Resource, title: string, description: string) {
    this.icon = icon;
    this.title = title;
    this.description = description;
  }

  getIcon(): Resource {
    return this.icon;
  }

  getTitle(): string {
    return this.title;
  }

  getDescription(): string {
    return this.description;
  }
}