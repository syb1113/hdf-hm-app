@Component
export struct DoctorsView {
  build() {
    NavDestination() {
      Column() {
        //
        Search({
          placeholder:'请输入关键词'
        })
          .borderRadius(4)
        List() {
          ForEach([1, 2, 3, 4, 5, 6, 7], (item: number) => {
            ListItem() {
              Column({
                space: 8
              }) {
                Row() {
                  Image($rawfile("images/yisheng.png"))
                    .width(100)
                  Column({
                    space: 4
                  }) {
                    Text("时岩")
                    Text("空军军医大学西京医院")
                    Row(){
                      Text("皮肤性病科")
                      Text("副主任医师")
                    }
                    Row(){
                      Text("医学研究者")
                      Text(" 全科医生")
                    }
                  }.layoutWeight(1)
                  .alignItems(HorizontalAlign.Start)
                  .padding(4)
                }
                Divider()
                  .width('100%')
                  .color('#999')
                  .height('1px')
              }
              .padding(8)
              .backgroundColor("#fff")
            }
          }, (item: number) => item + "")
        }
      }
      .padding(4)
    }
    .title("医生列表")

  }
}