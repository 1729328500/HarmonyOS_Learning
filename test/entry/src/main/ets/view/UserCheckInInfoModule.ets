// AccountInfo.ets

import { Data } from '../viewmodel/UserCheckInInfoModuleData';

@Component
export struct UserCheckInInfoModule {
  @State private model: Data = new Data();
  @Consume('appPathStack') appPathStack: NavPathStack;

  jump(): void {
    this.appPathStack.pushPathByName('EmptyPagePathStack', null);
  }

  build() {
    Row() {
      Row() {
        Image($r('app.media.avatar'))
          .width(this.model.styles.avatar.width)
          .height(this.model.styles.avatar.height)
          .borderRadius(this.model.styles.avatar.borderRadius)
          .margin({ right: this.model.styles.avatar.marginRight })
          .onClick(() => this.appPathStack.pushPathByName('SimplifiedPersonPagePathStack', null))

        Column() {
          Row() {
            Text(this.model.data.phoneNumber)
              .fontSize(this.model.styles.text.phoneSize)
              .fontColor(this.model.styles.text.phoneColor)
              .fontWeight(FontWeight.Medium)
              .textAlign(TextAlign.Start)
          }
          .width('100%')
          .margin({bottom:"4px"})

          Row() {
            Row() {
              Text(this.model.data.subtitle)
                .fontSize(this.model.styles.text.medalSize)
                .fontColor(this.model.styles.text.medalColor)
            }
            Row() {
              ForEach(this.model.data.medalList, (item: Resource) => {
                Image(item)
                  .width(this.model.styles.medalIcon.width)
                  .height(this.model.styles.medalIcon.height)
                  .borderRadius(this.model.styles.medalIcon.borderRadius)
                  .margin({ left: this.model.styles.medalIcon.marginLeft })
                  .onClick(() => this.jump())
              })
            }
            .margin({ left: 8 })
          }
          .width('100%')
          .alignItems(VerticalAlign.Center)
        }
        .layoutWeight(1)

        Button(this.model.data.text)
          .fontSize(this.model.styles.signButton.fontSize)
          .fontColor(this.model.styles.signButton.unsignedTextColor)
          .backgroundColor(this.model.styles.signButton.unsignedBgColor)
          .borderRadius(this.model.styles.signButton.borderRadius)
          .height(this.model.styles.signButton.height)
          .padding({
            left: this.model.styles.signButton.paddingLeft,
            right: this.model.styles.signButton.paddingRight
          })
          .margin({ left: this.model.styles.signButton.marginLeft })
          .onClick(() => {
            this.jump()
          })
      }
    }
    .width(this.model.styles.container.width)
    .backgroundColor(this.model.styles.container.backgroundColor)
    .padding({
      left: this.model.styles.container.paddingLeft,
      right: this.model.styles.container.paddingRight,
      top: this.model.styles.container.paddingTop,
      bottom: this.model.styles.container.paddingBottom
    })
    .height(this.model.styles.container.height)
    .alignItems(VerticalAlign.Center)
    .justifyContent(FlexAlign.SpaceBetween)
  }
}