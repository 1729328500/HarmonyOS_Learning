export class AccountData {
  phoneNumber: string;
  text: string;
  subtitle: string;
  medalList: Resource[];

  constructor(phoneNumber: string, text: string, subtitle: string, medalList: Resource[]) {
    this.phoneNumber = phoneNumber;
    this.text = text;
    this.subtitle = subtitle;
    this.medalList = medalList;
  }
}

export class ContainerStyle {
  width: string = '100%';
  height: number = 56;
  backgroundColor: string = "#ffffffff";
  paddingLeft: number = 16;
  paddingRight: number = 16;
  paddingTop: number = 8;
  paddingBottom: number = 8;
}

export class AvatarStyle {
  width: number = 40;
  height: number = 40;
  borderRadius: number = 12;
  marginRight: number = 8;
}

export class TextStyle {
  phoneSize: number = 20;
  phoneColor: string = '#333333';
  medalSize: number = 14;
  medalColor: string = '#999999';
}

export class MedalIconStyle {
  width: number = 15;
  height: number = 15;
  borderRadius: number = 10;
  marginLeft: number = 1;
}

export class SignButtonStyle {
  fontSize: number = 14;
  height: number = 24;
  borderRadius: number = 12;
  paddingLeft: number = 12;
  paddingRight: number = 12;
  marginLeft: number = 12;
  signedTextColor: string = '#999999';
  signedBgColor: string = '#F5F5F5';
  unsignedTextColor: string = "#ffffffff";
  unsignedBgColor: string = "#ff0a59f7";
}

export class AccountStyle {
  container: ContainerStyle = new ContainerStyle();
  avatar: AvatarStyle = new AvatarStyle();
  text: TextStyle = new TextStyle();
  medalIcon: MedalIconStyle = new MedalIconStyle();
  signButton: SignButtonStyle = new SignButtonStyle();
}

export class Data {
  private _data: AccountData;
  private _styles: AccountStyle;
  static readonly USERNAME: string = "用户";
  static readonly TEXT: string = "签到";
  static readonly SUBTITLE: string = "日历";
  static readonly IMAGES: Resource[] =
    [$r(('app.media.realImageGen_travel_11')), $r(('app.media.realImageGen_travel_5')), $r(('app.media.realImageGen_travel_5')), $r(('app.media.realImageGen_travel_0')),
      $r(('app.media.realImageGen_travel_0'))];

  constructor() {
    this._data = new AccountData(Data.USERNAME, Data.TEXT, Data.SUBTITLE,
      Data.IMAGES);
    this._styles = new AccountStyle();
  }

  get data(): AccountData {
    return this._data;
  }

  get styles(): AccountStyle {
    return this._styles;
  }
}