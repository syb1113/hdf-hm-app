import { common } from '@kit.AbilityKit';
import { picker } from '@kit.CoreFileKit';
import fs from '@ohos.file.fs';
import { rcp } from '@kit.RemoteCommunicationKit';

/**
 * 文件上传
 * @param serverUrl   服务器端上传接口的地址
 * @param paramsName  服务器端接收的数据的属性名
 * @param context     上下文
 * @param cb          回调函数，上传之后的结果
 */
export function uploadFileToServer(serverUrl: string, context: common.Context, cb: (str: object | null) => void) {
  const pickFile = new picker.DocumentViewPicker(context)
  pickFile.select({
    maxSelectNumber: 1, // 最大选择数量
  }).then(res => {
    const tmpFilePath = context.cacheDir + "/11" + Date.now() + ".jpg" // 后期上传的文件是我临时文件
    const file = fs.openSync(res[0]) // 打开文件
    try {
      fs.copyFileSync(file.fd, tmpFilePath) // 文件复制，把刚才打开的文件复制到一个临时存储的路径
    } catch (err) {
      console.log("文件复制出错了")
    }
    const session = rcp.createSession({
      headers: {
        "content-type": "multipart/form-data" // 设置请求体中的数据是一个FormData，用来做文件上传
      }
    })
    let formData: rcp.MultipartForm = new rcp.MultipartForm({
      // 此处的file是服务器端介绍的数据的属性名
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
        cb(res!)
      })
      .catch((err: Error) => {
        console.log("err")
        cb(null)
      })
  })
}
