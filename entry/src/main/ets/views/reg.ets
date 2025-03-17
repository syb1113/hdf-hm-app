import { AppMainColor } from "../constant/colors"
import { AppRouterMap } from "../constant/router"
import { UserDataInfo } from "../modules/UserData"
import { uploadFileToServer } from '../utils/fileUpload'
import { common } from '@kit.AbilityKit'
import inputMethod from '@ohos.inputMethod'
import dayjs from "dayjs"
import { router } from '@kit.ArkUI'
import { showToast } from "../utils/showToast"
import { rcpPost, baseUrl } from "../utils/http"

let im = inputMethod.getController()

@Component
export struct RegView{
  @State imgSrc: string = ""
  @State uploadShow: boolean = true
  // 控制日期选择的显示隐藏
  @State isLunar: boolean = false
  // 控制性别选择的显示隐藏
  @State isSex: boolean = false
  private select: number = 1
  private apfruits: string[] = ['男', '女']
  // 防止多次点击
  @State notClick: boolean = true
  private selectedDate: Date = new Date('2000-11-09')
  pageStack: NavPathStack = new NavPathStack()
  @State RegUserData: UserDataInfo = {
    userName: "", //用户名
    password: "", //密码
    birthday: "", //生日
    age: "", //年龄
    avatar: "", //头像
    area: "", //楼栋信息
    address: "", //详细地址门派信息
    nickName: "", //昵称
    gender: ""//性别
  }
  @Require pathStack: NavPathStack | undefined

  selectDialog() {
    this.isLunar = false;
    this.isSex = false;
  }

  RegToServer() {

  }
  build() {
    NavDestination() {
      Column({
        space: 16
      }) {
        Row() {
          Image($rawfile("images/ic_public_arrow_left_filled.svg")).width(35)
            .onClick(() => {
              router.replaceUrl({
                url: "pages/LoginPage"
              })
            })
          Text("用户注册")
        }
        .width("100%")
        .border({
          width: { bottom: 1 },
          color: { bottom: "#eee" }
        })
        .padding({ bottom: 2 })

        Column() {
          Image(this.RegUserData.avatar)
            .width(80)
        }
        .borderRadius("50%")
        .clip(true)
        .width(80)
        .height(80)
        .backgroundImage($rawfile("images/jia.png"), ImageRepeat.Y)
        .backgroundImageSize({ width: 80, height: 80 })
        .onClick(() => {
          const context = getContext() as common.Context // 当前上下文
          uploadFileToServer(baseUrl + '/api/v1/common/upload_file', context, (res) => {
            if (res) {
              console.log(JSON.stringify(res))
              this.RegUserData.avatar = baseUrl + res!["data"]
            } else {
              console.log("上传文件失败")
            }
          })
        })
        .visibility(this.uploadShow ? Visibility.Visible : Visibility.Hidden)

        Text("点击上传用户头像").fontSize(14)
        TextInput({
          placeholder: "请输入用户名",
          text: $$this.RegUserData.userName
        })
          .onFocus(() => {
            this.selectDialog()
          })
        TextInput({
          placeholder: "请输入昵称",
          text: $$this.RegUserData.nickName
        })
          .onFocus(() => {
            this.selectDialog()
          })
        TextInput({
          placeholder: "请输入密码",
          text: $$this.RegUserData.password
        }).type(InputType.Password)
          .onFocus(() => {
            this.selectDialog()
          })
        TextInput({
          placeholder: "请输入楼栋",
          text: $$this.RegUserData.area
        })
          .onFocus(() => {
            this.selectDialog()
          })
        TextInput({
          placeholder: "请输入详细地址门派信息",
          text: $$this.RegUserData.address
        })
          .onFocus(() => {
            this.selectDialog()
          })

        TextInput({
          placeholder: '请选择生日',
          text: $$this.RegUserData.birthday
        })
          .onFocus(() => {
            this.isLunar = true;
            this.isSex = false;
            im.stopInputSession()
          })
        TextInput({
          placeholder: '请选择性别',
          text: $$this.RegUserData.gender
        })
          .onFocus(() => {
            this.isSex = true;
            this.isLunar = false;
            im.stopInputSession()
          })
        Button('注册')
          .width('80%')
          .onClick(() => {
            if (this.RegUserData.userName != "" && this.RegUserData.password != "" && this.RegUserData.nickName != "") {
              if (this.notClick) {
                this.RegToServer()
              }
            } else {
              if (this.RegUserData.userName == "") {
                let ShowToast = new showToast("用户名不能为空")
                ShowToast.ShowToast()
              } else if (this.RegUserData.password == "") {
                let ShowToast = new showToast("密码不能为空")
                ShowToast.ShowToast()
              } else if (this.RegUserData.nickName == "") {
                let ShowToast = new showToast("昵称不能为空")
                ShowToast.ShowToast()
              }
            }

          })
        // 性别选择
        if (this.isSex && this.isLunar == false) {
          TextPicker({ range: this.apfruits, selected: this.select })
            .onChange((value: string | string[], index: number | number[]) => {
              this.RegUserData.gender = value.toString()
            })
        }
        // 日期选择
        if (this.isLunar && this.isSex == false) {
          DatePicker({
            start: new Date('1970-1-1'),
            end: new Date('2100-1-1'),
            selected: this.selectedDate
          })
            .disappearTextStyle({ color: Color.Gray, font: { size: '16fp', weight: FontWeight.Bold } })
            .textStyle({ color: '#ff182431', font: { size: '18fp', weight: FontWeight.Normal } })
            .selectedTextStyle({ color: '#ff0000FF', font: { size: '26fp', weight: FontWeight.Regular } })
            .onDateChange((value: Date) => {
              const newYear = new Date()
              this.RegUserData.age = (dayjs(newYear).year() - dayjs(value).year()).toString()
              // console.log(this.RegUserData.age)
              this.selectedDate = value
              this.RegUserData.birthday = dayjs(value).format("YYYY-MM-DD")
            })
        }
      }
      .padding(20)
      .height('100%')
      .width('100%')
    }
    .onReady(context=>{
      this.pathStack = context.pathStack
    })
  }
}