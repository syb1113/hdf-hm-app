import { rcpGET,baseUrl } from '../utils/http'
import { HospitalInfo } from '../module/hospitalModule'
import { getHospitalInfo } from '../api/hospitalApi'
import { promptAction, router } from '@kit.ArkUI'
@Extend(Text)
function style() {
  .width('100%')
  .margin({bottom:5})
}
@Component
export struct HospitalsView {
  @State currenIndex: number = 0
  @State hospitalInfoData: HospitalInfo[] = []
  // 传给子组件的数据
  aboutToAppear(): void {
    getHospitalInfo()
      .then(res => res.toJSON())
      .then(async res => {
        this.hospitalInfoData = res!["data"]
      })
  }
  build() {
    NavDestination() {
      Column() {
        //
        Search({
          placeholder:'请输入关键词'
        })
          .borderRadius(4)
        List() {
          ForEach(this.hospitalInfoData, (item: HospitalInfo) => {
            ListItem() {
              Column({
                space: 8
              }) {
                Row() {
                  Image(baseUrl+item.image)
                    .width(100)
                  Column({
                    space: 4
                  }) {
                    Text(item.name)
                      .style()
                    Text(item.address)
                      .style()
                    Text(item.phone)
                      .style()
                    Row(){
                      Text(item.desc)
                        .textOverflow({ overflow: TextOverflow.Ellipsis })
                        .maxLines(1)
                        .style()
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
          }, (item: HospitalInfo) => item.id)
        }
      }
      .padding(4)
    }
    .title("医院列表")

  }
}