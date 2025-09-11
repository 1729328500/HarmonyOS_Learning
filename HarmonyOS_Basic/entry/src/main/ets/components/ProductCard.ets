
import { ProductInfo } from '../model/ProductInfo'

@Component
struct ProductCard {
  @Prop product: ProductInfo
  @Prop showDiscount: boolean = false
  @Prop @Watch('onPriceChange') price: number = 0

  onPriceChange() {
    console.log('价格发生变化:', this.price)
  }

  build() {
    Column() {
      Text(this.product.name)
        .fontSize(16)
        .fontWeight(FontWeight.Bold)

      Row() {
        Text(`¥${this.price}`)
          .fontSize(18)
          .fontColor('#FF3B30')

        if (this.showDiscount) {
          Text('限时优惠')
            .fontSize(12)
            .backgroundColor('#FF6B35')
            .fontColor(Color.White)
            .padding(20)
            .borderRadius(4)
        }
      }
    }
  }
}