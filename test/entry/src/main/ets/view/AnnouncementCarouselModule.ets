import { DataSource, DataSourceStyleAStyleA, DataSourceStyleBStyleB } from '../viewmodel/AnnouncementCarouselModuleData';
import { ModuleTitleComponent } from '../common/ModuleTitleComponent';

@Component
struct PlaylistTypeTag {
  @Prop type: DataSourceStyleBStyleB;

  build() {
    Text(this.type)
      .fontSize(12)
      .fontColor(Color.White)
      .backgroundColor(this.type === DataSourceStyleBStyleB.AUDIO ? '#FF5A5A' : '#FF9F00')
      .padding({ left: 8, right: 8, top: 4, bottom: 4 })
      .borderRadius({ topLeft: 12, topRight: 0, bottomLeft: 0, bottomRight: 12 })
  }
}

@Component
struct PlaylistCard {
  @Prop playlist: DataSourceStyleAStyleA;

  build() {
    Column() {
      Stack({ alignContent: Alignment.TopStart }) {
        Image(this.playlist.getCover())
          .width(240)
          .height(120)
          .borderRadius(16)
          .objectFit(ImageFit.Cover)

        PlaylistTypeTag({ type: this.playlist.getType() })

      }
      .width('100%')

      Text(this.playlist.getTitle())
        .fontSize(16)
        .fontWeight(FontWeight.Medium)
        .maxLines(2)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .width('100%')
        .margin({ top: 8 })
    }
    .width(240)
    .alignItems(HorizontalAlign.Start)

  }
}

@Component
export struct AnnouncementCarouselModule {
  @State model: DataSource = new DataSource();
  @Consume('appPathStack') appPathStack: NavPathStack;
  @State moduleTitle: string = "新闻专栏";
  @State moduleRedirectContent: string = "跳转";

  jump(): void {
    this.appPathStack.pushPathByName('EmptyPagePathStack', null);
  }


  build() {
    Column() {
      ModuleTitleComponent({ title: this.moduleTitle, moduleRedirectContent: this.moduleRedirectContent })
        .width('92%')

      Scroll() {
        Row() {
          ForEach(this.model.getPlaylists(), (playlist: DataSourceStyleAStyleA, index: number) => {
            PlaylistCard({ playlist: playlist })
              .margin({ right: 12 })
          }, (playlist: DataSourceStyleAStyleA) => playlist.getId())
        }
        .height('100%')
        .alignItems(VerticalAlign.Top)
      }
      .scrollable(ScrollDirection.Horizontal)
      .scrollBar(BarState.Off)
      .width('92%')
      .height(190)
      .onClick(() => {
        this.jump()
      })
    }
    .width('100%')
  }
}
