import { common } from "@kit.AbilityKit"
import { picker } from "@kit.CoreFileKit"
import { rcp } from "@kit.RemoteCommunicationKit"
import fs from '@ohos.file.fs';

/**
 * 文件上传
 * @param serverUrl   服务器端上传接口的地址
 * @param paramsName  服务器端接收的数据的属性名
 * @param context     上下文
 * @param cb          回调函数，上传之后的结果
 */
export function uploadFileToServer(serverUrl: string,  context: common.Context, cb: (str:object | null)=>void) {

  // picker
  // 手机中的文件系统
  //  系统文件，操作系统自己的文件
  //  用户文件，当前用户的文件
  //  应用安全沙箱文件，当前app的文件
  //    我们的代码能访问应用安全沙箱的文件、一部分系统和用户文件
  //    如果我们要访问系统或者用户的文件，要么进行授权、要么进行文件复制或者移动
  const pickFile = new picker.DocumentViewPicker(context)
  pickFile.select({
    maxSelectNumber: 1, // 最大选择数量
    // fileSuffixFilters: ['.jpg', '.png']
  }).then(res => {
    // console.log(res.toString())

    const tmpFilePath = context.cacheDir + "/11" + Date.now() + ".jpg" // 我们后期上传的文件是我们的临时文件
    const file = fs.openSync(res[0]) // 打开文件
    try {
      fs.copyFileSync(file.fd, tmpFilePath) // 文件复制，把我刚才打开的文件复制到一个临时存储的路径
    } catch (err) {
      console.log("文件复制出错了")
    }
    const session = rcp.createSession({
      headers: {
        "content-type": "multipart/form-data" // 设置我们请求体中的数据是一个FormData，用来做文件上传
      }
    })
    // let fromFile: rcp.UploadFromFile = {
    //   fileOrPath: tmpFilePath,
    // }
    let formData: rcp.MultipartForm = new rcp.MultipartForm({
      // 此处的file是服务器端介绍的数据的属性名，需要你自己手动改一下
      file: {
        remoteFileName: '22.jpg',
        contentOrPath: tmpFilePath,
        contentType: 'image/png'
      }
    })
    // 参数一 表示接口地址
    // 参数二 表示文件内容
    session.post(serverUrl, formData)
      .then(res => {
        return res.toJSON()
      })
      .then(res => {
        // console.log(JSON.stringify(res))
        cb(res!)
      })
      .catch((err: Error) => {
        console.log("err")
        cb(null)
      })
  })
}