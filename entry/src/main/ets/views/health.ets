import { AppMainColor } from "../constant/colors"
import { AppRouterMap } from "../constant/router"
@Component
export struct HealthView {
  pathStack: NavPathStack | undefined
  build() {
    Column({
      space: 8
    }) {
      Swiper() {
        Image("https://img1.baidu.com/it/u=901265573,962156695&fm=253&fmt=auto&app=138&f=PNG?w=1266&h=500")
          .width('100%')
        Image("https://img1.baidu.com/it/u=901265573,962156695&fm=253&fmt=auto&app=138&f=PNG?w=1266&h=500")
          .width('100%')
        Image("https://img1.baidu.com/it/u=901265573,962156695&fm=253&fmt=auto&app=138&f=PNG?w=1266&h=500")
          .width('100%')
      }
      .autoPlay(true)

      Marquee({
        start: true,
        src: '健康是生命的基石，养生是长寿的秘诀。让我们携手，共筑健康长城。'
      })
        .width('100%')
        .backgroundColor(AppMainColor.PRIMARY_COLOR)
        .fontColor("#fff")

      Column({
        space: 12
      }) {

        // 商品分类
        Row() {
          Text("健康服务")
            .fontSize(20)
          // .fontWeight(FontWeight.Bold)
          // Text("查看更多>>")
          //   .fontColor("#999")
        }
        .justifyContent(FlexAlign.SpaceBetween)
        .width('100%')

        List({
          space: 4
        }) {
          ForEach([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], (item: number) => {
            ListItem() {
              Column({
                space: 12
              }) {
                Image($rawfile("images/yisheng.png"))
                  .width("50%")
                Text("常用药")
                // Divider()
                //   .height("2px")
                //   .width("100%")
                //   .color(AppMainColor.GRAY_COLOR)
              }
              .alignItems(HorizontalAlign.Center)
              .justifyContent(FlexAlign.SpaceAround)
            }
          }, (item: number) => item + "")
        }
        .alignListItem(ListItemAlign.Center).lanes(4)
      }
      .backgroundColor("#fff")
      .padding(12)
      .borderRadius(4)

      Column({
        space: 12
      }) {
        // 热卖商品
        Row() {
          Text("热销品类")
            .fontSize(20)
          // .fontWeight(FontWeight.Bold)
          Text("查看更多>>")
            .fontColor("#999")
        }
        .justifyContent(FlexAlign.SpaceBetween)
        .width('100%')

        List() {
          ListItem() {
            Row() {
              Image($rawfile("images/yaopin.png"))
                .height(60)
              Column({
                space: 2
              }) {
                Text("小儿清热口服液(瓶装)")
                Text("哈药六厂出品")
                Row({
                  space: 8
                }){
                  Text("感冒")
                    .backgroundColor(AppMainColor.GRAY_COLOR)
                    .padding(2)
                    .fontColor("#fff")
                  Text("发烧")
                    .backgroundColor(AppMainColor.GRAY_COLOR)
                    .padding(2)
                    .fontColor("#fff")
                  Text("清热")
                    .backgroundColor(AppMainColor.GRAY_COLOR)
                    .padding(2)
                    .fontColor("#fff")
                }
                Text("￥36.65")
                  .fontColor(AppMainColor.RED_COLOR)
                  .fontSize(AppMainColor.LG)
              }
              .alignItems(HorizontalAlign.Start)
              .padding(8)
              .layoutWeight(1)
            }
          }.onClick(()=>{
            this.pathStack!.pushPath({
              name: AppRouterMap.GOODS_DETAIL,
              // param: ''
            })
          })

        }
      }
      .backgroundColor("#fff")
      .padding(12)
      .borderRadius(4)

    }
    .height('100%')
    .width('100%')
  }
}