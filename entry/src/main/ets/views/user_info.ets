import { picker } from '@kit.CoreFileKit'

@Component
export struct UserInfoView {
  build() {
    Column() {
      Text("修改个人信息")
      Button("修改头像")
        .onClick(()=>{
          const documentPicker = new picker.DocumentViewPicker();
          documentPicker.select({

          })
            .then(res=>{
              console.log(res[0])
            })

        })
    }
  }
}