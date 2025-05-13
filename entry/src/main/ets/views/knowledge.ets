@Component
export struct KnowledgeView {
  build() {
    Column({space: 8}) {
      Search({
        placeholder: '请输入关键词'
      })
      List() {
        ForEach([1, 2, 3, 4, 5,6,7,8,9,10,11,12,13], (item: number) => {
          ListItem() {
            Column() {
              Row() {
                Image($rawfile("images/yisheng.png"))
                  .width('20%')
                Column() {
                  Text("耳后长出的小肉球，到底是啥啊？")
                    .width('100%')
                  Text("健康作息")
                    .fontSize(12)
                    .alignSelf(ItemAlign.Start)
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
        }, (item: number) => item + "")

      }
      .layoutWeight(1)
    }
    .width('100%')
    .height('100%')
  }
}