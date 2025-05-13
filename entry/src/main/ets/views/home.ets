import { AppRouterMap } from "../constant/router"

@Component
export struct HomeView {
  pathStack: NavPathStack | undefined
  build() {
    Scroll() {
      Column({
        space: 8
      }) {
        // 搜索框
        Row({
          space: 12
        }) {
          Search({
            placeholder: '请输入搜索关键词'
          })
            .layoutWeight(1)
          Image($rawfile("chat.png"))
            .width(40)
        }
        .width('90%')

        // 两个快捷导航
        Row() {
          Column({
            space: 12
          }) {
            Text("不限次")
              .width(20)
              .position({
                top: 0,
                right: 0
              })
              .fontSize(8)
              .padding(4)
              .width(32)
              .textAlign(TextAlign.Center)
              .backgroundColor("#0D92F4")
              .fontColor("#fff")
              .borderRadius({
                topLeft: 10,
                bottomLeft: 10
              })
            Text("快速问诊")
              .fontSize(20)
            Text("7*24小时智能匹配医生")
              .fontSize(14)
              .fontColor('#999')
            Image($rawfile("images/lx.png"))
              .width(50)
              .alignSelf(ItemAlign.End)
              .margin({
                right: 20
              })
          }
          .width('45%')
          .height(150)
          .backgroundColor("#fff")
          .justifyContent(FlexAlign.SpaceAround)

          Column({
            space: 12
          }) {
            Text("专业")
              .width(20)
              .position({
                top: 0,
                right: 0
              })
              .textAlign(TextAlign.Center)
              .fontSize(8)
              .padding(4)
              .width(32)
              .backgroundColor("#0D92F4")
              .fontColor("#fff")
              .borderRadius({
                topLeft: 10,
                bottomLeft: 10
              })
            Text("找医生")
              .fontSize(20)
            Text("全国百万医生任你选")
              .fontSize(14)
              .fontColor('#999')
            Image($rawfile("images/ys.png"))
              .width(50)
              .alignSelf(ItemAlign.End)
              .margin({
                right: 20
              })
          }
          .onClick(()=>{
            this.pathStack!.pushPath({
              name: AppRouterMap.DOCTORS,
              // param: ''
            })
          })
          .width('45%')
          .height(150)
          .backgroundColor("#fff")
          .justifyContent(FlexAlign.SpaceAround)
        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceAround)

        Image($rawfile("images/home-ad.png"))
          .width('100%')
          .borderRadius(4)

        // 快捷导航
        List() {
          ListItem() {
            Column({
              space: 12
            }) {
              Image($rawfile("images/yisheng.png"))
                .width("50%")
              Text("找医院")
            }
            .onClick(()=>{
              this.pathStack!.pushPath({
                name: AppRouterMap.FIND_HOSPITALS,
                // param: ''
              })
            })
          }

          ListItem() {
            Column({
              space: 12
            }) {
              Image($rawfile("images/yisheng.png"))
                .width("50%")
              Text("找医生")
            }.onClick(()=>{
              this.pathStack!.pushPath({
                name: AppRouterMap.DOCTORS,
                // param: ''
              })
            })
          }

          ListItem() {
            Column({
              space: 12
            }) {
              Image($rawfile("images/yaopin.png"))
                .width("50%")
              Text("找药品")
            }.onClick(()=>{
              this.pathStack!.pushPath({
                name: AppRouterMap.GOODS_LIST,
                // param: ''
              })
            })
          }

          ListItem() {
            Column({
              space: 12
            }) {
              Image($rawfile("images/jibing.png"))
                .width("50%")
              Text("查疾病")
            }.onClick(()=>{
              this.pathStack!.pushPath({
                name: AppRouterMap.ARTICLE_LIST,
                // param: ''
              })
            })
          }

        }
        .alignListItem(ListItemAlign.Center)
        .lanes(4)
        .width('100%')
        .backgroundColor("#fff")
        .padding(8)
        .borderRadius(4)

        // 精选医生
        Column({
          space: 12
        }) {
          Row() {
            Text("精选医生")
              .fontSize(20)
            // .fontWeight(FontWeight.Bold)
            Text("查看更多>>")
              .fontColor("#999")
          }
          .justifyContent(FlexAlign.SpaceBetween)
          .width('100%')

          // 医生信息
          List() {
            ListItem() {
              Row() {
                Image($rawfile("images/yisheng.png"))
                  .width(60)
                  .height(60)
                  .borderRadius('50%')
                Column({
                  space: 4
                }) {
                  Text("李书一")
                  Text("主治医生")
                  Text("北京协和医院")
                }
                .layoutWeight(1)
                .alignItems(HorizontalAlign.Start)
              }
              .justifyContent(FlexAlign.Center)
              .padding(8)
            }

            ListItem() {
              Row() {
                Image($rawfile("images/yisheng.png"))
                  .width(60)
                  .height(60)
                  .borderRadius('50%')
                Column({
                  space: 4
                }) {
                  Text("李书一")
                  Text("主治医生")
                  Text("北京协和医院")
                }
                .layoutWeight(1)
                .alignItems(HorizontalAlign.Start)
              }
              .justifyContent(FlexAlign.Center)
              .padding(8)
            }

            ListItem() {
              Row() {
                Image($rawfile("images/yisheng.png"))
                  .width(60)
                  .height(60)
                  .borderRadius('50%')
                Column({
                  space: 4
                }) {
                  Text("李书一")
                  Text("主治医生")
                  Text("北京协和医院")
                }
                .layoutWeight(1)
                .alignItems(HorizontalAlign.Start)
              }
              .justifyContent(FlexAlign.Center)
              .padding(8)
            }

            ListItem() {
              Row() {
                Image($rawfile("images/yisheng.png"))
                  .width(60)
                  .height(60)
                  .borderRadius('50%')
                Column({
                  space: 4
                }) {
                  Text("李书一")
                  Text("主治医生")
                  Text("北京协和医院")
                }
                .layoutWeight(1)
                .alignItems(HorizontalAlign.Start)
              }
              .justifyContent(FlexAlign.Center)
              .padding(8)
            }

          }
          .lanes(2)
        }
        .backgroundColor("#fff")
        .padding(12)
        .borderRadius(4)

        // 专家科普
        Column() {
          Row() {
            Text("专家科普")
              .fontSize(20)
            // .fontWeight(FontWeight.Bold)
            Text("查看更多>>")
              .fontColor("#999")
          }
          .justifyContent(FlexAlign.SpaceBetween)
          .width('100%')

          List() {
            ListItem() {
              Column() {
                Row() {
                  Image($rawfile("images/yisheng.png"))
                    .width('20%')
                  Column() {
                    Text("耳后长出的小肉球，到底是啥啊？")
                      .width('100%')
                    Row() {
                      Text("2024-11-13")
                        .fontSize(12)
                        .fontColor("#999")
                      Text("阅读: 657 赞: 98")
                        .fontSize(12)
                        .fontColor("#999")
                    }
                    .justifyContent(FlexAlign.SpaceBetween)
                    .width('100%')
                  }
                  .height(56)
                  .justifyContent(FlexAlign.SpaceBetween)
                  .layoutWeight(1)
                  .padding(4)
                }

                Divider()
                  .width('100%')
                  .height(1)
                  .color("#999")
              }
              .padding(12)
            }
          }
        }
        .backgroundColor("#fff")
        .padding(12)
        .borderRadius(4)

      }
      .backgroundColor("#7af8f8f8")
      .width('100%')
      .borderRadius(4)
    }
    .scrollable(ScrollDirection.Vertical)
    .scrollBar(BarState.Off)
  }
}