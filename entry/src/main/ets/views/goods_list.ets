import { LinkToCart } from "../components"
import { AppMainColor } from "../constant/colors"
import { AppRouterMap } from "../constant/router"

@Component
export struct GoodsListView {
  pathStack: NavPathStack | undefined

  build() {
    NavDestination() {
      Column() {
        LinkToCart({
          pathStack: this.pathStack
        })
        //
        Search({
          placeholder: '请输入关键词'
        })
          .borderRadius(4)
        Scroll() {
          Row({
            space: 16
          }) {
            Text("常用药")
              .fontColor("#fff")
            Text("降压药")
              .fontColor("#fff")
            Text("发热")
              .fontColor("#fff")
            Text("消炎药")
              .fontColor("#fff")
            Text("高血压")
              .fontColor("#fff")
            Text("养生")
              .fontColor("#fff")
            Text("食疗")
              .fontColor("#fff")
          }
          .backgroundColor(AppMainColor.PRIMARY_COLOR)
          .padding(12)
        }
        .scrollable(ScrollDirection.Horizontal)
        .width('100%')
        .scrollBar(BarState.Off)

        List({
          space: 4
        }) {
          ForEach([1, 2, 3, 4, 5, 6, 7], (item: number) => {
            ListItem() {
              Row() {
                Image($rawfile("images/yaopin.png"))
                  .height(60)
                  .width(140)
                  .objectFit(ImageFit.Contain)
                  .onClick(() => {
                    this.pathStack?.pushPath({
                      name: AppRouterMap.GOODS_DETAIL
                    })
                  })
                Column({
                  space: 2
                }) {
                  Text("小儿清热口服液(瓶装)")
                  Text("哈药六厂出品")
                  Row({
                    space: 4
                  }) {
                    Text("感冒")
                      .backgroundColor(AppMainColor.GRAY_COLOR)
                      .padding(4)
                      .fontColor("#fff")
                      .fontSize(AppMainColor.SM)
                    Text("发烧")
                      .backgroundColor(AppMainColor.GRAY_COLOR)
                      .padding(4)
                      .fontColor("#fff")
                      .fontSize(AppMainColor.SM)
                    Text("清热")
                      .backgroundColor(AppMainColor.GRAY_COLOR)
                      .padding(4)
                      .fontColor("#fff")
                      .fontSize(AppMainColor.SM)
                  }

                  Text("￥36.65")
                    .fontColor(AppMainColor.RED_COLOR)
                    .fontSize(AppMainColor.LG)
                }
                .alignItems(HorizontalAlign.Start)
                .padding(8)
                .layoutWeight(1)
              }
            }
            .padding(4)
            .shadow({
              offsetX: 1,
              offsetY: 1,
              color: '#ffeeebeb',
              radius: 1
            })
          }, (item: number) => item + "")
        }
        .layoutWeight(1)
        .scrollBar(BarState.Off)
        .lanes(1)
        .alignListItem(ListItemAlign.Center)
      }
      .padding(4)
    }
    .onReady((context) => {
      this.pathStack = context.pathStack
    })
    .title("商品列表")

  }
}