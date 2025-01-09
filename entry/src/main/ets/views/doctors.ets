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
                  Text("北京协和医院")
                  Text("北京市xx路xx号")
                  Row(){
                    Text("公有")
                    Text("三甲")
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
        }
      }
      .padding(4)
    }
    .title("医生列表")

  }
}