export enum DataSourceStyleBStyleB {
  AUDIO = '声音',
  SPECIAL = '专辑'
}

export class DataSourceStyleAStyleA {
  private id: string;
  private title: string;
  private cover: Resource;
  private type: DataSourceStyleBStyleB;

  constructor(id: string, title: string, cover: Resource, type: DataSourceStyleBStyleB) {
    this.id = id;
    this.title = title;
    this.cover = cover;
    this.type = type;
  }

  getId(): string {
    return this.id;
  }

  getTitle(): string {
    return this.title;
  }



  getCover(): Resource {
    return this.cover;
  }

  getType(): DataSourceStyleBStyleB {
    return this.type;
  }
}

export class DataSource {
  private playlists: DataSourceStyleAStyleA[] = [];
  private title: string = '听单';

  static readonly PLAYLIST_IDS: string[] = ['health_001', 'health_002'];

  static readonly PLAYLIST_TITLES: string[] = ['健康生活小贴士', '日常运动指南'];


  static readonly PLAYLIST_COVERS: Resource[] = [
$r(('app.media.realImageGen_common_2')),
$r(('app.media.realImageGen_common_2'))];

  static readonly PLAYLIST_TYPES: DataSourceStyleBStyleB[] = [
    DataSourceStyleBStyleB.AUDIO,
    DataSourceStyleBStyleB.AUDIO,
    DataSourceStyleBStyleB.AUDIO,
    DataSourceStyleBStyleB.SPECIAL,
    DataSourceStyleBStyleB.AUDIO
  ];

  constructor() {
    this.initPlaylists();
  }

  private initPlaylists(): void {
    for (let i = 0; i < DataSource.PLAYLIST_IDS.length; i++) {
      this.playlists.push(new DataSourceStyleAStyleA(
        DataSource.PLAYLIST_IDS[i],
        DataSource.PLAYLIST_TITLES[i],
        DataSource.PLAYLIST_COVERS[i],
        DataSource.PLAYLIST_TYPES[i]
      ));
    }
  }

  getTitle(): string {
    return this.title;
  }

  getPlaylists(): DataSourceStyleAStyleA[] {
    return this.playlists;
  }
}