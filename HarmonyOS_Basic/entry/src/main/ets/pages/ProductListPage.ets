import { ProductInfo } from '../model/ProductInfo'

/**
 * ProductListPage.ets
 * 简要描述：商品列表页面
 * 作者：moqi
 * 日期：2025/9/9
 */
@Entry
@Component
export  struct ProductListPage {
  @State productList: ProductInfo[] = [
    {
      id: 1,
      name: 'iPhone 15 Pro',
      price: 7999,
      originalPrice: 8999,
      image: $r('app.media.2'),
      description: '全新钛金属设计，A17 Pro芯片',
      category: '手机',
      stock: 50,
      isOnSale: true,
      rating: 4.8,
      salesCount: 1200
    },
    {
      id: 2,
      name: 'MacBook Air M2',
      price: 8999,
      image: $r('app.media.3'),
      description: 'M2芯片，13英寸液晶视网膜显示屏',
      category: '笔记本',
      stock: 30,
      isOnSale: false,
      rating: 4.9,
      salesCount: 800
    },
    {
      id: 3,
      name: 'AirPods Pro',
      price: 1999,
      originalPrice: 2299,
      image: $r('app.media.4'),
      description: '主动降噪，空间音频',
      category: '耳机',
      stock: 100,
      isOnSale: true,
      rating: 4.7,
      salesCount: 2500
    }
  ]

  build() {
    Column() {
      // 标题栏
      Row() {
        Text('商品列表')
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .padding({ left: 20, top: 10, bottom: 10 })
      }
      .width('100%')
      .backgroundColor('#f8f8f8')

      // 商品列表
      List({ space: 10 }) {
        ForEach(this.productList, (product: ProductInfo) => {
          ListItem() {
            this.ProductCard(product)
          }
        }, (product: ProductInfo) => product.id.toString())
      }
      .padding({ left: 16, right: 16, top: 10 })
      .layoutWeight(1)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#ffffff')
  }

  @Builder
  ProductCard(product: ProductInfo) {
    Row({ space: 12 }) {
      // 商品图片
      Image(product.image)
        .width(80)
        .height(80)
        .borderRadius(8)
        .backgroundColor('#f0f0f0')

      // 商品信息
      Column({ space: 6 }) {
        // 商品名称
        Text(product.name)
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          .maxLines(2)
          .textOverflow({ overflow: TextOverflow.Ellipsis })

        // 商品描述
        if (product.description) {
          Text(product.description)
            .fontSize(12)
            .fontColor('#666666')
            .maxLines(1)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
        }

        // 价格和评分
        Row() {
          Column({ space: 2 }) {
            Row({ space: 8 }) {
              Text(`¥${product.price}`)
                .fontSize(18)
                .fontColor('#ff4444')
                .fontWeight(FontWeight.Bold)

              if (product.originalPrice && product.isOnSale) {
                Text(`¥${product.originalPrice}`)
                  .fontSize(14)
                  .fontColor('#999999')
                  .decoration({ type: TextDecorationType.LineThrough })
              }

              if (product.isOnSale) {
                Text('促销')
                  .fontSize(10)
                  .fontColor('#ffffff')
                  .backgroundColor('#ff4444')
                  .padding({
                    left: 4,
                    right: 4,
                    top: 2,
                    bottom: 2
                  })
                  .borderRadius(2)
              }
            }

            Row({ space: 4 }) {
              if (product.rating) {
                Text(`评分: ${product.rating}`)
                  .fontSize(12)
                  .fontColor('#666666')
              }
              if (product.salesCount) {
                Text(`销量: ${product.salesCount}`)
                  .fontSize(12)
                  .fontColor('#666666')
              }
            }
          }
          .alignItems(HorizontalAlign.Start)

          Blank()

          Text(`库存: ${product.stock}`)
            .fontSize(12)
            .fontColor(product.stock > 0 ? '#00aa00' : '#ff4444')
        }
        .width('100%')
      }
      .alignItems(HorizontalAlign.Start)
      .layoutWeight(1)
    }
    .width('100%')
    .padding(12)
    .backgroundColor('#ffffff')
    .borderRadius(8)
    .shadow({ radius: 2, color: 'rgba(0,0,0,0.1)' })
    .onClick(() => {
      console.log('点击了商品:', product.name)
    })
  }
}